--La Reunión Natural (INNER JOIN)
--Pregunta: Muestra el título del libro y el nombre de su autor.
SELECT 
    l.titulo, 
    a.nombre || ' ' || a.apellido AS autor_completo
FROM public.libros l
INNER JOIN public.libros_autores la ON l.id_libro = la.id_libro
INNER JOIN public.autores a ON la.id_autor = a.id_autor;
--------------------------------------------------------------------
--La Reunión Externa por la Izquierda (LEFT JOIN)
--Pregunta: Muestra todos los usuarios y la fecha de sus préstamos (si los tienen).
SELECT 
    u.nombre_completo, 
    p.fecha_prestamo
FROM public.usuarios u
LEFT JOIN public.prestamos p ON u.id_usuario = p.id_usuario
-- Opcional: Si agregas esto, filtras SOLO a los que nunca han pedido nada
-- WHERE p.id_prestamo IS NULL; 
ORDER BY u.nombre_completo;
------------------------------------------------------------------------
--La Reunión Externa por la Derecha (RIGHT JOIN)
--Pregunta: Muestra los libros asociados a cada editorial, asegurando que aparezcan todas las editoriales.
SELECT 
    e.nombre AS editorial,
    l.titulo
FROM public.libros l
RIGHT JOIN public.editoriales e ON l.id_editorial = e.id_editorial;
-------------------------------------------------------------------------------
--La Reunión Externa Completa (FULL OUTER JOIN)
--Pregunta: Muestra todo el catálogo cruzado con autores, sin omitir nada de ningún lado.
SELECT 
    l.titulo, 
    a.apellido AS autor
FROM public.libros l
FULL OUTER JOIN public.libros_autores la ON l.id_libro = la.id_libro
FULL OUTER JOIN public.autores a ON la.id_autor = a.id_autor;
-----------------------------------------------------------------------------------
--El Producto Cartesiano (CROSS JOIN)
--Pregunta: Genera una lista combinando a cada usuario con cada categoría literaria existente.
SELECT 
    u.nombre_completo, 
    c.nombre AS categoria_interes
FROM public.usuarios u
CROSS JOIN public.categorias c;
