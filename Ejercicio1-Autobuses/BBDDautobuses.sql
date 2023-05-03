--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 16:53:27

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
-- TOC entry 215 (class 1259 OID 16471)
-- Name: autobuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autobuses (
    id_bus integer NOT NULL,
    a_fabricacion integer NOT NULL,
    precio numeric(10,4) NOT NULL
);


ALTER TABLE public.autobuses OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16470)
-- Name: autobuses_id_bus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autobuses_id_bus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autobuses_id_bus_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 214
-- Name: autobuses_id_bus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autobuses_id_bus_seq OWNED BY public.autobuses.id_bus;


--
-- TOC entry 217 (class 1259 OID 16478)
-- Name: conductores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conductores (
    id_conductor integer NOT NULL,
    nombre character varying(60) NOT NULL,
    edad integer NOT NULL
);


ALTER TABLE public.conductores OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16477)
-- Name: conductores_id_conductor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conductores_id_conductor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conductores_id_conductor_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 216
-- Name: conductores_id_conductor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conductores_id_conductor_seq OWNED BY public.conductores.id_conductor;


--
-- TOC entry 219 (class 1259 OID 16485)
-- Name: lugares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lugares (
    id_lugar integer NOT NULL,
    nombre character varying(60) NOT NULL
);


ALTER TABLE public.lugares OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16484)
-- Name: lugares_id_lugar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lugares_id_lugar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lugares_id_lugar_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 218
-- Name: lugares_id_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lugares_id_lugar_seq OWNED BY public.lugares.id_lugar;


--
-- TOC entry 221 (class 1259 OID 16492)
-- Name: visita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visita (
    id_visita integer NOT NULL,
    id_autobus integer NOT NULL,
    id_conductor integer NOT NULL,
    id_lugar integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.visita OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16491)
-- Name: visita_id_visita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visita_id_visita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visita_id_visita_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 220
-- Name: visita_id_visita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visita_id_visita_seq OWNED BY public.visita.id_visita;


--
-- TOC entry 3188 (class 2604 OID 16474)
-- Name: autobuses id_bus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobuses ALTER COLUMN id_bus SET DEFAULT nextval('public.autobuses_id_bus_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16481)
-- Name: conductores id_conductor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conductores ALTER COLUMN id_conductor SET DEFAULT nextval('public.conductores_id_conductor_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16488)
-- Name: lugares id_lugar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares ALTER COLUMN id_lugar SET DEFAULT nextval('public.lugares_id_lugar_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16495)
-- Name: visita id_visita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita ALTER COLUMN id_visita SET DEFAULT nextval('public.visita_id_visita_seq'::regclass);


--
-- TOC entry 3346 (class 0 OID 16471)
-- Dependencies: 215
-- Data for Name: autobuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autobuses (id_bus, a_fabricacion, precio) VALUES (1, 2002, 10000.0000);
INSERT INTO public.autobuses (id_bus, a_fabricacion, precio) VALUES (2, 1999, 15000.0000);
INSERT INTO public.autobuses (id_bus, a_fabricacion, precio) VALUES (3, 2015, 9000.0000);


--
-- TOC entry 3348 (class 0 OID 16478)
-- Dependencies: 217
-- Data for Name: conductores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.conductores (id_conductor, nombre, edad) VALUES (1, 'Alberto', 32);
INSERT INTO public.conductores (id_conductor, nombre, edad) VALUES (2, 'Pepe', 3);
INSERT INTO public.conductores (id_conductor, nombre, edad) VALUES (3, 'Andrea', 25);
INSERT INTO public.conductores (id_conductor, nombre, edad) VALUES (4, 'Elia', 40);


--
-- TOC entry 3350 (class 0 OID 16485)
-- Dependencies: 219
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lugares (id_lugar, nombre) VALUES (1, 'Madrid');
INSERT INTO public.lugares (id_lugar, nombre) VALUES (2, 'Berlin');
INSERT INTO public.lugares (id_lugar, nombre) VALUES (3, 'Londres');


--
-- TOC entry 3352 (class 0 OID 16492)
-- Dependencies: 221
-- Data for Name: visita; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.visita (id_visita, id_autobus, id_conductor, id_lugar, fecha) VALUES (1, 1, 4, 2, '2012-05-02');
INSERT INTO public.visita (id_visita, id_autobus, id_conductor, id_lugar, fecha) VALUES (2, 3, 3, 1, '2020-12-23');


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 214
-- Name: autobuses_id_bus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autobuses_id_bus_seq', 3, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 216
-- Name: conductores_id_conductor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conductores_id_conductor_seq', 4, true);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 218
-- Name: lugares_id_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lugares_id_lugar_seq', 3, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 220
-- Name: visita_id_visita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visita_id_visita_seq', 2, true);


--
-- TOC entry 3193 (class 2606 OID 16476)
-- Name: autobuses autobuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobuses
    ADD CONSTRAINT autobuses_pkey PRIMARY KEY (id_bus);


--
-- TOC entry 3195 (class 2606 OID 16483)
-- Name: conductores conductores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conductores
    ADD CONSTRAINT conductores_pkey PRIMARY KEY (id_conductor);


--
-- TOC entry 3197 (class 2606 OID 16490)
-- Name: lugares lugares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT lugares_pkey PRIMARY KEY (id_lugar);


--
-- TOC entry 3199 (class 2606 OID 16497)
-- Name: visita visita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (id_visita);


--
-- TOC entry 3200 (class 2606 OID 16498)
-- Name: visita fk_id_bus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT fk_id_bus FOREIGN KEY (id_autobus) REFERENCES public.autobuses(id_bus) NOT VALID;


--
-- TOC entry 3201 (class 2606 OID 16503)
-- Name: visita fk_id_conductor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT fk_id_conductor FOREIGN KEY (id_conductor) REFERENCES public.conductores(id_conductor) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3202 (class 2606 OID 16508)
-- Name: visita fk_id_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT fk_id_lugar FOREIGN KEY (id_lugar) REFERENCES public.lugares(id_lugar) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2023-05-03 16:53:27

--
-- PostgreSQL database dump complete
--

