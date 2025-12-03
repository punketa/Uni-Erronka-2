<?php
header('Content-Type: application/json; charset=utf-8');

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
    echo json_encode(['success' => false, 'message' => 'Konexio arazoa']);  //hau errore bat badago, por si acaso
    exit;
}

//(aqui seguimos en donde lo dejamos en el js) js-tik datorren json-a jasotzen dugu.
$rawData = file_get_contents("php://input"); 
$json = json_decode($rawData); //hemen jasotako json-a berriz objektu bat bilakatzen dugu. (Lo pasamos a objeto para tener sus CLAVES y sus VALORES, si recibimos un json recibimos solo texto y no nos vale)

$param = $json->param ?? null;  //entramos al objeto param

if (!$param) {
    echo json_encode(['success' => false, 'message' => 'Datuak falta dira']);  //sinmas, por si esta vacio
    exit;
}

//estos son los datos que recibimos
$username = $param->erabiltzailea;
$email = $param->email;
$password = $param->pasahitza;

// esto es el hash, mantiene la contraseña encriptada (mas seguro)
$hash = password_hash($password, PASSWORD_DEFAULT);

// kontsulta egiten diogu db-eri, oyee insertame este user
$sql = "INSERT INTO erabiltzaileak (erabiltzailea, email, pasahitza)
        VALUES (:erabiltzailea, :email, :pasahitza)";
$stmt = $pdo->prepare($sql);

//aqui hacemos la relacion de los parametros con sus valores
$stmt->bindParam(':erabiltzailea', $username, PDO::PARAM_STR);
$stmt->bindParam(':email', $email, PDO::PARAM_STR);
$stmt->bindParam(':pasahitza', $hash, PDO::PARAM_STR);

//hauxe da, kontsularen erantzuna
try {
    $stmt->execute();
    echo json_encode(['success' => true, 'message' => 'Erabiltzailea registratuta!']);
}
catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Errorea!: '.$e->getMessage()]);
}
?>
