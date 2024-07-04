<?php 
include("cosas.php");
session_start();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>ADIVINA EL PERSONAJE</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="pagina.css">
    <link rel="icon" href="img">
</head>
<body>
    <?php
    
    if(isset($_POST["ojos"])) {
        $_SESSION["ojos"] = $e_ojos;
    }
    elseif(isset($_POST["nariz"])) {
        $_SESSION["nariz"] = $e_nariz;
    }
    
    elseif(isset($_POST["bocas"])) {
        $_SESSION["bocas"] = $e_bocas;                  //tenemos esto para que cuando clickes en algun boton cambie solo esa imagen
    }

    $e_ojos = $_SESSION["ojos"];
    $e_nariz = $_SESSION["nariz"];  
    $e_bocas = $_SESSION["bocas"];

    ?>
    <h1>ADIVINA EL PERSONAJE</h1>
    <div class="tx">
        <form action="#" method="post">
            <div>
                <img src="<?php echo $e_ojos; ?>">
                <button type="submit" name="ojos" value="ojos">????</button>
            </div>
            <div>
                <img src="<?php echo $e_nariz; ?>">
                <button type="submit" name="nariz" value="nariz">????</button>        
            </div>
            <div>
                <img src="<?php echo $e_bocas; ?>">
                <button type="submit" name="bocas" value="bocas">????</button>
            </div>
        </form>
        <div>
            <h2>¿Quién es?</h2>
            <form action='#' method='post' class='respuestas'>  
            <p>                                                 <!-- el formulario con los nombres de los famosos para comprobar si sabes cual es -->
                <input type="checkbox" name="Angelina"> Angelina Jolie<br>

                <input type="checkbox" name="Bill"> Bill Murray<br>

                <input type="checkbox" name="Clint"> Clint Eastwood<br>

                <input type="checkbox" name="Christopher"> Christopher Walken<br>   

                <input type="checkbox" name="Denis"> Denis Hoper<br>

                <input type="checkbox" name="George"> George Clooney<br>

                <input type="checkbox" name="Helen"> Helen Mirren<br>

                <input type="checkbox" name="Cate"> Cate Blanchett<br>

            </p>

            <p><input type="submit" value="Comprobar"></p>
            </form>

            
                             <!-- instrucciones -->
        </div>
        <div style="display:flex;flex-direction:column;">
            <h2 style="text-align:center;">Instrucciones</h2>
            <ul>
                <li>Pulsa en los botones para ir cambiando</li>
                <li>Intenta componer el rostro de un famoso</li>
                <li>Cuando lo tengas, se mostrará un listado de personajes</li>
                <li>Elige el personaje y pulsa comprobar</li>
            </ul>
        </div>
    </div>
</body>
</html>
