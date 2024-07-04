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
        $conexion = new PDO("mysql:host=localhost;dbname=peliculas;charset=utf8", "Admin", "TortillaÑ");
    }
    catch (PDOException $e) {
        $mensaje="No se ha podido establecer conexión con el servidor de bases de datos.<br>";
        die ("Error: " . $e->getMessage());
    }

    $mensaje="Se ha establecido una conexión con el servidor de bases de datos.";

    //ANALIZAMOS LA ACCION QUE QUEREMOS HACER (insertar, eliminar o modificar)
    $mensaje="";
    if(isset($_POST['accion'])){
        //INSERCCION
        if($_POST['accion']=='insertar'){
            $insercion = "INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director) VALUES ('$_POST[titulo]','$_POST[genero]',
            '$_POST[duracion]','$_POST[anho]','$_POST[actor]','$_POST[director]')";
            $conexion->exec($insercion);
            $mensaje=  "dado de alta correctamente.";
        }

        //ELIMINAR
        if($_POST['accion']=='eliminar'){
            $id=$_POST['id'];
            $eliminar = "DELETE FROM pelicula WHERE id='$id'";
            $conexion->exec($eliminar);
            $mensaje="eliminado correctamente.";
        }

        //MODIFICAR
        if($_POST['accion']=='modificar'){
            $id=$_POST['id'];
            $modificar = "UPDATE pelicula SET titulo='$_POST[titulo]', genero='$_POST[genero]',  duracion='$_POST[duracion]', anho='$_POST[anho]',actor='$_POST[actor]', director='$_POST[director]', WHERE id='$id'";
            $conexion->exec($modificar);
            $mensaje= "modificado correctamente.";
        }
    }

    $consulta = $conexion->query("SELECT id, titulo, genero, duracion, anho, actor, director FROM pelicula ORDER BY titulo");
?>

    <!-- diseño de la pagina -->
<nav>
      <li><a href="actor.php">Actor</a></li>
      <li><a href="director.php">Director</a></li>
      <li><a href="peliculas.php">Películas</a></li>
    </nav>
    <br>
    Número de peliculas: <?= $consulta->rowCount();
    echo "<br>$mensaje"?>
    <table border="1">
        <tr>
            <td><b>id</b></td>
            <td><b>titulo</b></td>
            <td><b>genero</b></td>
            <td><b>duracion</b></td>
            <td><b>año</b></td>
            <td><b>actor</b></td>
            <td><b>director</b></td>
            <td colspan="4\"><b>ACCIONES</b></td>
        </tr>
        <?php while ($pelicula = $consulta->fetchObject()){
        ?>
        <tr>
            <form action="#" method="post">
                <td><input type="hidden" name="id" value="<?= $pelicula->id ?>"><?= $pelicula->id ?></td>
                <td><input type="text" name="nombre" value="<?= $pelicula->titulo ?>"></td>
                <td><input type="text" name="apellidos" value="<?= $pelicula->genero ?>"></td>
                <td><input type="text" name="duracion" value="<?= $pelicula->duracion ?>"></td>
                <td><input type="text" name="anho" value="<?= $pelicula->anho ?>"></td>
                <td><select name="actor">
                <?php $consultaactor = $conexion->query("SELECT id, nombre, apellidos FROM actor order by nombre");?>
                    <?php while ($actor = $consultaactor->fetchObject()){ ?>
                        <option value="<?= $actor->id; ?>" <?php if ($actor->id == $pelicula->actor)
                                  echo 'selected'; ?>><?= $actor->nombre ?><?= $actor->apellidos ?></option>                    <?php } ?>
              </select>
            </td>
            <td><select name="director">
                <?php $consultadirector= $conexion->query("SELECT id, nombre, apellidos FROM director order by nombre");?>
                    <?php while ($director = $consultadirector->fetchObject()){ ?>
                        <option value="<?= $director->id; ?>" <?php if ($director->id == $pelicula->director)
                                  echo 'selected'; ?>><?= $director->nombre ?><?= $director->apellidos ?></option>  <?php } ?>
              </select>
            </td>

                <td><button name="accion" value="eliminar">Eliminar</button></td>
                <td><button name="accion" value="modificar">Modificar</button></td>
            </form>
        </tr>
        <?php } ?>

        <!-- para poder introducir la info en los campos -->

        
        <tr>
            <form action="#" method="post">
                <td></td>
                <td><input type="text" name="titulo" placeholder="titulo"></td>
                <td><input type="text" name="genero" placeholder="genero"></td>
                <td><input type="text" name="duracion" placeholder="duracion"></td>
                <td><input type="text" name="anho" placeholder="anho"></td>
                <td><select>
                    <?php $consultaactor = $conexion->query("SELECT id, nombre, apellidos FROM actor order by nombre"); ?>
                    <?php while ($actor = $consultaactor->fetchObject()){ ?>
                    <option name="actor" placeholder="actor" value="<?= $actor->id; ?>"><?= $actor->nombre ?><?= $actor-> apellidos ?></option>
                     <?php } ?>
              </select>
            </form>
            </td>
            <td><select name="director">
                <?php $consultadirector= $conexion->query("SELECT id, nombre, apellidos FROM director order by nombre");?>
                    <?php while ($director = $consultadirector->fetchObject()){ ?>
                    <option name="director" placeholder="director" value="<?= $director->id; ?>"><?= $director->nombre ?><?= $director-> apellidos ?></option>
                    <?php } ?>
              </select>
            </td>
                <td colspan="2"><button name="accion" value="insertar">Nuevo</button></td>
        </tr>
        </table>
<?=
$conexion=NULL;
unset($conexion);
?>
    </body>
</html>
