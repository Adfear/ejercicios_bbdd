
--1
CREATE DATABASE PELICULAS
    DEFAULT CHARACTER SET = 'utf8mb4';

use PELICULAS;
--2

CREATE TABLE actor(
id int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellidos VARCHAR(100) NOT NULL,
edad INT(10) UNSIGNED
);

CREATE TABLE director (
id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellidos VARCHAR(100) NOT NULL,
edad INT(10) UNSIGNED
) ;

CREATE TABLE pelicula (
id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
genero VARCHAR(100) NOT NULL,
duracion INT(10) UNSIGNED,
anho INT(10) UNSIGNED,
actor INT(10) UNSIGNED,
director INT(10) UNSIGNED,
FOREIGN KEY (actor) REFERENCES actor(id),
FOREIGN KEY (director) REFERENCES director(id)
);
--3

INSERT INTO actor (nombre, apellidos, edad) VALUES ('Keanu', 'Reeves', 58);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Will', 'Smith', 54);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Jennifer', 'Lawrence', 32);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Daniel', 'Day-Lewis', 65);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Scarlett', 'Johansson', 38);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Natalie', 'Portman', 41);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Russell', 'Crowe', 59);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Tom', 'Hanks', 66);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Meryl', 'Streep', 73);
INSERT INTO actor (nombre, apellidos, edad) VALUES ('Hilary', 'Swank', 48);


INSERT INTO director (nombre, apellidos, edad) VALUES ('Richard', 'LaGravenese', 63);
INSERT INTO director (nombre, apellidos, edad) VALUES ('Steven', 'Spielberg', 76);
INSERT INTO director (nombre, apellidos, edad) VALUES ('Ron', 'Howard', 69);
INSERT INTO director (nombre, apellidos, edad) VALUES ('Darren', 'Aronofskys', 54);
INSERT INTO director (nombre, apellidos, edad) VALUES ('Jim', 'Sheridan', 74);
INSERT INTO director (nombre, apellidos, edad) VALUES ('Francis', 'Lawrence', 52);
INSERT INTO director (nombre, apellidos, edad) VALUES ('Chad', 'Stahelski', 54);
INSERT INTO director (nombre, apellidos, edad) VALUES ('Clint', 'Eastwood', 92);


INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Constantine', 'Fantástico', 120,2005,1,6);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('John Wick ', 'Acción', 101,2014,1,7);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Cinderella Man', 'Drama', 144,2005,7,3);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Una mente maravillosa', 'Drama', 130,2001,7,3);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('El código Da Vinci', 'Thriller', 147,2006,8,3);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Apolo 13', 'Drama', 140,1995,8,3);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Diarios de la calle', 'Drama', 123,2007,10,1);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Salvar al soldado Ryan', 'Bélico', 170,1998,8,2);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('La terminal', 'Comedia', 128,2004,8,2);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Lincoln', 'Drama', 149,2012,4,2);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('El puente de los espías', 'Thriller', 135,2015,8,2);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Los archivos del Pentágono', 'Drama', 116,2017,9,2);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Cisne negro', 'Drama', 109,2010,6,4);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Noé', 'Fantástico', 138,2014,7,4);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Madre!', 'Thriller', 120,2017,3,4);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Mi pie izquierdo', 'Drama', 103,1989,4,5);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('En el nombre del padre', 'Drama', 135,1993,4,5);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('The boxer', 'Drama', 109,1997,4,5);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Brothers (Hermanos)', 'Drama', 105,2009,6,5);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Soy Leyenda', 'Ciencia ficción', 100,2007,2,6);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Los juegos del hambre: En llamas', 'Ciencia ficción', 143,2013,3,6);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Gorrión rojo', 'Thriller', 134,2018,3,6);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Los puentes de Madison', 'Romance', 135,1995,9,8);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Million Dollar Baby', 'Drama', 132,2004,10,8);
INSERT INTO pelicula (titulo, genero, duracion, anho, actor, director)
VALUES ('Sully', 'Drama', 96,2016,8,8);

--4
UPDATE actor 
SET 
    edad = 39
    WHERE 
    nombre ="Scarlett" AND apellidos ="Johansson";
--5
DELETE FROM actor  WHERE nombre ="Scarlett" AND apellidos ="Johansson";
--6

SELECT titulo, anho as "ano de estreno" from pelicula 
WHERE anho<2000;

--7

SELECT nombre, apellidos, edad from actor
WHERE  edad BETWEEN 30 and 50;

--8

SELECT nombre, apellidos, edad from director
WHERE nombre LIKE 'R%';

--9

SELECT COUNT(genero) as "NºDRAMA" from pelicula
WHERE genero="drama";

--10
SELECT titulo FROM pelicula
INNER JOIN actor ON pelicula.actor=actor.id
WHERE actor.nombre ="TOM" AND actor.apellidos ="HANKS";
--11
SELECT titulo FROM pelicula
INNER JOIN director ON pelicula.director=director.id
WHERE director.nombre ="RON" AND director.apellidos ="HOWARD";

--12

SELECT COUNT (titulo) FROM pelicula
INNER JOIN actor ON pelicula.actor=actor.id
WHERE actor.nombre ="Hilary" AND actor.apellidos ="Swank";

--13
SELECT titulo FROM pelicula
INNER JOIN actor ON pelicula.actor=actor.id
WHERE actor.nombre ="Russell" AND actor.apellidos ="Crowe" and pelicula.genero = "drama";


--14

SELECT DISTINCT nombre, apellidos FROM director 
INNER JOIN pelicula ON director.id=pelicula.director
WHERE pelicula.genero ="fantástico" or pelicula.genero="ciencia ficción";


--15

SELECT titulo, duracion FROM pelicula
INNER JOIN actor ON pelicula.actor=actor.id
WHERE actor.nombre ="Daniel" and actor.apellidos="Day-Lewis" and pelicula.duracion >110;

--16

SELECT titulo, duracion FROM pelicula
INNER JOIN actor ON pelicula.actor=actor.id
INNER JOIN director ON pelicula.director=director.id
WHERE actor.nombre ="TOM" and actor.apellidos="HANKS" and director.nombre="Steven" and director.apellidos="Spielberg";

--17

SELECT anho, COUNT (id)  FROM pelicula
GROUP BY anho
ORDER BY anho;

--18

SELECT nombre, apellidos 
titulo, anho from pelicula
INNER JOIN director ON pelicula.director=director.id
WHERE anho BETWEEN 2000 and 2005;

--19

SELECT titulo, genero, duracion, anho,
director.nombre, director.apellidos,
actor.nombre, actor.apellidos from pelicula
INNER JOIN director ON pelicula.director=director.id
INNER JOIN actor ON pelicula.actor=actor.id
WHERE actor.nombre="Natalie" and actor.apellidos="Portman";
