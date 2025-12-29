--
-- PostgreSQL database dump
--

\restrict 0DGuxHDo7yGmgBrhPJTuveRod7XeS7XZrclEAX1oOGaGIhmQsgePf9GW6m0Yy0T

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-29 00:07:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16520)
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    id_autor integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    nacionalidad character varying(50),
    fecha_nacimiento date,
    biografia text
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16528)
-- Name: autores_id_autor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autores_id_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autores_id_autor_seq OWNER TO postgres;

--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 220
-- Name: autores_id_autor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autores_id_autor_seq OWNED BY public.autores.id_autor;


--
-- TOC entry 221 (class 1259 OID 16529)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    codigo_clasificacion character varying(10),
    id_categoria_padre integer
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16536)
-- Name: categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 222
-- Name: categorias_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;


--
-- TOC entry 231 (class 1259 OID 16617)
-- Name: editoriales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editoriales (
    id_editorial integer NOT NULL,
    nombre character varying(100) NOT NULL,
    pais character varying(50),
    sitio_web character varying(100)
);


ALTER TABLE public.editoriales OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16616)
-- Name: editoriales_id_editorial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editoriales_id_editorial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.editoriales_id_editorial_seq OWNER TO postgres;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 230
-- Name: editoriales_id_editorial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editoriales_id_editorial_seq OWNED BY public.editoriales.id_editorial;


--
-- TOC entry 223 (class 1259 OID 16537)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    id_libro integer NOT NULL,
    titulo character varying(200) NOT NULL,
    isbn character varying(20),
    anio_publicacion integer,
    editorial character varying(100),
    archivo_digital_url character varying(255),
    id_categoria integer,
    precio numeric(10,2),
    id_editorial integer
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16544)
-- Name: libros_autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros_autores (
    id_libro integer NOT NULL,
    id_autor integer NOT NULL,
    rol_contribucion character varying(50)
);


ALTER TABLE public.libros_autores OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16549)
-- Name: libros_id_libro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_id_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libros_id_libro_seq OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 225
-- Name: libros_id_libro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_id_libro_seq OWNED BY public.libros.id_libro;


--
-- TOC entry 233 (class 1259 OID 16631)
-- Name: multas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.multas (
    id_multa integer NOT NULL,
    id_prestamo integer NOT NULL,
    monto numeric(10,2) NOT NULL,
    fecha_generacion date DEFAULT CURRENT_DATE,
    estado_pago character varying(20) DEFAULT 'Pendiente'::character varying
);


ALTER TABLE public.multas OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16630)
-- Name: multas_id_multa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.multas_id_multa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.multas_id_multa_seq OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 232
-- Name: multas_id_multa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.multas_id_multa_seq OWNED BY public.multas.id_multa;


--
-- TOC entry 226 (class 1259 OID 16550)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    id_prestamo integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    fecha_prestamo date DEFAULT CURRENT_DATE NOT NULL,
    fecha_devolucion_esperada date NOT NULL,
    fecha_devolucion_real date,
    estado character varying(20) DEFAULT 'En curso'::character varying
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16560)
-- Name: prestamos_id_prestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_id_prestamo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prestamos_id_prestamo_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_id_prestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_id_prestamo_seq OWNED BY public.prestamos.id_prestamo;


