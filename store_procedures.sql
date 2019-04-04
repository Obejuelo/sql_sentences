DELIMITER //

CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT)
BEGIN
	INSERT INTO libros_usuarios(ibro_id, usuario_id) VALUES (libro_id, usuario_id);
	UPDATE libro SET stock = stock - 1 WHERE libros.libro_id = libro_id;
END //

DELIMITER ; # Creacion de store procedure para insertar y actualizar campos

SELECT name FROM mysql.proc WHERE db = database() AND type = "PROCEDURE"; # Listar procedures

CALL prestamo(5, 3); # Ejecuta un store prucedure

DROP PROCEDURE prestamo; # Eliminar store procedure (No es posible editarlo)


DELIMITER //
CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT, OUT cantidad INT)	# OUT para devolver valores en el store procedure
BEGIN
	INSERT INTO libros_usuarios(ibro_id, usuario_id) VALUES (libro_id, usuario_id);
	UPDATE libro SET stock = stock - 1 WHERE libros.libro_id = libro_id;

	SET cantidad = (SELECT stock FROM libros WHERE libros.libro_id = libro_id);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT, OUT cantidad INT)		# Store procedure con condiciones
BEGIN																			# Podemos utilizar de igual forma ELSEIF
																				# ELSEIF condicion
	SET cantidad = (SELECT stock FROM libros WHERE libros.libro_id = libro_id);

	IF acntidad > 0 THEN
		INSERT INTO libros_usuarios(ibro_id, usuario_id) VALUES (libro_id, usuario_id);
		UPDATE libro SET stock = stock - 1 WHERE libros.libro_id = libro_id;
		SET cantidad = cantidad - 1;

	else
		SELECT "No es posible realizar el préstamo" AS message_error;

	END IF;

END //
DELIMITER ;


# CASE, STORE PROCEDURE CON SENTENCIA CASE
DELIMITER //
CREATE PROCEDURE tipo_lector(usuario_id INT)
BEGIN
	SET @cantidad = (SELECT COUNT(*) FROM libros_usuarios WHERE libros_usuarios.libro_id = usuario_id);

	CASE
		WHEN @cantidad > 20 THEN
			SELECT "Fanático" AS mensaje;
		WHEN @cantidad > 10 AND < 20 THEN
			SELECT "Aficionado" AS mensaje;
		WHEN @cantidad > 5 AND < 10 THEN
			SELECT "Promedio" AS mensaje;
		ELSE
			SELECT "Nuevo" AS mensaje;
	END CASE;


	WHILE condicion DO 						# SENTENCIA WHILE
		SELECT ...;
	END WHILE;


	SET @iter = 1;							# SETENCIA REPEAT 
	REPEAT									# Repite hasta que se cumpla la condicion UNTIL
		SELECT ...;							# El ciclo se realiza por lo menos una vez

		UNTIL @iter >= 5;
	END REPEAT;
END//

DELIMITER ;