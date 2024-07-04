CREATE DATABASE IF NOT EXISTS peliculas CHARACTER
SET utf8mb4;

USE peliculas;

CREATE TABLE
    actor (
        id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100),
        apellidos VARCHAR(100),
        edad INT(10) UNSIGNED
    );

CREATE TABLE
    director (
        id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100),
        apellidos VARCHAR(100),
        edad INT(10) UNSIGNED
    );

CREATE TABLE
    pelicula (
        id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        titulo VARCHAR(100),
        genero VARCHAR(100),
        duracion INT(10) UNSIGNED,
        anho INT(10) UNSIGNED,
        actor INT(10) UNSIGNED,
        director INT(10) UNSIGNED,
        FOREIGN KEY (actor) REFERENCES actor (id),
        FOREIGN KEY (director) REFERENCES director (id)
    );

INSERT INTO
    actor (nombre, apellidos, edad)
VALUES
    ('Keanu', 'Reeves', 58),
    ('Will', 'Smith', 54),
    ('Jennifer', 'Lawrence', 32),
    ('Daniel', 'Day-Lewis', 65),
    ('Scarlett', 'Johansson', 38),
    ('Natalie', 'Portman', 41),
    ('Russell', 'Crowe', 59),
    ('Tom', 'Hanks', 66),
    ('Meryl', 'Streep', 73),
    ('Hilary', 'Swank', 48);

INSERT INTO
    director (nombre, apellidos, edad)
VALUES
    ('Richard', 'LaGravenese', 63),
    ('Steven', 'Spielberg', 76),
    ('Ron', 'Howard', 69),
    ('Darren', 'Aronofskys', 54),
    ('Jim', 'Sheridan', 74),
    ('Francis', 'Lawrence', 52),
    ('Chad', 'Stahelski', 54),
    ('Clint', 'Eastwood', 92);

INSERT INTO
    pelicula (titulo, genero, duracion, anho, actor, director)
VALUES
    ('Constantine', 'Fantástico', 120, 2005, 1, 6),
    ('John Wick ', 'Acción', 101, 2014, 1, 7),
    ('Cinderella Man', 'Drama', 144, 2005, 7, 3),
    ('Una mente maravillosa', 'Drama', 130, 2001, 7, 3),
    ('El código Da Vinci', 'Thriller', 147, 2006, 8, 3),
    ('Apolo 13', 'Drama', 140, 1995, 8, 3),
    ('Diarios de la calle', 'Drama', 123, 2007, 10, 1),
    ('Salvar al soldado Ryan', 'Bélico', 170, 1998, 8, 2),
    ('La terminal', 'Comedia', 128, 2004, 8, 2),
    ('Lincoln', 'Drama', 149, 2012, 4, 2),
    ('El puente de los espías', 'Thriller', 135, 2015, 8, 2),
    ('Los archivos del Pentágono', 'Drama', 116, 2017, 9, 2),
    ('Cisne negro', 'Drama', 109, 2010, 6, 4),
    ('Noé', 'Fantástico', 138, 2014, 7, 4),
    ('Madre!', 'Thriller', 120, 2017, 3, 4),
    ('Mi pie izquierdo', 'Drama', 103, 1989, 4, 5),
    ('En el nombre del padre', 'Drama', 135, 1993, 4, 5),
    ('The boxer', 'Drama', 109, 1997, 4, 5),
    ('Brothers (Hermanos)', 'Drama', 105, 2009, 6, 5),
    ('Soy Leyenda', 'Ciencia ficción', 100, 2007, 2, 6),
    ('Los juegos del hambre: En llamas', 'Ciencia ficción', 143, 2013, 3, 6),
    ('Gorrión rojo', 'Thriller', 134, 2018, 3, 6),
    ('Los puentes de Madison', 'Romance', 135, 1995, 9, 8),
    ('Million Dollar Baby', 'Drama', 132, 2004, 10, 8),
    ('Sully', 'Drama', 96, 2016, 8, 8);