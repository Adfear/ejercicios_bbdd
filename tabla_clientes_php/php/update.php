<?php
    include_once('dbConnection.php'); /* Llama una vez al archivo de una conexión*/
    actualizar();
   
    function actualizar(){
        $con = conectar();
        $dni = $_POST['dni'];
        $nombre = $_POST['nombre'];
        $apellidos = $_POST['apellidos'];
        $direccion = $_POST['direccion'];
        $telefono = $_POST['telefono'];
      
        $sql = "UPDATE DatosCliente SET dni ='$dni', nombre = '$nombre',apellidos = '$apellidos',direccion = '$direccion',telefono ='$telefono' WHERE dni = '$dni'";
        mysqli_query($con,$sql);       
      
        Header("Location:../html/tabla.php");
    }
?>