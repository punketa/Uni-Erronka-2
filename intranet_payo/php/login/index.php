<?php
header('Content-Type: application/json; charset=utf-8');

session_start(); //hemen saioa hasten dugu (persistentzia)

//simple, konexioa db-arekin (nos lo da iker)
//ponemos los datillos
$host = 'localhost';
$db   = 'intranet';
$user = 'inadmin';
$pass = 'Admin123';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

//hemen konexioa egiten dugu
try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Konexio arazoa']); //hau errore bat badago, por si acaso
    exit;
}

//(aqui seguimos en donde lo dejamos en el js) js-tik datorren json-a jasotzen dugu.
$rawData = file_get_contents("php://input"); 
$json = json_decode($rawData); //hemen jasotako json-a berriz objektu bat bilakatzen dugu. (Lo pasamos a objeto para tener sus CLAVES y sus VALORES, si recibimos un json recibimos solo texto y no nos vale)

$param = $json->param ?? null; //entramos al objeto param

if (!$param) {
    echo json_encode(['success' => false, 'message' => 'Ez dago parametrorik']); //sinmas, por si esta vacio
    exit;
}

//estos son los datos que recibimos
$username = $param->erabiltzailea;
$password = $param->pasahitza;

// kontsulta egiten diogu db-eri
$sql = "SELECT * FROM erabiltzaileak WHERE erabiltzailea = :erabiltzailea"; //oyee buscame este user 
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':erabiltzailea', $username, PDO::PARAM_STR); //aqui hacemos la relacion del parametro erabiltzaile con la variable username
$stmt->execute();

$user = $stmt->fetch(); //nos pasa el user

//una vez tenemos el user, pasahitza konfirmatzen dugu (cogemos primero el user para verificar, como usamos hash, es mas seguro de esta manera)
//hauxe da, kontsularen erantzuna
if ($user && password_verify($password, $user['pasahitza'])) {
    //hemen saioa sortzen da
    $_SESSION['user'] = $username;
    $_SESSION['userid'] = $user['id'];
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}
?>