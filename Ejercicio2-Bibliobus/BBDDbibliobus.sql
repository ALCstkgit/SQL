--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 16:53:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 16521)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    id_libro integer NOT NULL,
    titulo character varying(50) NOT NULL,
    autor character varying(50) NOT NULL,
    num_ejemplares integer NOT NULL,
    id_tema integer NOT NULL
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16520)
-- Name: libros_id_libro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_id_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libros_id_libro_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 216
-- Name: libros_id_libro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_id_libro_seq OWNED BY public.libros.id_libro;


--
-- TOC entry 221 (class 1259 OID 16535)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    id_presta integer NOT NULL,
    id_libro integer NOT NULL,
    id_socio integer NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date NOT NULL
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16534)
-- Name: prestamos_id_presta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_id_presta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prestamos_id_presta_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 220
-- Name: prestamos_id_presta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_id_presta_seq OWNED BY public.prestamos.id_presta;


--
-- TOC entry 219 (class 1259 OID 16528)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    id_socio integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16527)
-- Name: socios_id_socio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socios_id_socio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socios_id_socio_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 218
-- Name: socios_id_socio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socios_id_socio_seq OWNED BY public.socios.id_socio;


--
-- TOC entry 215 (class 1259 OID 16514)
-- Name: temas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temas (
    id_tema integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.temas OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16513)
-- Name: temas_id_tema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temas_id_tema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temas_id_tema_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 214
-- Name: temas_id_tema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temas_id_tema_seq OWNED BY public.temas.id_tema;


--
-- TOC entry 3189 (class 2604 OID 16524)
-- Name: libros id_libro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN id_libro SET DEFAULT nextval('public.libros_id_libro_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16538)
-- Name: prestamos id_presta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN id_presta SET DEFAULT nextval('public.prestamos_id_presta_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16531)
-- Name: socios id_socio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios ALTER COLUMN id_socio SET DEFAULT nextval('public.socios_id_socio_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 16517)
-- Name: temas id_tema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas ALTER COLUMN id_tema SET DEFAULT nextval('public.temas_id_tema_seq'::regclass);


--
-- TOC entry 3348 (class 0 OID 16521)
-- Dependencies: 217
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.libros (id_libro, titulo, autor, num_ejemplares, id_tema) VALUES (1, 'El cuerpo humano', 'Alberto Navarro', 82, 2);
INSERT INTO public.libros (id_libro, titulo, autor, num_ejemplares, id_tema) VALUES (2, 'Las armas de la primera guerra mundial', 'Juana Perez', 32, 1);


--
-- TOC entry 3352 (class 0 OID 16535)
-- Dependencies: 221
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prestamos (id_presta, id_libro, id_socio, fecha_prestamo, fecha_devolucion) VALUES (1, 1, 3, '2002-03-22', '2002-04-22');
INSERT INTO public.prestamos (id_presta, id_libro, id_socio, fecha_prestamo, fecha_devolucion) VALUES (2, 1, 2, '2000-11-14', '2001-01-15');
INSERT INTO public.prestamos (id_presta, id_libro, id_socio, fecha_prestamo, fecha_devolucion) VALUES (3, 2, 3, '2015-01-01', '2016-01-01');


--
-- TOC entry 3350 (class 0 OID 16528)
-- Dependencies: 219
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.socios (id_socio, nombre) VALUES (1, 'Juan');
INSERT INTO public.socios (id_socio, nombre) VALUES (2, 'Coraline');
INSERT INTO public.socios (id_socio, nombre) VALUES (3, 'Mei');


--
-- TOC entry 3346 (class 0 OID 16514)
-- Dependencies: 215
-- Data for Name: temas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.temas (id_tema, nombre) VALUES (1, 'Guerras');
INSERT INTO public.temas (id_tema, nombre) VALUES (2, 'Biologia');
INSERT INTO public.temas (id_tema, nombre) VALUES (3, 'Quimica');


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 216
-- Name: libros_id_libro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_id_libro_seq', 2, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 220
-- Name: prestamos_id_presta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_id_presta_seq', 3, true);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 218
-- Name: socios_id_socio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socios_id_socio_seq', 3, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 214
-- Name: temas_id_tema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_id_tema_seq', 3, true);


--
-- TOC entry 3195 (class 2606 OID 16526)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id_libro);


--
-- TOC entry 3199 (class 2606 OID 16540)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id_presta);


--
-- TOC entry 3197 (class 2606 OID 16533)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (id_socio);


--
-- TOC entry 3193 (class 2606 OID 16519)
-- Name: temas temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (id_tema);


--
-- TOC entry 3201 (class 2606 OID 16546)
-- Name: prestamos fk_id_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_id_libro FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) NOT VALID;


--
-- TOC entry 3202 (class 2606 OID 16551)
-- Name: prestamos fk_id_socio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_id_socio FOREIGN KEY (id_socio) REFERENCES public.socios(id_socio) NOT VALID;


--
-- TOC entry 3200 (class 2606 OID 16541)
-- Name: libros fk_id_tema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT fk_id_tema FOREIGN KEY (id_tema) REFERENCES public.temas(id_tema) ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-05-03 16:53:50

--
-- PostgreSQL database dump complete
--

