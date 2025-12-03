<?php
session_start();
session_destroy();
header("Location: ../../login.html"); //se rompe la sesion y nos lleva al login de vuelta
exit;
?>
