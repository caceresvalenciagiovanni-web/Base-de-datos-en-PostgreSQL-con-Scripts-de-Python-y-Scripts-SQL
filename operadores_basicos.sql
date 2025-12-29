--Operador Proyección
--Consulta: "Quiero ver solo una lista con el título y el precio de los libros, sin que me estorben los demás datos (ID, ISBN, etc.)."
SELECT titulo, precio 
FROM public.libros;
-- Operador: Selección
--Consulta: "Quiero encontrar todos los libros que cuesten menos de $20."
SELECT * FROM public.libros 
WHERE precio < 20.00;
-----------------------------------------------------------------------------------------
--Operador: Reunión Natural / Join
--Consulta: "Quiero saber los nombres de los usuarios y qué libros tienen prestados actualmente."
SELECT 
    u.nombre_completo AS Usuario, 
    l.titulo AS Libro_Prestado,
    p.fecha_prestamo
FROM public.prestamos p
JOIN public.usuarios u ON p.id_usuario = u.id_usuario
JOIN public.libros l ON p.id_libro = l.id_libro
WHERE p.estado = 'En curso';
---------------------------------------------------------------------------------------
--Operador: Selección + Join
--Consulta: "¿Cuáles son todos los libros escritos por 'Gabriel García Márquez'?"
SELECT l.titulo, a.nombre, a.apellido
FROM public.libros l
JOIN public.libros_autores la ON l.id_libro = la.id_libro
JOIN public.autores a ON la.id_autor = a.id_autor
WHERE a.apellido = 'García Márquez';
-------------------------------------------------------------------------------------
--Operador: Diferencia de Conjuntos
--Consulta: "¿Qué libros NUNCA han sido prestados a nadie?"
SELECT titulo 
FROM public.libros
WHERE id_libro NOT IN (
    SELECT DISTINCT id_libro FROM public.prestamos
);
