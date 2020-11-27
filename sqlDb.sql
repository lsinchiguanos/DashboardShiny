-- Database: dashboard

-- DROP DATABASE dashboard;

CREATE DATABASE dashboard
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'es_EC.UTF-8'
    LC_CTYPE = 'es_EC.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Table: public.plantacion

-- DROP TABLE public.plantacion;

CREATE TABLE public.plantacion
(
    id integer NOT NULL DEFAULT nextval('plantacion_id_seq'::regclass),
    codigo character varying(25) COLLATE pg_catalog."default" NOT NULL,
    tipocacao character varying(25) COLLATE pg_catalog."default" NOT NULL,
    alturaplanta double precision NOT NULL,
    sector character varying(25) COLLATE pg_catalog."default" NOT NULL,
    fecha date NOT NULL,
    CONSTRAINT plantacion_pkey PRIMARY KEY (id),
    CONSTRAINT "codigoUQ" UNIQUE (codigo)
)

TABLESPACE pg_default;

ALTER TABLE public.plantacion
    OWNER to postgres;


-- Table: public.produccion

-- DROP TABLE public.produccion;

CREATE TABLE public.produccion
(
    id integer NOT NULL DEFAULT nextval('produccion_id_seq'::regclass),
    idplantacion integer NOT NULL,
    cantidadperdida double precision NOT NULL,
    cantidadobtenida double precision NOT NULL,
    cantidadestimada double precision NOT NULL,
    fechaproduccion date NOT NULL,
    CONSTRAINT produccion_pkey PRIMARY KEY (id),
    CONSTRAINT produccion_fk FOREIGN KEY (idplantacion)
        REFERENCES public.plantacion (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.produccion
    OWNER to postgres;


