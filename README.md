# Base-de-datos-en-PostgreSQL-con-Scripts-de-Python-y-Scripts-SQL
Base de Datos creada para las prácticas 7, 8 y 9 de la unidad de aprendizaje homónima
Base de datos de una biblioteca digital
Nombre del alumno: Giovanni Caceres Valencia
# 📚 Sistema de Gestión Bibliotecaria (SQL)

Este proyecto consiste en el diseño, implementación y población de una base de datos relacional robusta para la gestión de una biblioteca (basada en el caso de estudio CICS Milpa Alta).

El sistema está desarrollado en **PostgreSQL** y cuenta con scripts para la generación de estructuras, integridad referencial y carga masiva de datos de prueba (seed data).

## 📖 Descripción del Dominio del Problema

El objetivo principal es administrar el flujo de préstamos de material bibliográfico. El sistema resuelve las siguientes necesidades de negocio:

* **Gestión de Catálogo:** Registro de libros con detalles como ISBN, precio, año de publicación y enlaces digitales.
* **Clasificación:** Organización mediante categorías jerárquicas y editoriales.
* **Autoría Múltiple:** Soporte para la relación "muchos a muchos" entre libros y autores (un libro puede tener varios autores y viceversa).
* **Control de Usuarios:** Administración de lectores registrados.
* **Circulación:** Registro de préstamos con fechas de salida, devolución esperada y real.
* **Sanciones:** Generación de multas para devoluciones tardías (estructura preparada).

## 🗂 Modelo Relacional (Diagrama ER)

El esquema de la base de datos está normalizado para asegurar la integridad de los datos.

```mermaid
erDiagram
    AUTORES ||--|{ LIBROS_AUTORES : escriben
    LIBROS ||--|{ LIBROS_AUTORES : tienen
    CATEGORIAS ||--|{ LIBROS : clasifican
    EDITORIALES ||--|{ LIBROS : publican
    USUARIOS ||--|{ PRESTAMOS : realizan
    LIBROS ||--|{ PRESTAMOS : son_prestados
    PRESTAMOS ||--o{ MULTAS : generan

    AUTORES {
        int id_autor PK
        string nombre
        string apellido
        string nacionalidad
    }
    LIBROS {
        int id_libro PK
        string titulo
        string isbn
        decimal precio
        int id_categoria FK
        int id_editorial FK
    }
    PRESTAMOS {
        int id_prestamo PK
        date fecha_prestamo
        date fecha_devolucion
        string estado
    }
