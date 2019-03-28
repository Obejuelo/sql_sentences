# BÚSQUEDA
SELECT * FROM tabla WHERE nombre LIKE '%palabra%'; 	# LIKE busca en todo el string con % palabra %
SELECT * FROM tabla WHERE nombre LIKE 'palabra%';	# Si buscamos que empieze 'palabra%'
SELECT * FROM tabla WHERE nombre LIKE '%palabra';	# Si buscamos que termine '%palabra'
SELECT * FROM tabla WHERE nombre LIKE '_____';		# Si buscamos que contenga 5 caracteres, lo hacemos con _
# Con LIKE podemos combinar todas las condiciones


# EXPRESIONES REGULARES
SELECT titulo FROM tabla WHERE titulo REGEXP '^[HL]'
# REGEXP '' Expresión regular para buscar que empiece con H o L


# ORDENAR REGISTROS
SELECT titulo FROM tabla ORDER BY titulo; 		# Los ordena de forma ascendente por defecto
SELECT titulo FROM tabla ORDER BY titulo DESC;	# Los ordena de forma descendente


#LIMITAR REGISTROS
SELECT titulo FROM tabla LIMIT 10; 			# Obtiene los primeros 10 registros
SELECT titulo FROM tabla LIMIT 0, 10;		# Obtiene desde el 0, 10 registros (10, 5)desde el 10 5 registros


# FUNCIONES DE AGREGACIÓN
SELECT COUNT(*) FROM tabla;					# Cuenta todos los registros que tiene la tabla
SELECT SUM(numero) FROM tabla;				# Suma todos los valores (Solo con enteros)
SELECT MAX(numero) FROM tabla;				# Devuelve el numero mayor
SELECT MIN(numero) FROM tabla;				# Devuelve el número menor
SELECT AVG(numero) FROM tabla;				# Devuelve el promedio

SELECT id, COUNT(autor) FROM tabla GROUP BY id; # Para que no nos arroje un error

SELECT CONCAT(nombre, apellido) FROM tabla,
UNION											# Con UNION unimos el resultado de dos sentencias
SELECT CONCAT(nombre, apellido) FROM tabla2;