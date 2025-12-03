//Voy a intentar explicar el codigo con lo que pillo, perdon por el euskera pero estaba motivao

// LOGIN

//login.html orrian saioa hasi botoia sakatzerakoan, inputs barruan sartutako datuak irakurtzen ditu eta variable batzuk sortzen ditu euren balioekin.
document.getElementById("loginBotoia")?.addEventListener("click", () => {
    var username = document.getElementById("erabiltzailea").value;
    var password = document.getElementById("pasahitza").value;

    //hemen objektu bat sortzen dugu, param izenekoa. Direis q es un objeto? Ps da a lo kontenedore bat eta barruan claveak eta valoreak sartu dezakegu. NO CONFUNDIR CON STRING. String bakarrik textua dauka eta ez dago estrukturatuta. Creo q en program hicimos algo asi con joseba, lo de los alumnos y las notas.
    const param = {
        erabiltzailea: username, //el parametro o clave es erabiltzaile y su valor username. (el parametro puede ser el nombre que queramos, pero el valor tiene q ser la variable que definimos arriba)
        pasahitza: password
    };

    //hemen json bidaltzen dugu zerbitzariari.
    fetch("php/login/index.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" }, //hemen jartzen dugu  json bezala nahi dugula. Para que entendais, hemos puesto los datos con valores en un objeto, pero eso no podemos pasarlo asi como asi, entonces lo pasamos a JSON (json si es un string, es decir solo tiene texto)
        body: JSON.stringify({ param: param }) //mandamos el objeto param al php del login. (si quereis seguir la explicacion paso a paso ir al php del login)
    })
    .then(res => res.json()) // una vez recibido el la respuesta del json anterior (succes= true o false) ps nos va dejar acceder a hasiera.html o nos dira el error 
    .then(data => {
        if (data.success) {
            window.location.href = "hasiera.php";
        } else {
            alert("Erabiltzailea edo Pasahitza okerra da.");
        }
    })
    .catch(err => console.error(err));
});


//REGISTRO
//esto es clavao al anterior.
document.getElementById("registerbotoia")?.addEventListener("click", () => {
    var username = document.getElementById("erabBerria").value;
    var email = document.getElementById("emailBerria").value;
    var password = document.getElementById("pasBerria").value;

    const param = {
        erabiltzailea: username,
        email: email,
        pasahitza: password
    };

    fetch("php/register/index.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ param: param })
    })
    .then(res => res.json())
    .then(data => {
        alert(data.message);
        if (data.success) {
            window.location.href = "login.html";
        }
    })
    .catch(err => console.error(err));
});
