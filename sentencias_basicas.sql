SELECT * FROM tabla; 							# Obtiene todos los registros de la tabla
SELECT id, nombre FROM tabla; 					# Obtiene los campos que le indiquemos (id, nombre)
SELECT * FROM tabla WHERE nombre = 'nombre'; 	# Obtiene los registros que sean igual a nombre
SELECT * FROM tabla\G; 							# Muestra los registros en cartas

# OPERADORES LÓGICOS
SELECT * FROM tabla WHERE id=1 AND nombre='obed'; 	# AND	Todas las condiciones se tienen que cumplir
SELECT * FROM tabla WHERE id=1 OR nombre='obed'; 	# OR 	Al menos una condición se cumple
SELECT * FROM tabla WHERE apellido IS NOT NULL; 	# NOT 	Si es diferente de NULL

# Obtener registros mediante un rango
SELECT * FROM tabla WHERE fecha BETWEEN '1995' AND '2015';	# BETWEEN con string
SELECT * FROM tabla WHERE pagina BETWEEN 100 AND 200;		# BETWEEN con enteros

# Obtener registros mediante una lista
SELECT * FROM tabla WHERE nombre IN ('obed', 'jose', 'juan'); # IN()

SELECT DISTINCT nombre FROM tabla;					# DISTINCT Obtiene todos los nombres de la tabla sin que se repitan
SELECT id_nombre AS nombre FROM tabla;				# AS Para darle un alias (id_nombre se mostrará como nombre)
SELECT id_nombre AS nombre FROM tabla AS usuarios;	# Podemos hacer lo mismo con las tablas

# ACTUALIZAR REGISTROS
UPDATE tabla SET nombre='Nuevo nombre', apellido='apellido';	# Actualiza todos los registros
UPDATE tabla SET nombre='Nuevo' WHERE id=20;					# Actualiza un registro en particular

# ELIMINAR REGISTROS
DELETE FROM tabla 				# Elimina todos los registros
DELETE from tabla WHERE id=10;	# Elimina un registro en especifico

TRUNCATE tabla; 				# Elimina todos los registros de la tabla, resetea la definición de la tabla