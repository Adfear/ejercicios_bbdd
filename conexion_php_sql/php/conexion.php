<?php
function conectar(){
try {
    $conexion = new PDO("mysql:host=x", "Admin", "T1234");
}
catch (PDOException $e) {
    $mensaje="No se ha podido establecer conexión con el servidor de bases de datos.<br>";
    die ("Error: " . $e->getMessage());
}
}
$mensaje="Se ha establecido una conexión con el servidor de bases de datos.";
?>