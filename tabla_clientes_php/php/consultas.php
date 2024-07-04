<?php
    include_once('dbConnection.php'); /* Llama una vez al archivo de una conexión*/
    
   
    function consulta(){
        $con = conectar();
        $sql = "SELECT * FROM DatosCliente";
        $query = mysqli_query($con,$sql);        
      
        return $query;
    }

    function consultaEditar($dni){
        $con = conectar();
        $sql = "SELECT * FROM DatosCliente where dni = '$dni'";
        $query = mysqli_query($con,$sql);        
      
        return $query;
    }
?>