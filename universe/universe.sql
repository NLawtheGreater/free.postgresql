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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_million_of_years integer,
    distance_from_earth numeric(7,2),
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_million_of_years integer,
    distance_from_earth numeric(7,2),
    description text,
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    distance_from_earth numeric(7,2),
    age_in_million_of_years integer,
    has_life boolean,
    description text,
    planet_id integer DEFAULT nextval('public.planet_planet_id_seq'::regclass) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_million_of_years integer,
    distance_from_earth numeric(7,2),
    description text,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.test (
    name character varying(40) NOT NULL,
    is_spherical boolean,
    my_id integer NOT NULL,
    test_id integer NOT NULL
);


ALTER TABLE public.test OWNER TO freecodecamp;

--
-- Name: test_test_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.test_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_test_id_seq OWNER TO freecodecamp;

--
-- Name: test_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.test_test_id_seq OWNED BY public.test.test_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: test test_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test ALTER COLUMN test_id SET DEFAULT nextval('public.test_test_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky', true, NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES ('bilk', false, NULL, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES ('johnny', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES ('boolar', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.galaxy VALUES ('yayee', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES ('tre', NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('waa', NULL, NULL, NULL, NULL, 1, 17);
INSERT INTO public.moon VALUES ('canmaa', NULL, NULL, NULL, NULL, 2, 17);
INSERT INTO public.moon VALUES ('patoobi', NULL, NULL, NULL, NULL, 3, 17);
INSERT INTO public.moon VALUES ('nomas', NULL, NULL, NULL, NULL, 4, 17);
INSERT INTO public.moon VALUES ('thulu', NULL, NULL, NULL, NULL, 5, 17);
INSERT INTO public.moon VALUES ('nomafeela', NULL, NULL, NULL, NULL, 6, 17);
INSERT INTO public.moon VALUES ('Nomalee', NULL, NULL, NULL, NULL, 7, 17);
INSERT INTO public.moon VALUES ('Reeekaroo', NULL, NULL, NULL, NULL, 8, 17);
INSERT INTO public.moon VALUES ('markkkk', NULL, NULL, NULL, NULL, 9, 17);
INSERT INTO public.moon VALUES ('taroo', NULL, NULL, NULL, NULL, 10, 17);
INSERT INTO public.moon VALUES ('jooohd', NULL, NULL, NULL, NULL, 11, 17);
INSERT INTO public.moon VALUES ('reeeee', NULL, NULL, NULL, NULL, 12, 17);
INSERT INTO public.moon VALUES ('wadfdgf', NULL, NULL, NULL, NULL, 13, 17);
INSERT INTO public.moon VALUES ('vee', NULL, NULL, NULL, NULL, 14, 17);
INSERT INTO public.moon VALUES ('garaboo', NULL, NULL, NULL, NULL, 15, 17);
INSERT INTO public.moon VALUES ('feechak', NULL, NULL, NULL, NULL, 16, 17);
INSERT INTO public.moon VALUES ('Metan', NULL, NULL, NULL, NULL, 17, 17);
INSERT INTO public.moon VALUES ('fornu', NULL, NULL, NULL, NULL, 18, 17);
INSERT INTO public.moon VALUES ('Mootax', NULL, NULL, NULL, NULL, 19, 17);
INSERT INTO public.moon VALUES ('Falalee', NULL, NULL, NULL, NULL, 20, 19);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('beegee', NULL, NULL, NULL, NULL, 14, 4);
INSERT INTO public.planet VALUES ('teee', NULL, NULL, NULL, NULL, 15, 4);
INSERT INTO public.planet VALUES ('popee', NULL, NULL, NULL, NULL, 16, 3);
INSERT INTO public.planet VALUES ('grandee', NULL, NULL, NULL, NULL, 17, 3);
INSERT INTO public.planet VALUES ('makee', NULL, NULL, NULL, NULL, 18, 3);
INSERT INTO public.planet VALUES ('walee', NULL, NULL, NULL, NULL, 19, 3);
INSERT INTO public.planet VALUES ('Masee', NULL, NULL, NULL, NULL, 20, 3);
INSERT INTO public.planet VALUES ('Wallaby', NULL, NULL, NULL, NULL, 21, 3);
INSERT INTO public.planet VALUES ('Pale', NULL, NULL, NULL, NULL, 22, 3);
INSERT INTO public.planet VALUES ('majaru', NULL, NULL, NULL, NULL, 23, 3);
INSERT INTO public.planet VALUES ('nanmee', NULL, NULL, NULL, NULL, 24, 3);
INSERT INTO public.planet VALUES ('pintee', NULL, NULL, NULL, NULL, 25, 3);
INSERT INTO public.planet VALUES ('wagoo', NULL, NULL, NULL, NULL, 26, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('broo', NULL, NULL, NULL, NULL, 3, 1);
INSERT INTO public.star VALUES ('bbbrar', NULL, NULL, NULL, NULL, 4, 2);
INSERT INTO public.star VALUES ('yaleeloo', NULL, NULL, NULL, NULL, 5, 3);
INSERT INTO public.star VALUES ('reetre', NULL, NULL, NULL, NULL, 6, 4);
INSERT INTO public.star VALUES ('planar', NULL, NULL, NULL, NULL, 7, 5);
INSERT INTO public.star VALUES ('jilraw', NULL, NULL, NULL, NULL, 8, 6);


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.test VALUES ('mael', NULL, 4, 1);
INSERT INTO public.test VALUES ('cancan', NULL, 6, 2);
INSERT INTO public.test VALUES ('Jenny', NULL, 89, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 39, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: test_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.test_test_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_galaxy_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key1 UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_moon_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key1 UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_planet_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key1 UNIQUE (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star star_star_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key1 UNIQUE (star_id);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (test_id);


--
-- Name: test test_test_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_test_id_key UNIQUE (test_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

