--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number (
    user_id integer NOT NULL,
    name character varying(20) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.number OWNER TO freecodecamp;

--
-- Name: number_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_user_id_seq OWNER TO freecodecamp;

--
-- Name: number_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_user_id_seq OWNED BY public.number.user_id;


--
-- Name: number user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number ALTER COLUMN user_id SET DEFAULT nextval('public.number_user_id_seq'::regclass);


--
-- Data for Name: number; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number VALUES (18, 'user_1715316616260', 2, 149);
INSERT INTO public.number VALUES (17, 'user_1715316616261', 5, 545);
INSERT INTO public.number VALUES (20, 'user_1715316747847', 2, 345);
INSERT INTO public.number VALUES (19, 'user_1715316747848', 5, 468);
INSERT INTO public.number VALUES (22, 'user_1715316779084', 2, 23);
INSERT INTO public.number VALUES (21, 'user_1715316779085', 5, 484);
INSERT INTO public.number VALUES (23, 'jj', 1, 1);
INSERT INTO public.number VALUES (25, 'user_1715316982285', 2, 268);
INSERT INTO public.number VALUES (24, 'user_1715316982286', 5, 833);


--
-- Name: number_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_user_id_seq', 25, true);


--
-- Name: number number_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number
    ADD CONSTRAINT number_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

