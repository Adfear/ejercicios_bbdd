<?php
    include_once('dbConnection.php'); /* Llama una vez al archivo de una conexión*/
    
   delete();
    function delete(){
        $con = conectar();
        $dni = $_GET['dni'];
        echo ($dni);
        $sql = "DELETE FROM DatosCliente WHERE dni='$dni'";
        mysqli_query($con,$sql);        
      
        Header("Location:../html/tabla.php");
    }
?>;