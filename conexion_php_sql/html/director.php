<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conexión a base de datos</title>
</head>

<body>
    <?php
    try {
        $conexion = new PDO("mysql:host=x", "Admin", "Tcontra");
    } catch (PDOException $e) {
        $mensaje = "No se ha podido establecer conexión con el servidor de bases de datos.<br>";
        die("Error: " . $e->getMessage());
    }

    $mensaje = "Se ha establecido una conexión con el servidor de bases de datos.";

    //ANALIZAMOS LA ACCION QUE QUEREMOS HACER (insertar, eliminar o modificar)
    $mensaje = "";
    if (isset($_POST['accion'])) {
        //INSERCCION
        if ($_POST['accion'] == 'insertar') {
            $insercion = "INSERT INTO director (nombre, apellidos, edad) VALUES ('$_POST[nombre]','$_POST[apellidos]','$_POST[edad]')";
            $conexion->exec($insercion);
            $mensaje = "dado de alta correctamente.";
        }

        //ELIMINAR
        if ($_POST['accion'] == 'eliminar') {
            $id = $_POST['id'];
            $eliminar = "DELETE FROM director WHERE id='$id'";
            $conexion->exec($eliminar);
            $mensaje = "eliminado correctamente.";
        }

        //MODIFICAR
        if ($_POST['accion'] == 'modificar') {
            $id = $_POST['id'];
            $modificar = "UPDATE director SET nombre='$_POST[nombre]', apellidos='$_POST[apellidos]', edad='$_POST[edad]' WHERE id='$id'";
            $conexion->exec($modificar);
            $mensaje = "modificado correctamente.";
        }
    }

    $consulta = $conexion->query("SELECT id, nombre, apellidos, edad FROM director ORDER BY nombre");
    ?>
    <!-- diseño de la pagina -->
    <nav>
        <li><a href="actor.php">Actor</a></li>
        <li><a href="director.php">Director</a></li>
        <li><a href="peliculas.php">Películas</a></li>
    </nav>
    <br>
    Número de directores:
    <?= $consulta->rowCount();
    echo "$mensaje"

        ?>
    <table border="1">
        <tr>
            <td><b>id</b></td>
            <td><b>Nombre</b></td>
            <td><b>Apellidos</b></td>
            <td><b>edad</b></td>
            <td colspan="3\"><b>ACCIONES</b></td>
        </tr>
        <!-- para poder introducir la info en los campos -->
        <?php while ($director = $consulta->fetchObject()) { ?>
            <tr>
                <form action="#" method="post">
                    <td><input type="hidden" name="id" value="<?= $director->id ?>"><?= $director->id ?></td>
                    <td><input type="text" name="nombre" value="<?= $director->nombre ?>"></td>
                    <td><input type="text" name="apellidos" value="<?= $director->apellidos ?>"></td>
                    <td><input type="text" name="edad" value="<?= $director->edad ?>"></td>
                    <td><button name="accion" value="eliminar">Eliminar</button></td>
                    <td><button name="accion" value="modificar">Modificar</button></td>
                </form>
            </tr>
        <?php } ?>

        <tr>
            <form action="#" method="post">
                <td></td>
                <td><input type="text" name="nombre" placeholder="nombre"></td>
                <td><input type="text" name="apellidos" placeholder="apellidos"></td>
                <td><input type="text" name="edad" placeholder="edad"></td>
                <td colspan="2"><button name="accion" value="insertar">Nuevo</button></td>
        </tr>
    </table>
    <?=
        $conexion = NULL;
    unset($conexion);
    ?>
</body>

</html>