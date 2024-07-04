<?php
    function conectar(){
        $servername = "localhost";
        $database = "cliente";
        $username = "";
        $password = "";
        // Create connection
        $conexion = new mysqli($servername, $username, $password, $database);
        // Check connection
        if (!$conexion) {
            die("Connection failed: " . mysqli_connect_error());
        }
        
        return $conexion;
    }
?>