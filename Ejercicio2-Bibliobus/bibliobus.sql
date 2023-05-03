-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.temas
(
    id_tema serial NOT NULL,
    nombre character varying(30) NOT NULL,
    PRIMARY KEY (id_tema)
);

CREATE TABLE IF NOT EXISTS public.libros
(
    id_libro serial NOT NULL,
    titulo character varying(50) NOT NULL,
    autor character varying(50) NOT NULL,
    num_ejemplares integer NOT NULL,
    id_tema integer NOT NULL,
    PRIMARY KEY (id_libro)
);

CREATE TABLE IF NOT EXISTS public.socios
(
    id_socio serial NOT NULL,
    nombre character varying(50) NOT NULL,
    PRIMARY KEY (id_socio)
);

CREATE TABLE IF NOT EXISTS public.prestamos
(
    id_presta serial NOT NULL,
    id_libro integer NOT NULL,
    id_socio integer NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date NOT NULL,
    PRIMARY KEY (id_presta)
);

ALTER TABLE IF EXISTS public.libros
    ADD CONSTRAINT fk_id_tema FOREIGN KEY (id_tema)
    REFERENCES public.temas (id_tema) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.prestamos
    ADD CONSTRAINT fk_id_libro FOREIGN KEY (id_libro)
    REFERENCES public.libros (id_libro) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.prestamos
    ADD CONSTRAINT fk_id_socio FOREIGN KEY (id_socio)
    REFERENCES public.socios (id_socio) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;