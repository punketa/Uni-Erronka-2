# Pluginak

Github repo bat sortu dut plugina garatzeko: [https://github.com/punketa/plugins\_wordpress\_unipayo](https://github.com/punketa/plugins_wordpress_unipayo)

### &#x20;Zer egin behar da?

Arduino bat dugu gelan, arduino horrek hainbat sentsore ditu eta jarri dugu 5 minuturo datuak hartzea eta datu basera bidaltzea. Datu base horretatik datuak hartzen ditugu eta pluginen bidez web orrian aurkezten dugu.

#### Lehen plugina:

Plugin hau taula bat da eta bertan azken 5, 10, 15 edo 20 datuak erakusten dira. Horrez gain, SELECT bat du erabiltzaileak data mugak jartzeko eta bakarrik egun horietako datuak jartzeko.

\*Kodeak daude azalduta taldekoak ulertzeko\*

Hemen bere php:

```
<?php
/**
 * Plugin Name: Sensor Reader
 * Author: UniPayo
 * Description: Taula orriekin sailkatuta, data filtroa eta errenkada kantitatea aukeratzeko.
 * Version: 1.2
 */

//Kodea azalduta por mi, (chatgpt me ayudo)

//QUE HACE ESTO?
//EN RESUMEN ESTE CODIGO HACE EL HTML, RECIBE LOS FILTROS QUE LE METEMOS, SE CONECTA CON LA BASE DE DATOS, HACE LA CONSULTA Y NOS TRAE EL RESULTADO DE LA CONSULTA
//BASICAMENTE ES EL QUE HABLA CON LA BASE DE DATOS

//hauxe dago por seguridad, nonor ahalegintzen bada artxibo hau wordpressetik zuzenean ejekutatzen bokleatu egingo du.
if (!defined('ABSPATH')) exit;


//Lehenik, CARGAR APP.JS que esta en la otra carpetita
function sr_cargar_scripts() {

    //kargamos el archivo js
    wp_enqueue_script(
        'sr-app',
        plugin_dir_url(__FILE__) . 'js/app.js', //js helbidea
        array('jquery'),    //script honek jquery beharko du
        false,              //ez du zehazten zein bertsio
        true                //orriaren amaieran kargatzen du </body> aurretik (mitik de poner el js al final)
    );

    //honek baimentzen du datuak PHP-tik JS-ra pasatzea 
    wp_localize_script('sr-app', 'sr_ajax', array(
        'ajax_url' => admin_url('admin-ajax.php')   //URL-a donde wordpress acepta las peticiones del ayax (sinmas es un archivo php q viene x defecto q esta en la carpeta wp-admin)
    ));
}
add_action('wp_enqueue_scripts', 'sr_cargar_scripts');


// Hemen , el shortcode [sensor_reader]
function sr_shortcode() {
    ob_start(); //aqui empezamos con el html pa ponerlo bonico
?>
    <!--nunca habia puesto comentarios asi en html lol -->
    <h2>Sentsoreen datuak</h2> 

    <!--Data filtroa egiteko -->
    <div style="margin-bottom:15px;">
        <label>Data hasiera:</label>
        <input type="date" id="sr_date_from">

        <label style="margin-left:10px;">Data amaiera:</label>
        <input type="date" id="sr_date_to">

    <!--Hauxe errankada kopurua ezartzeko, q si no ocupa toda la pantalla y me rayo ademas d q tarda un pokillo -->
        <label style="margin-left:10px;">Errenkadak:</label>
        <select id="sr_limit">
            <option value="5">5</option>
            <option value="10" selected>10</option>
            <option value="15">15</option>
            <option value="20">20</option>
        </select>

    <!--Botoiak -->    
        <button id="sr_filtrar" style="margin-left:10px;">Filtratu</button>
        <button id="sr_reset">Reset</button>
    </div>

    <!--Taula -->
    <table id="sr_tabla" border="1" style="margin-top:10px; border-collapse:collapse;">
        <thead>
            <tr>
                <th>ID</th>
                <th>Data</th>
                <th>Tenperatura</th>
                <th>Hezetasuna</th>
                <th>Soinua</th>
                <th>Detektatuta</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>

    <!--Orrien bitartez sailkatzeko -->
    <div id="sr_paginacion" style="margin-top:10px;">
        <button id="sr_anterior" disabled>← Aurrekoa</button>
        <span id="sr_pagina_actual">1</span>
        <button id="sr_siguiente">Hurrengoa →</button>
    </div>

    <?php
    return ob_get_clean(); //devuelve todo lo q escribimos como html para mostrarlo con el shortcode
}
add_shortcode('sensor_reader', 'sr_shortcode');


//ola, vengo del app.js, ejecutame la funcion de sr_get_data pls

add_action('wp_ajax_sr_get_data', 'sr_get_data'); //este pa users logeados en wp
add_action('wp_ajax_nopriv_sr_get_data', 'sr_get_data'); //y este pa no logeados en wp


function sr_get_data() {

    //estos son los datos q mandamos desde el js, es decir el filtro
    $pagina = isset($_POST['pagina']) ? intval($_POST['pagina']) : 1;   //dice la pagina actual de la taula
    $limit = isset($_POST['limit']) ? intval($_POST['limit']) : 10; //la cantidad de filas q pedimos
    $offset = ($pagina - 1) * $limit; //la decimos q empieze por la fila 1
    $df = isset($_POST['date_from']) ? $_POST['date_from'] : ''; //dataren filtroak     
    $dt = isset($_POST['date_to'])   ? $_POST['date_to']   : ''; //dataren filtroak

    //mariadb-rekin konexioa (de normal estaria en la personal-php, pero nerea me dijo q asi tambien esta bien)
    $db = new wpdb('adrian', 'Admin123', 'arduino_db', '192.168.71.202');
    //como estamos pasando los datos desde la compu d igor a la base de datos de adrian y de su db a wordpress estamos usando el remoto de mariadb

    if ($db->last_error) {
        echo json_encode(['error' => $db->last_error]); //por si falla la konexion
        wp_die();
    }

    // construimos el filtro (where)
    $where = " WHERE 1=1 "; //digamos q vamos a añadir el filtro con un AND sin romper la query (tipo de normal un AND lleva algo antes y ese algo es la condicion inicial q le ponemos al where, q en este caso sera q las horas q conforman 1 dia, de 00:00 a 23:59, sin mas q es fundamental para q funcione la query )
    if ($df) $where .= $db->prepare(" AND data >= %s", $df . " 00:00:00");
    if ($dt) $where .= $db->prepare(" AND data <= %s", $dt . " 23:59:59");

    // esto cuenta cuantos datos si cumplen la condicion de antes del where (para q? ps para calcular el total de paginas q necesitara las taula en donde estaran los datos, estaba pensando usar eso para tambien poner como un contador d cuantos registros cumplen el where, capaz lo hago si no ni caso a esto xd)
    $total = $db->get_var("SELECT COUNT(*) FROM Datuak $where");

    // pedir los datos al mariadb
    $rows = $db->get_results("
        SELECT id, data, temperatura, hezetasuna, soinua, detektatuta
        FROM Datuak
        $where
        ORDER BY data DESC
        LIMIT $limit OFFSET $offset
    ", ARRAY_A);

    //respuesta de la query hicimos en json
    echo json_encode([
        'rows' => $rows,
        'pagina' => $pagina,
        'total_paginas' => ceil($total / $limit)
    ]);

    wp_die(); //y acabamos ajax
}
//(vale de aqui debemos ir d vuelta al app.js)
```

y su javascript:

```
jQuery(document).ready(function ($) {
    //Y QUE HACE ESTO?
    //ESTO MIRA SI EL Q ESTA VIENDO LA PAGINA QUIERE FILTRAR, SI QUIERE FILTRAR LLAMA AL PHP PARA Q LE DE LOS DATOS NUEVOS, ESPERA LA RESPUESTA DE DE LA CONSULTA, RELLENA EL HTML CON ESOS DATOS
    //BASICAMENTE ES EL QUE SE ENCARGA DE MOSTRAR LOS DATOS

    //variables inicialess
    let pagina = 1; //es la pagina actual
    let totalPaginas = 1; //es el total de paginas q devolveremos

    //okei ps vamos con el js, aqui cargamos lo q nos pide el usuario q esta viendo la pagina
    function cargar() {

        let limit = $("#sr_limit").val(); //las  filas q mostraremos (coge la opcion q escogemos entre 5, 10, 15, 20)
        let df = $("#sr_date_from").val();  //hasierako data (coge la id del input)
        let dt = $("#sr_date_to").val();    //amaierako data (coge la id del input)

        //aqui hacemos la peticion al wordpress: 
        $.ajax({
            url: sr_ajax.ajax_url, //
            method: "POST",
            data: {
                action: "sr_get_data", //aqui decimos ejecuta la funcion sr_get_data del php !!!
               //y le mandamos estos datos
                pagina: pagina,
                limit: limit,
                date_from: df,
                date_to: dt
            },
            //(ahora vamos al index.php)
            //ola, volvi de index.php
            //y si lee bien el json q enviamos en el index.php lo convierte en un objeto usable para js
            success: function (resp) {

                let datos = JSON.parse(resp);
                //y si no ps muestra el error
                if (datos.error) {
                    alert("ERROR: " + datos.error);
                    return;
                }

                let tbody = $("#sr_tabla tbody");
                tbody.empty(); //esto vacia la tabla

                //y aqui inserta los datos recibos de la base de datos y los inserta en cada fila
                datos.rows.forEach(fila => {
                    tbody.append(`
                        <tr>
                            <td>${fila.id}</td>
                            <td>${fila.data}</td>
                            <td>${fila.temperatura}</td>
                            <td>${fila.hezetasuna}</td>
                            <td>${fila.soinua}</td>
                            <td>${fila.detektatuta}</td>
                        </tr>
                    `);
                });

                //actualiza las paginas
                totalPaginas = datos.total_paginas; 

                $("#sr_pagina_actual").text(pagina);
                $("#sr_anterior").prop("disabled", pagina <= 1);
                $("#sr_siguiente").prop("disabled", pagina >= totalPaginas);
            }
        });
    }


    // Botoiak (dependiendo de estos botones cambiara la informacion)

    //si estas en la pagina 2 y queieres volver atras ps resta 1
    $("#sr_anterior").click(function () {
        if (pagina > 1) {
            pagina--;
            cargar(); //hace la funcion q esta arriba
        }
    });

    //si estas en la pagina 1 y queieres ir al siguiente ps suma 1
    $("#sr_siguiente").click(function () {
        if (pagina < totalPaginas) {
            pagina++;
            cargar(); //hace la funcion q esta arriba
        }
    });

    //al filtrar t lleva a la pagina 1 (es logico q t lleve ahi)
    $("#sr_filtrar").click(function () {
        pagina = 1;
        cargar(); //hace la funcion q esta arriba
    });

    //reseteo, devuelve los filtros a como estaban y t lleva a la pagina 1
    $("#sr_reset").click(function () {
        $("#sr_date_from").val("");
        $("#sr_date_to").val("");
        pagina = 1;
        cargar(); //hace la funcion q esta arriba
    });

    //cuando cambias la cantidad de filas, ps te lleva de vuelta a la pagina 1
    $("#sr_limit").change(function () {
        pagina = 1;
        cargar(); //hace la funcion q esta arriba
    });

    //hace la funcion q esta arriba 
    cargar();
});
```

<figure><img src="../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

#### Bigarren plugina:

Bigarren plugina grafiko bat insertatzen hautatutako datuen arabera. Datu horiek beste SELECT baten bidez aukeratzen dira. Select hau eguna eta ordua aukeratzea ahalbidetzen du, datu asko baitira grafikoa itxuzia geratzen delako.

Bere php:

```
<?php
/**
 * Plugin Name: Sensor Reader Chart
 * Author: UniPayo
 * Description: Tenperatura eta hezetasunaren grafikoa, eguna eta orduaren filtroarekin.
 */

//Kodea azalduta por mi, (chatgpt me ayudo)

//QUE HACE ESTO?
//EN RESUMEN ESTE CODIGO HACE EL HTML, RECIBE LOS FILTROS QUE LE METEMOS, SE CONECTA CON LA BASE DE DATOS, HACE LA CONSULTA Y NOS TRAE EL RESULTADO DE LA CONSULTA
//BASICAMENTE ES EL QUE HABLA CON LA BASE DE DATOS

if (!defined('ABSPATH')) exit;

//Hay muchas cosas q son igual al anterior, ns si voy a comentar todo, a lo mejor lo distinto

//Lehenik, CARGAR APP.JS que esta en la otra carpetita
function src_cargar_scripts() {

    // cargar Chart.js desde la libreria
    wp_enqueue_script(
        'src-chartjs',
        'https://cdn.jsdelivr.net/npm/chart.js',
        array(),
        false,
        true
    );

    // kargamos el archivo js
    wp_enqueue_script(
        'src-app',
        plugin_dir_url(__FILE__) . 'js/app.js',
        array('jquery', 'src-chartjs'),
        false,
        true
    );

    //honek baimentzen du datuak PHP-tik JS-ra pasatzea
    wp_localize_script('src-app', 'src_ajax', array(
        'ajax_url' => admin_url('admin-ajax.php')
    ));
}
add_action('wp_enqueue_scripts', 'src_cargar_scripts');


// Shortcode [sensor_reader_chart]
function src_shortcode() {
    ob_start(); //aqui empezamos con el html pa ponerlo bonico
    ?>

    <h2>Sentsoreen Grafikoa</h2>

    <div style="margin-bottom:15px;">
        <label>Data:</label>
        <input type="date" id="src_date">

        <label style="margin-left:10px;">Ordua:</label>
        <select id="src_hour">
            <option value="">-- Denak --</option>
            <?php for ($h = 0; $h < 24; $h++): ?>
                <option value="<?php echo $h; ?>">
                    <?php echo sprintf("%02d", $h); ?>:00
                </option>
            <?php endfor; ?>
        </select>

        <button id="src_filtrar" style="margin-left:10px;">Filtratu</button>
        <button id="src_reset">Reset</button>
    </div>

    <canvas id="src_canvas" height="100"></canvas>

    <?php
    return ob_get_clean(); //devuelve todo lo q escribimos como html para mostrarlo con el shortcode
}
add_shortcode('sensor_reader_chart', 'src_shortcode');


//ola, vengo del app.js, ejecutame la funcion de sr_get_data pls
add_action('wp_ajax_sr_get_chart', 'sr_get_chart');
add_action('wp_ajax_nopriv_sr_get_chart', 'sr_get_chart');


function sr_get_chart() {

    //estos son los datos q mandamos desde el js, es decir el filtro
    $date = $_POST['date'] ?? '';
    $hour = $_POST['hour'] ?? '';

    //mariadb-rekin konexioa
    $db = new wpdb('adrian', 'Admin123', 'arduino_db', '192.168.71.202');

    if ($db->last_error) {
        echo json_encode(['error' => $db->last_error]);
        wp_die();
    }

    // construimos el filtro (where)
    $where = " WHERE 1=1 ";

    if ($date && $hour !== "") {
        // eguna + ordua
        $start = sprintf("%s %02d:00:00", $date, $hour);
        $end   = sprintf("%s %02d:59:59", $date, $hour);

        $where .= $db->prepare(" AND data >= %s AND data <= %s ", $start, $end);

    } else if ($date) {
        // bakarrik egun osoa
        $where .= $db->prepare("
            AND data >= %s 
            AND data <= %s
        ", $date . " 00:00:00", $date . " 23:59:59");
    }

    // pedir los datos al mariadb
    $rows = $db->get_results("
        SELECT data, temperatura, hezetasuna
        FROM Datuak
        $where
        ORDER BY data ASC
    ", ARRAY_A);

     //respuesta de la query hicimos en json
    echo json_encode(['rows' => $rows]);
    wp_die(); //y acabamos ajax
}
//(vale de aqui debemos ir d vuelta al app.js)
```

Bere javascript:

```
jQuery(document).ready(function ($) {
    //Y QUE HACE ESTO?
    //ESTO MIRA SI EL Q ESTA VIENDO LA PAGINA QUIERE FILTRAR, SI QUIERE FILTRAR LLAMA AL PHP PARA Q LE DE LOS DATOS NUEVOS, ESPERA LA RESPUESTA DE DE LA CONSULTA, RELLENA EL GRAFIKO CON ESOS DATOS
    //BASICAMENTE ES EL QUE SE ENCARGA DE MOSTRAR LOS DATOS

    //variables inicialess
    let chart = null;

    //okei ps vamos con el js, aqui cargamos lo q nos pide el usuario q esta viendo la pagina
    function cargarGrafico() {

        
        let fecha = $("#src_date").val();
        let hora  = $("#src_hour").val();

        //aqui hacemos la peticion al wordpress: 
        $.ajax({
            url: src_ajax.ajax_url,
            method: "POST",
            data: {
                action: "sr_get_chart", //aqui decimos ejecuta la funcion sr_get_data del php !!!
                //y le mandamos estos datos
                date: fecha,
                hour: hora
            },
            //(ahora vamos al index.php)
            //ola, volvi de index.php
            //y si lee bien el json q enviamos en el index.php lo convierte en un objeto usable para js
            success: function (resp) {

                let datos = JSON.parse(resp);
                //y si no ps muestra el error
                if (datos.error) {
                    alert("ERROR: " + datos.error);
                    return;
                }

                let rows = datos.rows;

                let labels = rows.map(r => r.data);
                let temps  = rows.map(r => Number(r.temperatura));
                let hums   = rows.map(r => Number(r.hezetasuna));

                let ctx = document.getElementById("src_canvas");

                // Si ya existe un gráfico lo borra
                if (chart !== null) chart.destroy();

                // grafikoa sortzen du
                chart = new Chart(ctx, {
                    type: "line",
                    data: {
                        labels: labels,
                        datasets: [
                            {
                                label: "Tenperatura (°C)",
                                data: temps,
                                borderWidth: 2,
                                borderColor: "red",
                                backgroundColor: "rgba(255,0,0,0.2)",
                                pointRadius: 3,
                                tension: 0.3
                            },
                            {
                                label: "Hezetasuna (%)",
                                data: hums,
                                borderWidth: 2,
                                borderColor: "blue",
                                backgroundColor: "rgba(0,0,255,0.2)",
                                pointRadius: 3,
                                tension: 0.3
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        interaction: {
                            intersect: false,
                            mode: "index"
                        },
                        scales: {
                            x: {
                                ticks: { maxRotation: 45, minRotation: 45 }
                            }
                        }
                    }
                });

            }
        });
    }

    // Botoiak (dependiendo de estos botones cambiara la informacion)
    $("#src_filtrar").click(cargarGrafico);
    //reseteo, devuelve los filtros a como estaban
    $("#src_reset").click(() => {
        $("#src_date").val("");
        $("#src_hour").val("");
        cargarGrafico();
    });

    //hace la funcion de cargar grafiko 
    cargarGrafico();
```

<figure><img src="../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>
