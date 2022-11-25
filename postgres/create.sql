-- CREATE USER postgres;

-- Database: postgres
-- DROP DATABASE IF EXISTS postgres;
-- CREATE DATABASE postgres
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'en_US.utf8'
--     LC_CTYPE = 'en_US.utf8'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1;

GRANT ALL PRIVILEGES ON DATABASE postgres TO postgres;
COMMENT ON DATABASE postgres
    IS 'default administrative connection database';


-- SCHEMA: public

-- DROP SCHEMA IF EXISTS public ;

CREATE SCHEMA IF NOT EXISTS public
    AUTHORIZATION postgres;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT ALL ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO postgres;


-- Table: public.order_history

-- DROP TABLE IF EXISTS public.public_table;

CREATE TABLE IF NOT EXISTS public.order_history
(
    order_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    "time" numeric NOT NULL,
    status character varying(30) COLLATE pg_catalog."default" NOT NULL,
    client_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    symbol character varying(20) COLLATE pg_catalog."default" NOT NULL,
    price numeric NOT NULL,
    amount numeric NOT NULL,
    side character varying(20) COLLATE pg_catalog."default" NOT NULL,
    type character varying(20) COLLATE pg_catalog."default" NOT NULL,
    value numeric NOT NULL,
    position_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    paid numeric NOT NULL,
    finish_time numeric NOT NULL,
    fee numeric NOT NULL,
    CONSTRAINT public_table_pkey PRIMARY KEY (order_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.order_history
    OWNER to postgres;