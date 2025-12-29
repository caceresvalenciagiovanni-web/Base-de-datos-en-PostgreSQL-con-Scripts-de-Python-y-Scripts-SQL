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

## 🚀 Instrucciones de Ejecución
Sigue estos pasos para desplegar la base de datos en tu entorno local.

Prerrequisitos
PostgreSQL (versión 12 o superior).

pgAdmin 4 (o cualquier cliente SQL como DBeaver/Datagrip).

Pasos de Instalación
1) Clonar el repositorio: Descarga este proyecto en tu computadora.
git clone [https://github.com/TU_USUARIO/NOMBRE_DEL_REPO.git](https://github.com/TU_USUARIO/NOMBRE_DEL_REPO.git)

2) Crear la Base de Datos:

Abre pgAdmin 4.

Crea una nueva base de datos llamada Biblioteca_CICS (o el nombre que prefieras).

3) Ejecutar el Script SQL:

En pgAdmin, haz clic derecho sobre tu nueva base de datos y selecciona Query Tool (Herramienta de Consultas).

Abre el archivo .sql incluido en este repositorio (Botón "Open File" o carpeta).

Ejecuta todo el script presionando F5 o el botón de "Play".
Verificación
Una vez ejecutado, la base de datos se poblará automáticamente con:

90+ Autores reales.

90+ Libros clásicos y modernos.

50 Usuarios ficticios.

40 Préstamos con fechas aleatorias generadas dinámicamente.

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
