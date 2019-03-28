# FUNCIONES SOBRE STRINGS
SELECT CONCAT(nombre, " ", apellido) FROM autores; 				# Consulta nombre y apellido y los concatena
SELECT CONCAT(nombre, " ", apellido) AS nombre FROM autores; 	# Cambiamos el nombre de la tabla a mostrarse

SELECT LENGTH('Hola mundo');						# LENGTH() devuelve el npumero de caracteres
SELECT * FROM usuarios WHERE LENGTH(nombre) > 7;	# Devuelve todos los registros donde el tamaño del nombre sea mayor a 7

SELECT UPPER(nombre) FROM autores;	# Devuelve el registro formateado a mayúsculas
SELECT LOWER(nombre) FROM autores;	# Devuelve el registro formateado a minúsculas
TRIM("  espacios  "); 				# Elimina los orefijos y sufijos (espacios en blanco al principio y al final)

SELECT LEFT("cadena de caracteres", 5);		# Devuelve los primeros 5 caracteres de la cadena
SELECT RIGHT("cadena de caracteres", 10);	# Devuelve los pultimos 10 caracteres de la cadena
SELECT * FROM autores WHERE LEFT(nombre, 2) = 'ob';


# FUNCIONES SOBRE NÚUMEROS
SELECT RAND();				# RAND Nos devuelve un número random entre el 0 y el 1
SELECT ROUND(RAND() * 100)	# ROUND Redondea y devuelve un número random entre el 1 y el 100
SELECT TRUNCATE(1.12345, 3)	# TRUNCATE Trunca el numero y devuelve solo 3 decimales
SELECT POW(2, 16); 			# POW Eleva 2 a la 16


# FUNCIONES SOBRE FECHAS
SET @date = NOW(); 					# Almacena en la variable @date la fecha y hora actual
SELECT SECOND(@date);				# Obtiene los segundos de la variable
SELECT MINUTE(@date);				# Obtiene los mintuos de la variable
SELECT HOUR(@date);					# Obtiene la horas de la variable
SELECT MONTH(@date);				# Obtiene el meses de la variable
SELECT YEAR(@date);					# Obtiene el año de la variable

SELECT DAYOFWEEK(@date); 			# Devuelve el dia de la semana
SELECT DAYOFMONTH(@date); 			# Devuelve el dia del mes
SELECT DAYOFYEAR(@date); 			# Devuelve el dia del año

SELECT DATE(@date);					# Obtiene la fecha
SELECT CURDATE();					# CURDATE obtiene la fecha actual

SELECT @date + INTERVAL 30 DAY;		# Sumamos 30 días a la fecha actual


# FUNCIONES SOBRE CONDICIONES
SELECT IF(10 > 5, "es mayor", "es menor");	# (condición, return si true, return si false)
SELECT IFNULL(nombre, "El campo no cuenta con un nombre") FROM tabla; # lo evalua si es null


# CREACIÓN DE FUNCIONES
CREATE FUNCTION funcion(parametros)		# Creacion de funcion
RETURNS date                            # Valor a retornar
BEGIN									# Inicio
END;									# Fin


DELIMITER // # Cambiamos el signo de final de sentencia para que no marque error

CREATE FUNCTION agregar_dias(fecha Date, dias INT)
RETURNS DATE
BEGIN
	RETURN fecha + INTERVAL dias DAY;
END//

DELIMITER ; #Lo regresamos para poder ejecutar la función

# LISTAR FUNCIONES
SELECT name FROM mysql.proc WHERE db = database() AND type = "FUNCTION";
DROP FUNCTION agregar_dias;	# Elimina una función


DELIMITER //

CREATE FUNCTION obtener_paginas()
RETURNS INT
BEGIN
	SET @paginas = (SELECT(ROUND(RAND()*100)*4));
	RETURN @paginas;
END//

DELIMITER ;