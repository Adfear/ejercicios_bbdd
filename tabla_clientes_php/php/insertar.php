<?php
    include_once('dbConnection.php'); /* Llama una vez al archivo de una conexión*/
    
   insertar();
    function insertar(){
        $con = conectar();
        $dni = $_POST['dni'];
        $nombre = $_POST['nombre'];
        $apellidos = $_POST['apellidos'];
        $direccion = $_POST['direccion'];
        $telefono = $_POST['telefono'];
  
        $sql = "INSERT into DatosCliente VALUES('','$dni','$nombre','$apellidos','$direccion','$telefono')";
        mysqli_query($con,$sql);       
      
        Header("Location:../html/tabla.php");
    }
?>