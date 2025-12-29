--Doble NOT EXISTS
--Pregunta: Encontrar a los usuarios que son verdaderos fans de Gabriel García Márquez y han leído absolutamente todos los libros que tenemos de él en la biblioteca.
SELECT u.nombre_completo 
FROM public.usuarios u
WHERE NOT EXISTS (
    -- Paso 1: Buscamos todos los libros de García Márquez
    SELECT l.id_libro 
    FROM public.libros l
    JOIN public.libros_autores la ON l.id_libro = la.id_libro
    JOIN public.autores a ON la.id_autor = a.id_autor
    WHERE a.apellido = 'García Márquez'
    
    AND NOT EXISTS (
        -- Paso 2: Verificamos si el usuario (u) pidió ese libro específico
        SELECT 1 
        FROM public.prestamos p 
        WHERE p.id_usuario = u.id_usuario 
        AND p.id_libro = l.id_libro
    )
);
----------------------------------------------------------------------------------------------
--Agregación
--Pregunta: Queremos premiar a los usuarios que tienen una cultura general amplia. Buscamos a aquellos que han leído al menos un libro de cada una de las categorías que existen (Terror, Historia, Ciencia Ficción, etc.).
--Lógica: Contamos cuántas categorías distintas ha leído el usuario. Si ese número es igual al total de categorías que existen en la base de datos, entonces las leyó todas.
SELECT u.nombre_completo
FROM public.usuarios u
JOIN public.prestamos p ON u.id_usuario = p.id_usuario
JOIN public.libros l ON p.id_libro = l.id_libro
-- Agrupamos por usuario
GROUP BY u.nombre_completo
-- Filtramos: ¿La cantidad de categorías distintas que leyó este usuario...
HAVING COUNT(DISTINCT l.id_categoria) = (
    -- ...es igual al total de categorías que existen en la tabla 'categorias'?
    SELECT COUNT(*) FROM public.categorias
);
--------------------------------------------------------------------------------------------------
--Enfoque Conjuntos: EXCEPT
--Pregunta: Queremos saber si existe algún libro tan popular que haya sido prestado por absolutamente todos los usuarios registrados en el sistema.
--Lógica: Tomamos la lista de "Todos los Usuarios". Le restamos la lista de "Usuarios que leyeron el Libro X". Si el resultado es vacío (cero), significa que no faltó nadie por leerlo.
SELECT l.titulo
FROM public.libros l
WHERE NOT EXISTS (
    -- Conjunto A: Todos los usuarios existentes
    (SELECT id_usuario FROM public.usuarios)
    EXCEPT
    -- Conjunto B: Usuarios que han pedido prestado ESTE libro (l)
    (SELECT p.id_usuario 
     FROM public.prestamos p 
     WHERE p.id_libro = l.id_libro)
);
