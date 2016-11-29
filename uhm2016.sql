-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.2-beta
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: uhm2016 | type: DATABASE --
-- -- DROP DATABASE IF EXISTS uhm2016;
-- CREATE DATABASE uhm2016
-- ;
-- -- ddl-end --
-- 

-- object: public.users | type: TABLE --
-- DROP TABLE IF EXISTS public.users CASCADE;
CREATE TABLE public.users(
	user_id text NOT NULL,
	contact_details jsonb NOT NULL DEFAULT '{}',
	CONSTRAINT users_pk_user_id PRIMARY KEY (user_id)

);
-- ddl-end --
ALTER TABLE public.users OWNER TO postgres;
-- ddl-end --

-- object: public.locations | type: TABLE --
-- DROP TABLE IF EXISTS public.locations CASCADE;
CREATE TABLE public.locations(
	latitude double precision NOT NULL,
	longitude double precision NOT NULL,
	created timestamptz NOT NULL,
	user_id_users text NOT NULL
);
-- ddl-end --
ALTER TABLE public.locations OWNER TO postgres;
-- ddl-end --

-- object: users_fk | type: CONSTRAINT --
-- ALTER TABLE public.locations DROP CONSTRAINT IF EXISTS users_fk CASCADE;
ALTER TABLE public.locations ADD CONSTRAINT users_fk FOREIGN KEY (user_id_users)
REFERENCES public.users (user_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.requests | type: TABLE --
-- DROP TABLE IF EXISTS public.requests CASCADE;
CREATE TABLE public.requests(
	id uuid NOT NULL,
	allowed boolean,
	"from" text NOT NULL,
	"to" text NOT NULL,
	created timestamptz NOT NULL,
	CONSTRAINT requests_id_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.requests OWNER TO postgres;
-- ddl-end --

-- object: users_fk | type: CONSTRAINT --
-- ALTER TABLE public.requests DROP CONSTRAINT IF EXISTS users_fk CASCADE;
ALTER TABLE public.requests ADD CONSTRAINT users_fk FOREIGN KEY ("from")
REFERENCES public.users (user_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: to_fk_users | type: CONSTRAINT --
-- ALTER TABLE public.requests DROP CONSTRAINT IF EXISTS to_fk_users CASCADE;
ALTER TABLE public.requests ADD CONSTRAINT to_fk_users FOREIGN KEY ("to")
REFERENCES public.users (user_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


