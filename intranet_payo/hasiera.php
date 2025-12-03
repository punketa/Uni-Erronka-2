<?php
//para mantener el login con persistentzia hay q convertir el hasiera.html a hasiera.php
session_start();

// ez badago erabiltzilerik loogeatuta lo manda al login
if (!isset($_SESSION['user'])) {
    header("Location: login.html");
    exit;
}
?>

<!DOCTYPE html>
<html lang="eu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UniPayo - Hasiera</title>
    <link rel="icon" type="image/png" href="img/payologo.ico">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="card">
        <img src="img/payologo.png" class="logo" alt="UniPayo Logo">
        <h2 class="title">Ongietorri <?php echo htmlspecialchars($_SESSION['user']); ?> !! 🔥🔥 </h2>

        <a class="btn link-btn" href="https://glpi.payo.eus" target="_blank">🔧 Zabaldu GLPI</a>
        <a class="btn link-btn" href="https://www.payo.eus" target="_blank">🌍 Uni Payo Web orria</a>
        <a class="btn link-btn-red" href="php/logout/index.php">🚪 Itxi saioa</a>
    </div>

    </div>

</body>
</html>