--
-- TOC entry 228 (class 1259 OID 16561)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre_completo character varying(150) NOT NULL,
    correo_electronico character varying(100) NOT NULL,
    telefono character varying(20),
    direccion character varying(200),
    fecha_registro date DEFAULT CURRENT_DATE,
    activo boolean DEFAULT true
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16569)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 4789 (class 2604 OID 16570)
-- Name: autores id_autor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores ALTER COLUMN id_autor SET DEFAULT nextval('public.autores_id_autor_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 16571)
-- Name: categorias id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 16620)
-- Name: editoriales id_editorial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales ALTER COLUMN id_editorial SET DEFAULT nextval('public.editoriales_id_editorial_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16572)
-- Name: libros id_libro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN id_libro SET DEFAULT nextval('public.libros_id_libro_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 16634)
-- Name: multas id_multa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multas ALTER COLUMN id_multa SET DEFAULT nextval('public.multas_id_multa_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16573)
-- Name: prestamos id_prestamo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN id_prestamo SET DEFAULT nextval('public.prestamos_id_prestamo_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 16574)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4976 (class 0 OID 16520)
-- Dependencies: 219
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (1, 'Gabriel', 'García Márquez', 'Colombiana', '1927-03-06', 'Premio Nobel, creador del realismo mágico.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (2, 'J.K.', 'Rowling', 'Británica', '1965-07-31', 'Autora de la saga de Harry Potter.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (3, 'Stephen', 'King', 'Estadounidense', '1947-09-21', 'El maestro del terror contemporáneo.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (4, 'Isaac', 'Asimov', 'Rusa-Estadounidense', '1920-01-02', 'Prolífico autor de ciencia ficción y divulgación.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (5, 'Jane', 'Austen', 'Británica', '1775-12-16', 'Novelista conocida por su ironía y crítica social.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (6, 'George', 'Orwell', 'Británica', '1903-06-25', 'Periodista y escritor distópico.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (7, 'Isabel', 'Allende', 'Chilena', '1942-08-02', 'Escritora superventas en español.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (8, 'J.R.R.', 'Tolkien', 'Británica', '1892-01-03', 'Padre de la literatura fantástica moderna.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (9, 'Agatha', 'Christie', 'Británica', '1890-09-15', 'Escritora especializada en género policial.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (10, 'Mario', 'Vargas Llosa', 'Peruana', '1936-03-28', 'Premio Nobel de Literatura.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (11, 'Autor', 'Novato', 'Desconocida', NULL, NULL);
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (12, 'Julio', 'Cortázar', 'Argentina', '1914-08-26', 'Maestro del cuento corto y figura del Boom latinoamericano.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (13, 'Jorge Luis', 'Borges', 'Argentina', '1899-08-24', 'Destacado por sus cuentos, ensayos y poemas filosóficos.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (14, 'Juan', 'Rulfo', 'Mexicana', '1917-05-16', 'Autor de Pedro Páramo y El Llano en llamas.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (15, 'Carlos', 'Fuentes', 'Mexicana', '1928-11-11', 'Escritor, intelectual y diplomático mexicano.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (16, 'Octavio', 'Paz', 'Mexicana', '1914-03-31', 'Poeta y ensayista, Premio Nobel de Literatura 1990.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (17, 'Elena', 'Poniatowska', 'Mexicana', '1932-05-19', 'Periodista y escritora, conocida por La noche de Tlatelolco.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (18, 'Rosario', 'Castellanos', 'Mexicana', '1925-05-25', 'Una de las escritoras mexicanas más importantes del siglo XX.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (19, 'Gabriela', 'Mistral', 'Chilena', '1889-04-07', 'Poeta, diplomática y pedagoga, Premio Nobel 1945.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (20, 'Pablo', 'Neruda', 'Chilena', '1904-07-12', 'Poeta y político, Premio Nobel 1971.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (21, 'Ernesto', 'Sabato', 'Argentina', '1911-06-24', 'Físico y escritor, autor de El túnel.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (22, 'Mario', 'Benedetti', 'Uruguaya', '1920-09-14', 'Escritor y poeta integrante de la Generación del 45.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (23, 'Eduardo', 'Galeano', 'Uruguaya', '1940-09-03', 'Periodista y escritor, autor de Las venas abiertas de América Latina.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (24, 'Horacio', 'Quiroga', 'Uruguaya', '1878-12-31', 'Cuentista, dramaturgo y poeta, maestro del cuento latinoamericano.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (25, 'Alejo', 'Carpentier', 'Cubana', '1904-12-26', 'Novelista y musicólogo que influyó en el realismo mágico.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (26, 'José', 'Martí', 'Cubana', '1853-01-28', 'Político, ensayista, periodista y filósofo.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (27, 'Miguel Ángel', 'Asturias', 'Guatemalteca', '1899-10-19', 'Premio Nobel, precursor del realismo mágico.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (28, 'Rubén', 'Darío', 'Nicaragüense', '1867-01-18', 'Máximo representante del modernismo literario.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (29, 'Laura', 'Esquivel', 'Mexicana', '1950-09-30', 'Autora de Como agua para chocolate.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (30, 'Isabel', 'Allende', 'Chilena', '1942-08-02', 'Escritora viva de lengua española más leída del mundo.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (31, 'Roberto', 'Bolaño', 'Chilena', '1953-04-28', 'Autor de Los detectives salvajes y 2666.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (32, 'William', 'Shakespeare', 'Británica', '1564-04-26', 'Dramaturgo y poeta, considerado el escritor más importante en lengua inglesa.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (33, 'Miguel', 'de Cervantes', 'Española', '1547-09-29', 'Novelista, poeta y dramaturgo, autor del Quijote.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (34, 'Franz', 'Kafka', 'Checa', '1883-07-03', 'Autor de obras influyentes como La metamorfosis.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (35, 'Fyodor', 'Dostoevsky', 'Rusa', '1821-11-11', 'Exploró la psicología humana en el contexto político, social y espiritual.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (36, 'Leo', 'Tolstoy', 'Rusa', '1828-09-09', 'Autor de Guerra y Paz y Ana Karenina.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (37, 'Charles', 'Dickens', 'Británica', '1812-02-07', 'Escritor y crítico social de la era victoriana.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (38, 'Victor', 'Hugo', 'Francesa', '1802-02-26', 'Poeta, dramaturgo y novelista romántico.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (39, 'Gustave', 'Flaubert', 'Francesa', '1821-12-12', 'Conocido por su primera novela publicada, Madame Bovary.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (40, 'Mark', 'Twain', 'Estadounidense', '1835-11-30', 'Escritor y humorista, autor de Las aventuras de Tom Sawyer.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (41, 'Ernest', 'Hemingway', 'Estadounidense', '1899-07-21', 'Periodista y escritor, influencia clave en la ficción del siglo XX.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (42, 'Oscar', 'Wilde', 'Irlandesa', '1854-10-16', 'Dramaturgo y novelista conocido por su ingenio.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (43, 'James', 'Joyce', 'Irlandesa', '1882-02-02', 'Novelista y poeta, figura clave del modernismo.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (44, 'Virginia', 'Woolf', 'Británica', '1882-01-25', 'Escritora modernista, pionera en el uso del flujo de conciencia.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (45, 'Marcel', 'Proust', 'Francesa', '1871-07-10', 'Autor de En busca del tiempo perdido.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (46, 'Herman', 'Melville', 'Estadounidense', '1819-08-01', 'Novelista, poeta y ensayista, autor de Moby Dick.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (47, 'Edgar Allan', 'Poe', 'Estadounidense', '1809-01-19', 'Escritor romántico, maestro del relato corto de terror.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (48, 'Arthur', 'Conan Doyle', 'Británica', '1859-05-22', 'Creador del famoso detective Sherlock Holmes.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (49, 'Homero', 'El Griego', 'Griega', NULL, 'Poeta de la Antigua Grecia, autor de la Ilíada y la Odisea.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (50, 'Dante', 'Alighieri', 'Italiana', '1265-06-01', 'Poeta italiano, conocido por escribir la Divina Comedia.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (51, 'Jane', 'Austen', 'Británica', '1775-12-16', 'Conocida por sus 6 novelas principales sobre la nobleza terrateniente.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (52, 'H.P.', 'Lovecraft', 'Estadounidense', '1890-08-20', 'Autor de novelas de terror y ciencia ficción.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (53, 'Ray', 'Bradbury', 'Estadounidense', '1920-08-22', 'Escritor de misterio, fantasía y ciencia ficción (Fahrenheit 451).');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (54, 'Philip K.', 'Dick', 'Estadounidense', '1928-12-16', 'Influyente escritor de ciencia ficción que exploró la sociología y política.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (55, 'Frank', 'Herbert', 'Estadounidense', '1920-10-08', 'Famoso por la novela de ciencia ficción Dune.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (56, 'Ursula K.', 'Le Guin', 'Estadounidense', '1929-10-21', 'Maestra de la ciencia ficción y fantasía especulativa.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (57, 'George R.R.', 'Martin', 'Estadounidense', '1948-09-20', 'Escritor de literatura fantástica, autor de Canción de hielo y fuego.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (58, 'Neil', 'Gaiman', 'Británica', '1960-11-10', 'Autor de cómics y ciencia ficción (Sandman, Coraline).');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (59, 'Terry', 'Pratchett', 'Británica', '1948-04-28', 'Autor de la serie de fantasía cómica Mundodisco.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (60, 'C.S.', 'Lewis', 'Británica', '1898-11-29', 'Autor de Las Crónicas de Narnia.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (61, 'Mary', 'Shelley', 'Británica', '1797-08-30', 'Autora de la novela gótica Frankenstein.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (62, 'Bram', 'Stoker', 'Irlandesa', '1847-11-08', 'Conocido por su novela Drácula.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (63, 'Jules', 'Verne', 'Francesa', '1828-02-08', 'Pionero de la ciencia ficción (Viaje al centro de la Tierra).');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (64, 'H.G.', 'Wells', 'Británica', '1866-09-21', 'Prolífico escritor de ciencia ficción (La guerra de los mundos).');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (65, 'Aldous', 'Huxley', 'Británica', '1894-07-26', 'Autor de Un mundo feliz.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (66, 'Margaret', 'Atwood', 'Canadiense', '1939-11-18', 'Autora de El cuento de la criada.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (67, 'Haruki', 'Murakami', 'Japonesa', '1949-01-12', 'Escritor y traductor, autor de Tokio Blues.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (68, 'Paulo', 'Coelho', 'Brasileña', '1947-08-24', 'Novelista y dramaturgo, autor de El Alquimista.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (69, 'Ken', 'Follett', 'Británica', '1949-06-05', 'Autor de thrillers y novelas históricas como Los pilares de la Tierra.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (70, 'Dan', 'Brown', 'Estadounidense', '1964-06-22', 'Autor de novelas de misterio como El código Da Vinci.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (71, 'John', 'Grisham', 'Estadounidense', '1955-02-08', 'Conocido por sus thrillers legales.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (72, 'Stephenie', 'Meyer', 'Estadounidense', '1973-12-24', 'Autora de la saga Crepúsculo.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (73, 'Suzanne', 'Collins', 'Estadounidense', '1962-08-10', 'Autora de Los juegos del hambre.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (74, 'Rick', 'Riordan', 'Estadounidense', '1964-06-05', 'Conocido por la serie de Percy Jackson.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (75, 'Umberto', 'Eco', 'Italiana', '1932-01-05', 'Semiólogo, filósofo y escritor (El nombre de la rosa).');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (76, 'Milan', 'Kundera', 'Checa', '1929-04-01', 'Autor de La insoportable levedad del ser.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (77, 'Orhan', 'Pamuk', 'Turca', '1952-06-07', 'Premio Nobel de Literatura 2006.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (78, 'Kazuo', 'Ishiguro', 'Británica', '1954-11-08', 'Premio Nobel de Literatura 2017.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (79, 'Chimamanda', 'Ngozi Adichie', 'Nigeriana', '1977-09-15', 'Escritora feminista, autora de Americanah.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (80, 'Khaled', 'Hosseini', 'Afgana', '1965-03-04', 'Autor de Cometas en el cielo.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (81, 'Yuval Noah', 'Harari', 'Israelí', '1976-02-24', 'Historiador y escritor de Sapiens.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (82, 'Friedrich', 'Nietzsche', 'Alemana', '1844-10-15', 'Filósofo influyente del siglo XIX.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (83, 'Jean-Paul', 'Sartre', 'Francesa', '1905-06-21', 'Exponente del existencialismo y marxismo humanista.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (84, 'Simone', 'de Beauvoir', 'Francesa', '1908-01-09', 'Escritora, profesora y filósofa feminista.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (85, 'Albert', 'Camus', 'Argelina', '1913-11-07', 'Novelista y dramaturgo, autor de El extranjero.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (86, 'Sigmund', 'Freud', 'Austriaca', '1856-05-06', 'Padre del psicoanálisis.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (87, 'Carl', 'Jung', 'Suiza', '1875-07-26', 'Fundador de la psicología analítica.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (88, 'Karl', 'Marx', 'Alemana', '1818-05-05', 'Filósofo, economista y sociólogo.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (89, 'Platón', 'El Filósofo', 'Griega', NULL, 'Filósofo griego seguidor de Sócrates y maestro de Aristóteles.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (90, 'Aristóteles', 'El Estagirita', 'Griega', NULL, 'Polímata: filósofo, lógico y científico de la Antigua Grecia.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (91, 'Maquiavelo', 'Nicolás', 'Italiana', '1469-05-03', 'Diplomático y filósofo político (El Príncipe).');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (92, 'Sun', 'Tzu', 'China', NULL, 'General y estratega militar, autor de El arte de la guerra.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (93, 'Confucio', 'Kong Qiu', 'China', NULL, 'Pensador y educador chino.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (94, 'Rumi', 'Jalal al-Din', 'Persa', '1207-09-30', 'Poeta místico musulmán.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (95, 'Garcilaso', 'de la Vega', 'Española', '1501-01-01', 'Poeta y militar del Siglo de Oro.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (96, 'Lope', 'de Vega', 'Española', '1562-11-25', 'Uno de los poetas y dramaturgos más importantes del Siglo de Oro.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (97, 'Federico', 'García Lorca', 'Española', '1898-06-05', 'Poeta, dramaturgo y prosista de la generación del 27.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (98, 'Antonio', 'Machado', 'Española', '1875-07-26', 'Poeta, el más joven representante de la generación del 98.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (99, 'Gustavo Adolfo', 'Bécquer', 'Española', '1836-02-17', 'Poeta y narrador del Romanticismo.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (100, 'Benito', 'Pérez Galdós', 'Española', '1843-05-10', 'Novelista, dramaturgo, cronista y político.');
INSERT INTO public.autores (id_autor, nombre, apellido, nacionalidad, fecha_nacimiento, biografia) VALUES (101, 'Emilia', 'Pardo Bazán', 'Española', '1851-09-16', 'Novelista, periodista, ensayista y crítica literaria.');


--
-- TOC entry 4978 (class 0 OID 16529)
-- Dependencies: 221
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (3, 'Terror', 'Obras diseñadas para causar miedo.', 'TRR-003', NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (4, 'Romance', 'Historias centradas en relaciones amorosas.', 'ROM-004', NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (5, 'Historia', 'Narración de sucesos del pasado.', 'HIS-005', NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (6, 'Biografía', 'Vida de una persona escrita por otra.', 'BIO-006', NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (7, 'Tecnología', 'Informática, ingeniería y avances.', 'TEC-007', NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (8, 'Infantil', 'Literatura dirigida a niños.', 'INF-008', NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (9, 'Fantasía', 'Elementos mágicos y sobrenaturales.', 'FAN-009', NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (10, 'Poesía', 'Expresión artística mediante versos.', 'POE-010', NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (100, 'Ficción General', NULL, NULL, NULL);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (1, 'Novela', 'Narrativa de ficción extensa.', 'NOV-001', 100);
INSERT INTO public.categorias (id_categoria, nombre, descripcion, codigo_clasificacion, id_categoria_padre) VALUES (2, 'Ciencia Ficción', 'Impacto de la ciencia y tecnología.', 'CFI-002', 100);


--
-- TOC entry 4988 (class 0 OID 16617)
-- Dependencies: 231
-- Data for Name: editoriales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.editoriales (id_editorial, nombre, pais, sitio_web) VALUES (1, 'Editorial Genérica', NULL, NULL);


--
-- TOC entry 4980 (class 0 OID 16537)
-- Dependencies: 223
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (1, 'Cien años de soledad', '978-0307474728', 1967, 'Editorial Sudamericana', 'url_cien_anios.pdf', 1, 23.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (2, 'Harry Potter y la piedra filosofal', '978-8478884452', 1997, 'Bloomsbury', 'url_harry_piedra.epub', 9, 38.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (3, 'It (Eso)', '978-1501142970', 1986, 'Viking Press', 'url_it_king.pdf', 3, 79.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (4, 'Yo, Robot', '978-0553294385', 1950, 'Gnome Press', 'url_yo_robot.pdf', 2, 98.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (5, 'Orgullo y Prejuicio', '978-0141439518', 1813, 'T. Egerton', 'url_orgullo.epub', 4, 19.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (6, '1984', '978-0451524935', 1949, 'Secker & Warburg', 'url_1984.pdf', 2, 49.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (7, 'La casa de los espíritus', '978-0060149595', 1982, 'Plaza & Janés', 'url_casa_espiritus.pdf', 1, 64.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (8, 'El Señor de los Anillos', '978-0544003415', 1954, 'Allen & Unwin', 'url_anillos.epub', 9, 59.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (9, 'Asesinato en el Orient Express', '978-0062073488', 1934, 'Collins Crime Club', 'url_orient_express.pdf', 1, 80.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (10, 'La ciudad y los perros', '978-8420471839', 1963, 'Seix Barral', 'url_ciudad_perros.pdf', 1, 35.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (11, 'El Libro Anónimo', NULL, 2025, NULL, NULL, 1, 83.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (12, 'El Aleph', NULL, 1949, NULL, NULL, 1, 86.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (124, 'Rayuela', '978-0307951-100', 1963, NULL, NULL, 1, 25.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (125, 'Bestiario', '978-8420400-101', 1951, NULL, NULL, 100, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (126, 'Ficciones', '978-0307952-102', 1944, NULL, NULL, 100, 22.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (127, 'El Aleph', '978-0307953-103', 1949, NULL, NULL, 100, 22.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (128, 'Pedro Páramo', '978-8437604-104', 1955, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (129, 'El llano en llamas', '978-8437605-105', 1953, NULL, NULL, 100, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (130, 'Aura', '978-8437606-106', 1962, NULL, NULL, 1, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (131, 'La muerte de Artemio Cruz', '978-0374522-107', 1962, NULL, NULL, 1, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (132, 'El laberinto de la soledad', '978-0140157-108', 1950, NULL, NULL, 100, 19.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (133, 'La noche de Tlatelolco', '978-9684112-109', 1971, NULL, NULL, 5, 21.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (134, 'Balún Canán', '978-9681603-110', 1957, NULL, NULL, 1, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (135, 'Desolación', '978-8467021-111', 1922, NULL, NULL, 10, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (136, 'Veinte poemas de amor y una canción desesperada', '978-0307954-112', 1924, NULL, NULL, 10, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (137, 'Canto General', '978-8437607-113', 1950, NULL, NULL, 10, 25.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (138, 'El túnel', '978-8437608-114', 1948, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (139, 'Sobre héroes y tumbas', '978-8432216-115', 1961, NULL, NULL, 1, 24.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (140, 'La tregua', '978-8420410-116', 1960, NULL, NULL, 1, 19.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (141, 'Las venas abiertas de América Latina', '978-0853459-117', 1971, NULL, NULL, 5, 22.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (142, 'Cuentos de amor de locura y de muerte', '978-8497402-118', 1917, NULL, NULL, 100, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (143, 'El reino de este mundo', '978-8432218-119', 1949, NULL, NULL, 1, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (144, 'Versos sencillos', '978-8437609-120', 1891, NULL, NULL, 10, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (145, 'El Señor Presidente', '978-8437610-121', 1946, NULL, NULL, 1, 21.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (146, 'Azul...', '978-8437611-122', 1888, NULL, NULL, 10, 17.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (147, 'Como agua para chocolate', '978-0385420-123', 1989, NULL, NULL, 4, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (148, 'Paula', '978-0060927-124', 1994, NULL, NULL, 6, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (149, 'Los detectives salvajes', '978-8433966-125', 1998, NULL, NULL, 1, 26.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (150, '2666', '978-0312429-126', 2004, NULL, NULL, 1, 30.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (151, 'Hamlet', '978-0743477-127', 1603, NULL, NULL, 1, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (152, 'Romeo y Julieta', '978-0743478-128', 1597, NULL, NULL, 4, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (153, 'Macbeth', '978-0743479-129', 1606, NULL, NULL, 1, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (154, 'Don Quijote de la Mancha', '978-8420412-130', 1605, NULL, NULL, 1, 35.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (155, 'Novelas ejemplares', '978-8437612-131', 1613, NULL, NULL, 100, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (156, 'La metamorfosis', '978-0553213-132', 1915, NULL, NULL, 1, 12.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (157, 'El proceso', '978-0805210-133', 1925, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (158, 'Crimen y castigo', '978-0140449-134', 1866, NULL, NULL, 1, 22.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (159, 'Los hermanos Karamazov', '978-0374528-135', 1880, NULL, NULL, 1, 28.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (160, 'Guerra y paz', '978-0199232-136', 1869, NULL, NULL, 5, 30.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (161, 'Anna Karenina', '978-0143035-137', 1877, NULL, NULL, 4, 25.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (162, 'Oliver Twist', '978-0141439-138', 1837, NULL, NULL, 1, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (163, 'Cuento de Navidad', '978-0140439-139', 1843, NULL, NULL, 9, 14.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (164, 'Los miserables', '978-0451419-140', 1862, NULL, NULL, 5, 28.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (165, 'Nuestra Señora de París', '978-0140443-141', 1831, NULL, NULL, 4, 22.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (166, 'Madame Bovary', '978-0140449-142', 1856, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (167, 'Las aventuras de Huckleberry Finn', '978-0142437-143', 1884, NULL, NULL, 1, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (168, 'El viejo y el mar', '978-0684801-144', 1952, NULL, NULL, 1, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (169, 'Adiós a las armas', '978-0684801-145', 1929, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (170, 'El retrato de Dorian Gray', '978-0141439-146', 1890, NULL, NULL, 3, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (171, 'Ulises', '978-0679722-147', 1922, NULL, NULL, 1, 25.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (172, 'Dublineses', '978-0140445-148', 1914, NULL, NULL, 100, 17.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (173, 'La señora Dalloway', '978-0156628-149', 1925, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (174, 'Al faro', '978-0156503-150', 1927, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (175, 'En busca del tiempo perdido', '978-0143039-151', 1913, NULL, NULL, 1, 45.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (176, 'Moby Dick', '978-0142437-152', 1851, NULL, NULL, 1, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (177, 'Narraciones extraordinarias', '978-8437613-153', 1845, NULL, NULL, 3, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (178, 'Estudio en escarlata', '978-0140439-154', 1887, NULL, NULL, 1, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (179, 'El sabueso de los Baskerville', '978-0140437-155', 1902, NULL, NULL, 1, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (180, 'La Ilíada', '978-0140275-156', -750, NULL, NULL, 10, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (181, 'La Odisea', '978-0140268-157', -720, NULL, NULL, 10, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (182, 'Divina Comedia', '978-0142437-158', 1320, NULL, NULL, 10, 25.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (183, 'Sentido y sensibilidad', '978-0141439-159', 1811, NULL, NULL, 4, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (184, 'Emma', '978-0141439-160', 1815, NULL, NULL, 4, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (185, 'La llamada de Cthulhu', '978-0143106-161', 1928, NULL, NULL, 3, 14.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (186, 'En las montañas de la locura', '978-0812974-162', 1936, NULL, NULL, 3, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (187, 'Fahrenheit 451', '978-1451673-163', 1953, NULL, NULL, 2, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (188, 'Crónicas marcianas', '978-0060598-164', 1950, NULL, NULL, 2, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (189, '¿Sueñan los androides con ovejas eléctricas?', '978-0345404-165', 1968, NULL, NULL, 2, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (190, 'Ubik', '978-0547572-166', 1969, NULL, NULL, 2, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (191, 'Dune', '978-0441172-167', 1965, NULL, NULL, 2, 22.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (192, 'El mesías de Dune', '978-0441172-168', 1969, NULL, NULL, 2, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (193, 'Un mago de Terramar', '978-0547773-169', 1968, NULL, NULL, 9, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (194, 'La mano izquierda de la oscuridad', '978-0441478-170', 1969, NULL, NULL, 2, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (195, 'Juego de tronos', '978-0553103-171', 1996, NULL, NULL, 9, 25.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (196, 'Choque de reyes', '978-0553108-172', 1998, NULL, NULL, 9, 26.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (197, 'American Gods', '978-0380789-173', 2001, NULL, NULL, 9, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (198, 'Coraline', '978-0380977-174', 2002, NULL, NULL, 8, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (199, 'El color de la magia', '978-0062225-175', 1983, NULL, NULL, 9, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (200, 'Mort', '978-0062225-176', 1987, NULL, NULL, 9, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (201, 'El león, la bruja y el armario', '978-0064471-177', 1950, NULL, NULL, 8, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (202, 'Frankenstein', '978-0141439-178', 1818, NULL, NULL, 3, 14.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (203, 'Drácula', '978-0141439-179', 1897, NULL, NULL, 3, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (204, 'Veinte mil leguas de viaje submarino', '978-0140440-180', 1870, NULL, NULL, 2, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (205, 'Viaje al centro de la Tierra', '978-0140449-181', 1864, NULL, NULL, 2, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (206, 'La guerra de los mundos', '978-0141441-182', 1898, NULL, NULL, 2, 14.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (207, 'La máquina del tiempo', '978-0141439-183', 1895, NULL, NULL, 2, 14.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (208, 'Un mundo feliz', '978-0060850-184', 1932, NULL, NULL, 2, 17.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (209, 'El cuento de la criada', '978-0385490-185', 1985, NULL, NULL, 2, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (210, 'Tokio Blues', '978-0307744-186', 1987, NULL, NULL, 4, 19.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (211, 'Kafka en la orilla', '978-1400079-187', 2002, NULL, NULL, 100, 21.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (212, 'El Alquimista', '978-0062315-188', 1988, NULL, NULL, 100, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (213, 'Los pilares de la Tierra', '978-0451166-189', 1989, NULL, NULL, 5, 28.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (214, 'El código Da Vinci', '978-0307474-190', 2003, NULL, NULL, 1, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (215, 'El informe Pelícano', '978-0440245-191', 1992, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (216, 'Crepúsculo', '978-0316015-192', 2005, NULL, NULL, 4, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (217, 'Los juegos del hambre', '978-0439023-193', 2008, NULL, NULL, 2, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (218, 'El ladrón del rayo', '978-0786838-194', 2005, NULL, NULL, 8, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (219, 'El nombre de la rosa', '978-0156001-195', 1980, NULL, NULL, 5, 20.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (220, 'La insoportable levedad del ser', '978-0060932-196', 1984, NULL, NULL, 1, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (221, 'Así habló Zaratustra', '978-0140441-197', 1883, NULL, NULL, 100, 22.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (222, 'La náusea', '978-0811217-198', 1938, NULL, NULL, 100, 19.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (223, 'El segundo sexo', '978-0307277-199', 1949, NULL, NULL, 100, 25.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (224, 'El extranjero', '978-0679720-200', 1942, NULL, NULL, 1, 16.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (225, 'La peste', '978-0679720-201', 1947, NULL, NULL, 100, 18.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (226, 'Introducción al psicoanálisis', '978-0871404-202', 1917, NULL, NULL, 7, 24.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (227, 'El hombre y sus símbolos', '978-0440351-203', 1964, NULL, NULL, 7, 22.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (228, 'El capital', '978-0140445-204', 1867, NULL, NULL, 5, 30.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (229, 'El Príncipe', '978-0553212-205', 1532, NULL, NULL, 5, 12.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (230, 'El arte de la guerra', '978-1590302-206', -500, NULL, NULL, 5, 12.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (231, 'Romancero gitano', '978-8437600-207', 1928, NULL, NULL, 10, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (232, 'Bodas de sangre', '978-8437601-208', 1933, NULL, NULL, 100, 15.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (233, 'Campos de Castilla', '978-8437602-209', 1912, NULL, NULL, 10, 14.00, 1);
INSERT INTO public.libros (id_libro, titulo, isbn, anio_publicacion, editorial, archivo_digital_url, id_categoria, precio, id_editorial) VALUES (234, 'Rimas y Leyendas', '978-8437603-210', 1871, NULL, NULL, 10, 15.00, 1);


--
-- TOC entry 4981 (class 0 OID 16544)
-- Dependencies: 224
-- Data for Name: libros_autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (1, 1, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (2, 2, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (3, 3, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (4, 4, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (5, 5, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (6, 6, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (7, 7, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (8, 8, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (9, 9, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (10, 10, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (124, 12, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (125, 12, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (126, 13, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (12, 13, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (128, 14, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (129, 14, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (130, 15, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (131, 15, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (132, 16, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (133, 17, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (134, 18, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (135, 19, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (136, 20, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (137, 20, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (138, 21, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (139, 21, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (140, 22, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (141, 23, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (142, 24, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (143, 25, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (144, 26, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (145, 27, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (146, 28, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (147, 29, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (148, 7, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (149, 31, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (150, 31, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (151, 32, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (152, 32, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (153, 32, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (154, 33, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (155, 33, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (156, 34, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (157, 34, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (158, 35, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (159, 35, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (160, 36, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (161, 36, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (162, 37, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (163, 37, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (164, 38, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (165, 38, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (166, 39, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (167, 40, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (168, 41, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (169, 41, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (170, 42, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (171, 43, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (172, 43, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (173, 44, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (174, 44, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (175, 45, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (176, 46, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (177, 47, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (178, 48, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (179, 48, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (180, 49, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (181, 49, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (182, 50, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (183, 5, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (184, 5, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (185, 52, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (186, 52, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (187, 53, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (188, 53, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (189, 54, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (190, 54, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (191, 55, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (192, 55, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (193, 56, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (194, 56, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (195, 57, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (196, 57, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (197, 58, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (198, 58, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (199, 59, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (200, 59, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (201, 60, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (202, 61, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (203, 62, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (204, 63, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (205, 63, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (206, 64, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (207, 64, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (208, 65, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (209, 66, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (210, 67, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (211, 67, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (212, 68, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (213, 69, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (214, 70, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (215, 71, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (216, 72, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (217, 73, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (218, 74, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (219, 75, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (220, 76, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (221, 82, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (222, 83, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (223, 84, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (224, 85, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (225, 85, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (226, 86, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (227, 87, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (228, 88, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (229, 91, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (230, 92, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (231, 97, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (232, 97, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (233, 98, 'Autor Principal');
INSERT INTO public.libros_autores (id_libro, id_autor, rol_contribucion) VALUES (234, 99, 'Autor Principal');


--
-- TOC entry 4990 (class 0 OID 16631)
-- Dependencies: 233
-- Data for Name: multas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4983 (class 0 OID 16550)
-- Dependencies: 226
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (1, 1, 1, '2023-10-01', '2023-10-15', '2023-10-12', 'Devuelto');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (2, 2, 2, '2023-10-05', '2023-10-20', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (3, 3, 3, '2023-09-01', '2023-09-15', '2023-09-20', 'Devuelto con retraso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (4, 4, 4, '2023-10-10', '2023-10-25', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (5, 1, 5, '2023-10-01', '2023-10-15', '2023-10-14', 'Devuelto');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (6, 6, 6, '2023-10-12', '2023-10-27', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (7, 7, 7, '2023-08-01', '2023-08-15', NULL, 'Atrasado');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (8, 8, 8, '2023-10-13', '2023-10-28', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (9, 9, 9, '2023-10-14', '2023-10-29', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (10, 10, 10, '2023-10-14', '2023-10-29', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (11, 45, 220, '2025-12-15', '2025-12-31', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (12, 45, 220, '2025-12-05', '2025-12-28', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (13, 45, 220, '2025-12-18', '2026-01-01', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (14, 45, 220, '2025-12-27', '2026-01-03', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (15, 45, 220, '2025-12-15', '2025-12-30', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (16, 45, 220, '2025-12-18', '2025-12-28', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (17, 45, 220, '2025-12-12', '2026-01-05', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (18, 45, 220, '2025-12-02', '2026-01-01', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (19, 45, 220, '2025-12-23', '2025-12-28', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (20, 45, 220, '2025-12-26', '2026-01-01', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (21, 45, 220, '2025-12-28', '2026-01-04', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (22, 45, 220, '2025-12-01', '2026-01-01', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (23, 45, 220, '2025-12-18', '2025-12-31', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (24, 45, 220, '2025-12-21', '2025-12-29', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (25, 45, 220, '2025-12-20', '2026-01-02', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (26, 45, 220, '2025-12-10', '2026-01-05', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (27, 45, 220, '2025-12-20', '2025-12-31', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (28, 45, 220, '2025-12-26', '2026-01-02', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (29, 45, 220, '2025-12-13', '2026-01-01', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (30, 45, 220, '2025-12-03', '2026-01-06', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (31, 45, 220, '2025-12-03', '2026-01-06', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (32, 45, 220, '2025-12-27', '2025-12-29', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (33, 45, 220, '2025-12-19', '2026-01-02', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (34, 45, 220, '2025-12-11', '2025-12-29', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (35, 45, 220, '2025-11-30', '2025-12-30', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (36, 45, 220, '2025-12-10', '2025-12-28', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (37, 45, 220, '2025-12-21', '2026-01-01', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (38, 45, 220, '2025-12-12', '2025-12-28', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (39, 45, 220, '2025-11-29', '2025-12-28', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (40, 45, 220, '2025-12-03', '2026-01-04', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (41, 45, 220, '2025-12-11', '2025-12-31', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (42, 45, 220, '2025-12-27', '2025-12-31', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (43, 45, 220, '2025-12-16', '2025-12-29', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (44, 45, 220, '2025-12-02', '2026-01-04', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (45, 45, 220, '2025-11-29', '2026-01-06', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (46, 45, 220, '2025-12-07', '2025-12-28', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (47, 45, 220, '2025-12-05', '2026-01-05', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (48, 45, 220, '2025-12-03', '2026-01-01', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (49, 45, 220, '2025-12-18', '2025-12-31', NULL, 'En curso');
INSERT INTO public.prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, estado) VALUES (50, 45, 220, '2025-12-14', '2025-12-29', NULL, 'En curso');


--
-- TOC entry 4985 (class 0 OID 16561)
-- Dependencies: 228
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (1, 'Juan Pérez', 'juan.perez@mail.com', '555-1001', 'Calle Falsa 123', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (2, 'Maria González', 'maria.gonzalez@mail.com', '555-1002', 'Av. Siempre Viva 742', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (3, 'Carlos López', 'carlos.lopez@mail.com', '555-1003', 'Colonia Centro 45', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (4, 'Ana Martínez', 'ana.martinez@mail.com', '555-1004', 'Residencial Los Pinos', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (5, 'Luis Rodríguez', 'luis.rod@mail.com', '555-1005', 'Barrio San José', '2025-12-27', false);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (6, 'Sofia Hernández', 'sofia.h@mail.com', '555-1006', 'Callejón del Beso 8', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (7, 'Miguel Torres', 'miguel.torres@mail.com', '555-1007', 'Boulevard del Rio', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (8, 'Lucía Ramírez', 'lucia.ram@mail.com', '555-1008', 'Plaza Mayor 22', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (9, 'David Flores', 'david.flores@mail.com', '555-1009', 'Zona Industrial 5', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (10, 'Elena Cruz', 'elena.cruz@mail.com', '555-1010', 'Camino Real 99', '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (11, 'Stephen King', 'sking@mail.com', NULL, NULL, '2025-12-27', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (12, 'Ana García', 'ana.garcia.01@email.com', '555-0101', 'Av. Reforma 101, CDMX', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (13, 'Luis Miguel Torres', 'luismi.torres@email.com', '555-0102', 'Calle Luna 23, Guadalajara', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (14, 'Sofía Vergara', 'sofia.v@email.com', '555-0103', 'Barranquilla St 55, Bogotá', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (15, 'Carlos Vives', 'carlos.vives@music.com', '555-0104', 'Santa Marta Blvd 10, Colombia', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (16, 'Penélope Cruz', 'penelope.cruz@cine.es', '555-0105', 'Madrid Centro 45, España', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (17, 'Javier Bardem', 'javier.bardem@cine.es', '555-0106', 'Gran Vía 88, España', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (18, 'Emma Stone', 'emma.stone@hollywood.com', '555-0107', 'Sunset Blvd 12, LA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (19, 'Ryan Gosling', 'ryan.gosling@hollywood.com', '555-0108', 'Beverly Hills 90, LA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (20, 'Guillermo del Toro', 'guillermo.dt@cine.mx', '555-0109', 'Calle Monstruos 1, Guadalajara', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (21, 'Alfonso Cuarón', 'alfonso.cuaron@roma.mx', '555-0110', 'Colonia Roma 22, CDMX', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (22, 'Alejandro G. Iñárritu', 'el.negro@cine.mx', '555-0111', 'Pedregal 55, CDMX', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (23, 'Lionel Messi', 'leo.messi@futbol.arg', '555-0112', 'Rosario Central 10, Argentina', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (24, 'Cristiano Ronaldo', 'cr7@futbol.pt', '555-0113', 'Funchal 7, Portugal', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (25, 'Shakira Mebarak', 'shakira@music.col', '555-0114', 'Barcelona High 3, España', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (26, 'Bad Bunny', 'benito@music.pr', '555-0115', 'San Juan Playa 99, PR', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (27, 'Rosalía Vila', 'rosalia@motomami.es', '555-0116', 'Barcelona Centro 1, España', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (28, 'Harry Styles', 'harry.styles@uk.com', '555-0117', 'London Square 5, UK', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (29, 'Taylor Swift', 'taylor.s@music.us', '555-0118', 'Nashville Road 13, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (30, 'Dua Lipa', 'dua.lipa@pop.uk', '555-0119', 'London Bridge 8, UK', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (31, 'Bruno Mars', 'bruno.mars@funk.us', '555-0120', 'Hawaii Beach 24, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (32, 'Pedro Pascal', 'pedro.pascal@mando.cl', '555-0121', 'Santiago Centro 4, Chile', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (33, 'Oscar Isaac', 'oscar.isaac@moon.gt', '555-0122', 'Guatemala City 5, GT', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (34, 'Anya Taylor-Joy', 'anya.joy@queen.arg', '555-0123', 'Buenos Aires Norte 9, Arg', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (35, 'Jenna Ortega', 'jenna.ortega@wednesday.us', '555-0124', 'Coachella Valley 6, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (36, 'Tom Holland', 'tom.holland@spidey.uk', '555-0125', 'Kingston 2, UK', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (37, 'Zendaya Coleman', 'zendaya@dunne.us', '555-0126', 'Oakland Hills 3, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (38, 'Timothée Chalamet', 'timo.chalamet@wonka.fr', '555-0127', 'Paris South 1, France', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (39, 'Florence Pugh', 'florence.pugh@midsommar.uk', '555-0128', 'Oxford St 44, UK', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (40, 'Cillian Murphy', 'cillian.murphy@peaky.ir', '555-0129', 'Cork County 7, Ireland', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (41, 'Robert Downey Jr.', 'rdj@stark.us', '555-0130', 'Malibu Point 1, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (42, 'Scarlett Johansson', 'scarlett.j@widow.us', '555-0131', 'New York Ave 55, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (43, 'Chris Hemsworth', 'chris.h@thor.au', '555-0132', 'Byron Bay 9, Australia', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (44, 'Margot Robbie', 'margot.robbie@barbie.au', '555-0133', 'Gold Coast 4, Australia', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (45, 'Gal Gadot', 'gal.gadot@wonder.is', '555-0134', 'Tel Aviv Beach 2, Israel', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (46, 'Henry Cavill', 'henry.cavill@super.uk', '555-0135', 'Jersey Shore 8, UK', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (47, 'Jason Momoa', 'jason.momoa@aqua.us', '555-0136', 'Honolulu Bay 3, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (48, 'Benedict Cumberbatch', 'benedict.c@strange.uk', '555-0137', 'London West 221B, UK', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (49, 'Elizabeth Olsen', 'lizzie.olsen@wanda.us', '555-0138', 'Sherman Oaks 5, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (50, 'Mark Ruffalo', 'mark.ruffalo@hulk.us', '555-0139', 'Kenosha St 7, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (51, 'Jeremy Renner', 'jeremy.renner@hawkeye.us', '555-0140', 'Modesto Way 2, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (52, 'Samuel L. Jackson', 'sam.jackson@shield.us', '555-0141', 'Washington DC 1, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (53, 'Brie Larson', 'brie.larson@marvel.us', '555-0142', 'Sacramento St 9, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (54, 'Paul Rudd', 'paul.rudd@ant.us', '555-0143', 'Passaic River 3, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (55, 'Evangeline Lilly', 'evangeline.l@wasp.ca', '555-0144', 'Fort Saskatchewan 4, Canada', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (56, 'Chadwick Boseman', 'chadwick.b@panther.us', '555-0145', 'Anderson SC 8, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (57, 'Michael B. Jordan', 'michael.b@creed.us', '555-0146', 'Santa Ana 5, USA', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (58, 'Lupita Nyong''o', 'lupita.n@nakia.ke', '555-0147', 'Nairobi Hill 2, Kenya', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (59, 'Danai Gurira', 'danai.g@okoye.zw', '555-0148', 'Harare North 6, Zimbabwe', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (60, 'Letitia Wright', 'letitia.w@shuri.gy', '555-0149', 'Georgetown 1, Guyana', '2025-12-28', true);
INSERT INTO public.usuarios (id_usuario, nombre_completo, correo_electronico, telefono, direccion, fecha_registro, activo) VALUES (61, 'Winston Duke', 'winston.d@mbaku.tt', '555-0150', 'Tobago Bay 3, Trinidad', '2025-12-28', true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 220
-- Name: autores_id_autor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autores_id_autor_seq', 101, true);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 222
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 10, true);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 230
-- Name: editoriales_id_editorial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriales_id_editorial_seq', 1, true);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 225
-- Name: libros_id_libro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_id_libro_seq', 234, true);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 232
-- Name: multas_id_multa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multas_id_multa_seq', 1, false);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_id_prestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_id_prestamo_seq', 50, true);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 61, true);


--
-- TOC entry 4803 (class 2606 OID 16576)
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (id_autor);


--
-- TOC entry 4805 (class 2606 OID 16578)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4819 (class 2606 OID 16624)
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id_editorial);


--
-- TOC entry 4811 (class 2606 OID 16580)
-- Name: libros_autores libros_autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_autores
    ADD CONSTRAINT libros_autores_pkey PRIMARY KEY (id_libro, id_autor);


--
-- TOC entry 4807 (class 2606 OID 16582)
-- Name: libros libros_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_isbn_key UNIQUE (isbn);


--
-- TOC entry 4809 (class 2606 OID 16584)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id_libro);


--
-- TOC entry 4821 (class 2606 OID 16641)
-- Name: multas multas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multas
    ADD CONSTRAINT multas_pkey PRIMARY KEY (id_multa);


--
-- TOC entry 4813 (class 2606 OID 16586)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id_prestamo);


--
-- TOC entry 4815 (class 2606 OID 16588)
-- Name: usuarios usuarios_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 4817 (class 2606 OID 16590)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4824 (class 2606 OID 16591)
-- Name: libros_autores fk_autor_relacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_autores
    ADD CONSTRAINT fk_autor_relacion FOREIGN KEY (id_autor) REFERENCES public.autores(id_autor);


--
-- TOC entry 4822 (class 2606 OID 16596)
-- Name: libros fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);


--
-- TOC entry 4823 (class 2606 OID 16625)
-- Name: libros fk_libro_editorial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT fk_libro_editorial FOREIGN KEY (id_editorial) REFERENCES public.editoriales(id_editorial);


--
-- TOC entry 4826 (class 2606 OID 16601)
-- Name: prestamos fk_libro_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_libro_prestamo FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro);


--
-- TOC entry 4825 (class 2606 OID 16606)
-- Name: libros_autores fk_libro_relacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_autores
    ADD CONSTRAINT fk_libro_relacion FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro);


--
-- TOC entry 4828 (class 2606 OID 16642)
-- Name: multas fk_multa_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multas
    ADD CONSTRAINT fk_multa_prestamo FOREIGN KEY (id_prestamo) REFERENCES public.prestamos(id_prestamo);


--
-- TOC entry 4827 (class 2606 OID 16611)
-- Name: prestamos fk_usuario_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_usuario_prestamo FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


-- Completed on 2025-12-29 00:07:22

--
-- PostgreSQL database dump complete
--

\unrestrict 0DGuxHDo7yGmgBrhPJTuveRod7XeS7XZrclEAX1oOGaGIhmQsgePf9GW6m0Yy0T

