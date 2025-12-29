--Conteo Simple (COUNT + GROUP BY)
--Pregunta: ¿Cuántos libros tenemos registrados por cada categoría?
SELECT 
    c.nombre AS Categoria, 
    COUNT(l.id_libro) AS Total_Libros
FROM public.categorias c
JOIN public.libros l ON c.id_categoria = l.id_categoria
GROUP BY c.nombre
ORDER BY Total_Libros DESC;
--------------------------------------------------------------
--Promedio Matemático (AVG)
--Pregunta: ¿Cuál es el precio promedio de los libros en cada categoría?
SELECT 
    c.nombre AS Categoria, 
    ROUND(AVG(l.precio), 2) AS Precio_Promedio
FROM public.categorias c
JOIN public.libros l ON c.id_categoria = l.id_categoria
GROUP BY c.nombre;
---------------------------------------------------------------
--Filtros sobre Grupos (HAVING)
--Pregunta: ¿Qué autores tienen más de 1 libro registrado en nuestro sistema?
SELECT 
    a.apellido, 
    COUNT(la.id_libro) AS Cantidad_Libros
FROM public.autores a
JOIN public.libros_autores la ON a.id_autor = la.id_autor
GROUP BY a.apellido
HAVING COUNT(la.id_libro) > 1;
------------------------------------------------------------------
--Valores Extremos (MIN / MAX)
--Pregunta: Por cada editorial, ¿cuál es el precio del libro más barato y del más caro que publican?
SELECT 
    e.nombre AS Editorial,
    MIN(l.precio) AS Precio_Minimo,
    MAX(l.precio) AS Precio_Maximo
FROM public.editoriales e
JOIN public.libros l ON e.id_editorial = l.id_editorial
GROUP BY e.nombre;
-----------------------------------------------------------------------
--Suma Total (SUM) y Ranking
--Pregunta: ¿Quiénes son los 5 usuarios que más préstamos han realizado históricamente?
SELECT 
    u.nombre_completo, 
    COUNT(p.id_prestamo) AS Total_Prestamos
FROM public.usuarios u
JOIN public.prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.nombre_completo
ORDER BY Total_Prestamos DESC
LIMIT 5;
