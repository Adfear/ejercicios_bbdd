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
    $conexion = new PDO("mysql:host=x", "user", "Abc123.");
}
    catch (PDOException $e) {
        $mensaje="No se ha podido establecer conexión con el servidor de bases de datos.<br>";
    die ("Error: " . $e->getMessage());
}

    $mensaje="Se ha establecido una conexión con el servidor de bases de datos.";


// ANALIZAMOS LA ACCION QUE QUEREMOS HACER (insertar, eliminar o modificar)
$mensaje="";
if(isset($_POST['accion'])){
////////////////INSERCCION///////////////////////
    if($_POST['accion']=='insertar'){
        // Comprueba si ya existe un cliente con el DNI introducido
        $nif=$_POST['nif'];
        $consulta = $conexion->query("SELECT nif FROM empleado where nif='$nif'");
        if ($consulta->rowCount() > 0) {
        $mensaje="Ya existe un empleado con NIF $nif <br> Por favor, añada un empleado con NIF válido.";
        } else {
        $insercion = "INSERT INTO empleado (nif, nombre, apellido1, apellido2, codigo_departamento)
        VALUES ('$_POST[nif]','$_POST[nombre]','$_POST[apellido1]','$_POST[apellido2]','$_POST[departamento]')";
        $conexion->exec($insercion);
        $mensaje= "Empleado dado de alta correctamente.";
        }
    }
////////////////ELIMINAR///////////////////////
if($_POST['accion']=='eliminar'){
    // Comprueba si ya existe un cliente con el DNI introducido
    $nif=$_POST['nif'];
    $eliminar = "DELETE FROM empleado WHERE nif='$nif'";
    $conexion->exec($eliminar);
    $mensaje="Empleado eliminado correctamente.";
    }

////////////////MODIFICAR///////////////////////
if($_POST['accion']=='modificar'){
    // Comprueba si ya existe un cliente con el DNI introducido
    $nif=$_POST['nif'];
    $modificar = "UPDATE empleado SET nif ='$_POST[nif]', nombre='$_POST[nombre]',
    apellido1='$_POST[apellido1]',apellido2='$_POST[apellido2]',codigo_departamento='$_POST[departamento]'
    WHERE nif='$nif'";
    $conexion->exec($modificar);
    $mensaje= "Empleado modificado correctamente.";
    }
    ////////////////////////////////////////////////
}



    $consulta = $conexion->query("SELECT nif, nombre, apellido1, apellido2, codigo_departamento
    FROM empleado order by nombre");
    ?>
    <h2>Mantenimiento de empleados</h2>
    <table border="1">
    <tr>
    <td><b>NIF</b></td>
    <td><b>Nombre</b></td>
    <td><b>Apellido 1</b></td>
    <td><b>Apellido 2</b></td>
    <td><b>Departamento</b></td>
    <td colspan="2"><b>ACCIONES</b></td>
    </tr>
    <?php
    while ($empleado = $consulta->fetchObject()){
        $consultadpto = $conexion->query("SELECT id, nombre FROM departamento order by nombre");
    ?>
        <tr>
        <form action="#" method="post">
            <td><input type="hidden" name="nif" value='<?= $empleado->nif ?>'><?= $empleado->nif ?></td>
            <td><input type="text" name="nombre" value='<?= $empleado->nombre ?>'></td>
            <td><input type="text" name="apellido1" value='<?= $empleado->apellido1 ?>'></td>
            <td><input type="text" name="apellido2" value='<?= $empleado->apellido2 ?>'></td>
            <td>
                <select name="departamento">
                    <?php while ($departamento = $consultadpto->fetchObject()){ ?>
                    <option value="<?= $departamento->id; ?>" <?php if ($departamento->id==$empleado->codigo_departamento) echo 'selected'; ?> ><?= $departamento->nombre ?></option>
                    <?php } ?>
                </select>
            </td>
            <td><button name="accion" value="eliminar">Eliminar</button></td>
            <td><button name="accion" value="modificar">Modificar</button></td>
        </form>
        </tr>
        <?php
}
?>
        <tr>
        <form action="#" method="post">
            <td><input type="text" name="nif" placeholder="NIF"></td>
            <td><input type="text" name="nombre" placeholder="Nombre"></td>
            <td><input type="text" name="apellido1" placeholder="Apellido 1"></td>
            <td><input type="text" name="apellido2" placeholder="Apellido 2"></td>
            <td><select name="departamento">
            <?php $consultadpto = $conexion->query("SELECT id, nombre FROM departamento order by nombre");?>
                    <?php while ($departamento = $consultadpto->fetchObject()){ ?>
                    <option value="<?= $departamento->id; ?>"><?= $departamento->nombre ?></option>
                    <?php } ?>
            </select>
            </td>
            <td colspan="2"><button name="accion" value="insertar">Nuevo</button></td>
        </form>
        </tr>
</table>
<br>
Número de empleados: <?= $consulta->rowCount();
echo "<br>$mensaje";
$conexion=NULL;
unset($conexion);
?>
</body>
</html>