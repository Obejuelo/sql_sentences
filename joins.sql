SELECT titulo FROM libros
INNER JOIN autores ON libros.autor_id = autores.autor_id;	# Unimos los registros de dos tablas que tengan
															# una llave foranea con INNER JOIN
