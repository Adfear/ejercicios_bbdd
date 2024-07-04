
ALTER TABLE departamento ADD gastos DOUBLE;
CREATE TABLE empleado (
    id int UNSIGNED AUTO_INCREMENT PRIMARY key,
    nif VARCHAR(9) not null,
    nombre VARCHAR(100) not null,
    apellido1 VARCHAR(100) not null,
    apellido2 VARCHAR(100),
    codigo_departamento INT(10) UNSIGNED,
    FOREIGN key (codigo_departamento) REFERENCES departamento (id)
    on delete CASCADE on update CASCADE
    );
ALTER TABLE departamento ADD gastos DOUBLE;
use tienda;
DESCRIBE empleado;
INSERT INTO departamento (nombre, presupuesto,gastos) VALUES
('Recursos Humanos', 280000, 25000),
('Contabilidad', 110000, 3000),
('I+D', 375000, 380000),
('Proyectos', 0, 0),
('Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);
DESCRIBE empleado;
alter Table empleado add apellido2 VARCHAR(100);
drop table empleado;
------CONSULTAS
select apellido1 from empleado;
select DISTINCT apellido1 from empleado;
SELECT * from empleado;
SELECT nombre, apellido1, apellido2 from empleado;
select codigo_departamento from empleado;
select distinct codigo_departamento from empleado;
SELECT CASE
    WHEN apellido2 is null THEN
    concat(nombre, " ", apellido1) 
    ELSE
    concat(nombre, " ", apellido1, " ", apellido2 )
END as empleado from empleado; 
SELECT CASE
    WHEN apellido2 is null THEN
    upper(concat(nombre, " ", apellido1))
    ELSE
    upper(concat(nombre, " ", apellido1, " ", apellido2 ))
END as empleado from empleado;
SELECT CASE
    WHEN apellido2 is null THEN
    lower(concat(nombre, " ", apellido1))
    ELSE
    lower(concat(nombre, " ", apellido1, " ", apellido2 ))
END as empleado from empleado; 
----10---
select id, SUBSTRING(nif,1,8) as DNI,SUBSTRING(nif,9,1) as Letra from empleado;
---11---
select nombre, presupuesto-gastos as liquidez from departamento;
---12---
select nombre, presupuesto-gastos as liquidez from departamento order by liquidez asc;
--13--
select nombre from departamento order by nombre asc;
--14--
select nombre from departamento order by nombre desc;
--15--
select apellido1, apellido2, nombre from empleado order by apellido1,apellido2;
/*16-Devuelve una lista con el nombre y el presupuesto, 
de los 3 departamentos que tienen mayor presupuesto.*/
select nombre, presupuesto-gastos as liquidez from departamento order by liquidez desc limit 3;
/*17-Devuelve una lista con el nombre y el presupuesto, 
de los 3 departamentos que tienen menor presupuesto.*/
select nombre, presupuesto-gastos as liquidez from departamento order by liquidez asc limit 3;
/*18. Devuelve una lista con el nombre y el gasto, de los
2 departamentos que tienen mayor gasto.*/
select nombre, gastos from departamento ORDER BY gastos DESC limit 2;

/*19. Devuelve una lista con el nombre y el gasto, de los
2 departamentos que tienen menor gasto.*/
select nombre, gastos from departamento ORDER BY gastos limit 2;

/*20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado.
 La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas
  de la tabla empleado
*/
SELECT * FROM empleado where id>=3 and id<8;
SELECT * FROM empleado where id>=3 limit 5; ---Otra forma
SELECT * FROM empleado where id BETWEEN 3 AND 7; -- Otra FORMA

--21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un pre-
--supuesto mayor o igual a 150000 euros
select nombre, presupuesto from departamento where presupuesto>=15000;

/* 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos
donde los gastos sean mayores que el presupuesto del que disponen.*/
SELECT nombre, gastos, presupuesto from departamento where gastos>presupuesto;

/*30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL
*/
select * from empleado where apellido2 is NULL;

/*35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
*/
SELECT nombre,apellido1,apellido2, nif FROM empleado where codigo_departamento=3;

SELECT nombre,apellido1,apellido2, nif FROM empleado where codigo_departamento IN (2,4,5);
/*1.2.4.1 Devuelve un listado con los empleados y los datos de los departamentos
donde trabaja cada uno*/
SELECT empleado.nombre as nombre, apellido1 as apellidos, departamento.nombre as departamento, presupuesto, gastos
from empleado INNER JOIN departamento ON 
empleado.codigo_departamento=departamento.id;
/* 1.2.4.2 Devuelve un listado con los empleados y los datos de los departamentos
donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento 
(en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.
*/
SELECT empleado.nombre, apellido1 as apellidos, D.nombre as departamento, presupuesto, gastos
from empleado INNER JOIN departamento D ON 
empleado.codigo_departamento=D.id 
where empleado.nombre like 'A%'
ORDER BY departamento, apellidos, empleado.nombre;
/* 1.2.4.3. Devuelve un listado con el identificador y el nombre del departamento, 
solamente de aquellos departamentos que tienen empleados
*/
select distinct departamento.id, departamento.nombre 
FROM departamento JOIN empleado 
ON codigo_departamento=departamento.id;

/* 1.2.4.4. Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual
del que dispone, solamente de aquellos departamentos que tienen empleados. El valor del presupuesto
actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) el valor de los
gastos que ha generado (columna gastos)
*/
select distinct departamento.id, departamento.nombre, presupuesto-gastos as liquidez
FROM departamento JOIN empleado 
ON codigo_departamento=departamento.id;

--1.2.4.5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
SELECT departamento.nombre as departamento
FROM departamento JOIN empleado
ON codigo_departamento=departamento.id
WHERE empleado.nif='38382980M';

--1.2.4.6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT departamento.nombre as departamento
FROM departamento JOIN empleado
ON codigo_departamento=departamento.id
WHERE empleado.nombre='Pepe' AND empleado.apellido1='Ruiz' AND empleado.apellido2='Santana';

--1.2.4.7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D.
-- Ordena el resultado alfabéticamente.
SELECT empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2
FROM empleado JOIN departamento
ON  codigo_departamento=departamento.id
where departamento.nombre='I+D'
order by empleado.nombre;

--1.2.4.8. Devuelve un listado con los datos de los empleados que trabajan en el departamento
-- de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2
FROM empleado JOIN departamento
ON  codigo_departamento=departamento.id
where departamento.nombre='I+D' OR departamento.nombre='Sistemas' OR departamento.nombre='Contabilidad'
order by empleado.nombre;

--1.2.4.9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que
--no tienen un presupuesto entre 100000 y 200000 euros.
SELECT empleado.nombre
from empleado JOIN departamento
ON codigo_departamento=departamento.id
WHERE departamento.presupuesto NOT BETWEEN 100000 AND 200000;

--1.2.4.10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado
-- cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos 
--que estén repetidos
SELECT DISTINCT departamento.nombre
FROM empleado JOIN departamento
ON codigo_departamento=departamento.id
WHERE apellido2 IS NULL;

--1.2.6.1. Calcula la suma del presupuesto de todos los departamentos
SELECT SUM(presupuesto) FROM departamento;
--1.2.6.7. Calcula el número total de empleados que hay en la tabla empleado.
select count(id) from empleado;

--SUBCONSULTAS
--- EJEMPLO: Mostrar el nombre del departamento de los empleados cuyo 1er apellido sea Ruiz
SELECT nombre from departamento where id in 
(SELECT codigo_departamento from empleado where apellido1="Ruiz");

--LO MISMO CON JOIN
SELECT departamento.nombre 
FROM departamento JOIN empleado
ON codigo_departamento=departamento.id
where apellido1="Ruiz";

/*
1.2.7.1 Con operadores básicos de comparación
1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER
JOIN).*/
SELECT * from empleado where codigo_departamento = (SELECT id from departamento where nombre="Sistemas");
--2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
SELECT nombre, presupuesto FROM departamento
where presupuesto=
(SELECT max(presupuesto) FROM departamento);
--3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT nombre as departamento, presupuesto FROM departamento
where presupuesto=
(SELECT min(presupuesto) FROM departamento);

/*
1.2.7.2 Subconsultas con ALL y ANY
4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer
uso de MAX, ORDER BY ni LIMIT.*/
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto>= ALL
(SELECT presupuesto FROM departamento);
/*
5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer
uso de MIN, ORDER BY ni LIMIT.*/
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto<= ALL
(SELECT presupuesto FROM departamento);
--6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
SELECT nombre FROM departamento
WHERE id= ANY
(SELECT codigo_departamento FROM empleado);
--7. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
SELECT nombre FROM departamento
WHERE id != ALL
(SELECT codigo_departamento FROM empleado WHERE codigo_departamento IS NOT NULL);

---FORMA "FÁCIL"
SELECT departamento.nombre 
FROM departamento LEFT JOIN empleado
ON codigo_departamento=departamento.id
where codigo_departamento is NULL;


SELECT nombre from departamento
WHERE nombre NOT IN
(SELECT DISTINCT departamento.nombre 
FROM departamento JOIN empleado
ON codigo_departamento=departamento.id);