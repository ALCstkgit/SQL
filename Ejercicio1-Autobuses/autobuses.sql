-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.autobuses
(
    id_bus serial NOT NULL,
    a_fabricacion integer NOT NULL,
    precio numeric(10, 4) NOT NULL,
    CONSTRAINT autobuses_pkey PRIMARY KEY (id_bus)
);

CREATE TABLE IF NOT EXISTS public.conductores
(
    id_conductor serial NOT NULL,
    nombre character varying(60) COLLATE pg_catalog."default" NOT NULL,
    edad integer NOT NULL,
    CONSTRAINT conductores_pkey PRIMARY KEY (id_conductor)
);

CREATE TABLE IF NOT EXISTS public.lugares
(
    id_lugar serial NOT NULL,
    nombre character varying(60) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT lugares_pkey PRIMARY KEY (id_lugar)
);

CREATE TABLE IF NOT EXISTS public.visita
(
    id_visita serial NOT NULL,
    id_autobus integer NOT NULL,
    id_conductor integer NOT NULL,
    id_lugar integer NOT NULL,
    fecha date NOT NULL,
    CONSTRAINT visita_pkey PRIMARY KEY (id_visita)
);

ALTER TABLE IF EXISTS public.visita
    ADD CONSTRAINT fk_id_bus FOREIGN KEY (id_autobus)
    REFERENCES public.autobuses (id_bus) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.visita
    ADD CONSTRAINT fk_id_conductor FOREIGN KEY (id_conductor)
    REFERENCES public.conductores (id_conductor) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.visita
    ADD CONSTRAINT fk_id_lugar FOREIGN KEY (id_lugar)
    REFERENCES public.lugares (id_lugar) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

END;