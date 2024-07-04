<?php

include_once('../php/consultas.php');
$dni = $_GET['dni'];
$resultado = consultaEditar($dni);
$fila = mysqli_fetch_array($resultado)
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css" integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

<div id = "formulario">
    <form action="../php/update.php" method="post">
        <h1>Inserte los datos</h1>
        <div class="mb-3 mt-3">
            <label for="dni" class="form-label">DNI:</label>
            <input type="text" class="form-control" id="dni" placeholder="Inserta un dni" name="dni" value ="<?php echo $fila['dni']?>">
        </div>

        <div class="mb-3 mt-3">
            <label for="nombre" class="form-label">Nombre:</label>
            <input type="text" class="form-control" id="nombre" placeholder="Inserta un nombre" name="nombre"value ="<?php echo $fila['nombre']?>">
        </div>

        <div class="mb-3 mt-3">
            <label for="apellidos" class="form-label">Apellidos:</label>
            <input type="text" class="form-control" id="apellidos" placeholder="Inserta los apellidos" name="apellidos" value ="<?php echo $fila['apellidos']?>">
        </div>
        <div class="mb-3 mt-3">
            <label for="telefono" class="form-label">Telefono:</label>
            <input type="number" class="form-control" id="telefono" placeholder="Inserta un telefono" name="telefono" value ="<?php echo $fila['telefono']?>">
        </div>
        <div class="mb-3 mt-3">
            <label for="direccion" class="form-label">Direccion:</label>
            <input type="text" class="form-control" id="direccion" placeholder="Inserta una direccion" name="direccion" value ="<?php echo $fila['direccion']?>">
        </div>
        <input type="submit" class="btn btn-success" value="Actualizar">
    </form>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.min.js" integrity="sha512-1/RvZTcCDEUjY/CypiMz+iqqtaoQfAITmNSJY17Myp4Ms5mdxPS5UV7iOfdZoxcGhzFbOm6sntTKJppjvuhg4g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>