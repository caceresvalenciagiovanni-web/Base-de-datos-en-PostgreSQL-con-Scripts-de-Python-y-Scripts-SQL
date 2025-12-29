--Comparación Numérica
--Pregunta: ¿Qué libros son más caros que todos los libros de la categoría 'Infantil'?
SELECT title, precio
FROM public.libros
WHERE precio > ALL (
    -- Subconsulta: Obtiene la lista de precios de todos los libros infantiles
    SELECT l2.precio
    FROM public.libros l2
    JOIN public.categorias c ON l2.id_categoria = c.id_categoria
    WHERE c.nombre = 'Infantil'
);
----------------------------------------------------------------------------------------
--Comparación Temporal
--Pregunta: ¿Qué préstamos se realizaron después de todas las fechas en las que 'Juan Pérez' pidió un libro?
SELECT id_prestamo, fecha_prestamo
FROM public.prestamos
WHERE fecha_prestamo > ALL (
    -- Subconsulta: Lista de todas las fechas en que Juan Pérez pidió algo
    SELECT p2.fecha_prestamo
    FROM public.prestamos p2
    JOIN public.usuarios u ON p2.id_usuario = u.id_usuario
    WHERE u.nombre_completo = 'Juan Pérez'
);
