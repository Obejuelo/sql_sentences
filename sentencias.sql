DROP DATABASE IF EXISTS libreria;
CREATE DATABASE IF NOT EXISTS libreria;

USE libreria;

CREATE TABLE IF NOT EXISTS autores(
    autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, /*UNSIGNED previene la inserción de números negativos*/
    nombre VARCHAR(50) NOT NULL, /*No acepta valores nulos*/
    apellido VARCHAR(50) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE, /*No se puede duplicar este campo*/
    genero ENUM('M', 'F') NOT NULL, /*ENUM solo acempta los caracteres que le indiquemos*/
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp /*Inserta un valor por default con la funcion current_timestamp que obtiene la fecha y hora exacta del sistema*/
);

CREATE TABLE libros(
    libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL, /*Esta sera nuestra llave foranea*/
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    paginas INTEGER UNSIGNED,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE /*de esta forma especificamos quien será nuestra llave foranea y de que tabla la vamos a referenciar*/
    # ON DELETE CASCADA para poder eliminar al autor autor_id con sus respectivos libros en cascada
);

INSERT INTO autores(nombre,apellido,genero,fecha_nacimiento,pais_origen)
VALUES  ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico'),
        ('Obed','Hernandez','M','1991-09-05','Mexico');

SELECT * FROM autores;