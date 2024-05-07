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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(15) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (200, 2018, 'Final', 4, 2, 753, 754);
INSERT INTO public.games VALUES (201, 2018, 'Third Place', 2, 0, 755, 756);
INSERT INTO public.games VALUES (202, 2018, 'Semi-Final', 2, 1, 754, 756);
INSERT INTO public.games VALUES (203, 2018, 'Semi-Final', 1, 0, 753, 755);
INSERT INTO public.games VALUES (204, 2018, 'Quarter-Final', 3, 2, 754, 762);
INSERT INTO public.games VALUES (205, 2018, 'Quarter-Final', 2, 0, 756, 764);
INSERT INTO public.games VALUES (206, 2018, 'Quarter-Final', 2, 1, 755, 766);
INSERT INTO public.games VALUES (207, 2018, 'Quarter-Final', 2, 0, 753, 768);
INSERT INTO public.games VALUES (208, 2018, 'Eighth-Final', 2, 1, 756, 770);
INSERT INTO public.games VALUES (209, 2018, 'Eighth-Final', 1, 0, 764, 772);
INSERT INTO public.games VALUES (210, 2018, 'Eighth-Final', 3, 2, 755, 774);
INSERT INTO public.games VALUES (211, 2018, 'Eighth-Final', 2, 0, 766, 776);
INSERT INTO public.games VALUES (212, 2018, 'Eighth-Final', 2, 1, 754, 778);
INSERT INTO public.games VALUES (213, 2018, 'Eighth-Final', 2, 1, 762, 780);
INSERT INTO public.games VALUES (214, 2018, 'Eighth-Final', 2, 1, 768, 782);
INSERT INTO public.games VALUES (215, 2018, 'Eighth-Final', 4, 3, 753, 784);
INSERT INTO public.games VALUES (216, 2014, 'Final', 1, 0, 785, 784);
INSERT INTO public.games VALUES (217, 2014, 'Third Place', 3, 0, 787, 766);
INSERT INTO public.games VALUES (218, 2014, 'Semi-Final', 1, 0, 784, 787);
INSERT INTO public.games VALUES (219, 2014, 'Semi-Final', 7, 1, 785, 766);
INSERT INTO public.games VALUES (220, 2014, 'Quarter-Final', 1, 0, 787, 794);
INSERT INTO public.games VALUES (221, 2014, 'Quarter-Final', 1, 0, 784, 755);
INSERT INTO public.games VALUES (222, 2014, 'Quarter-Final', 2, 1, 766, 770);
INSERT INTO public.games VALUES (223, 2014, 'Quarter-Final', 1, 0, 785, 753);
INSERT INTO public.games VALUES (224, 2014, 'Eighth-Final', 2, 1, 766, 802);
INSERT INTO public.games VALUES (225, 2014, 'Eighth-Final', 2, 0, 770, 768);
INSERT INTO public.games VALUES (226, 2014, 'Eighth-Final', 2, 0, 753, 806);
INSERT INTO public.games VALUES (227, 2014, 'Eighth-Final', 2, 1, 785, 808);
INSERT INTO public.games VALUES (228, 2014, 'Eighth-Final', 2, 1, 787, 776);
INSERT INTO public.games VALUES (229, 2014, 'Eighth-Final', 2, 1, 794, 812);
INSERT INTO public.games VALUES (230, 2014, 'Eighth-Final', 1, 0, 784, 772);
INSERT INTO public.games VALUES (231, 2014, 'Eighth-Final', 2, 1, 755, 816);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (753, 'France');
INSERT INTO public.teams VALUES (754, 'Croatia');
INSERT INTO public.teams VALUES (755, 'Belgium');
INSERT INTO public.teams VALUES (756, 'England');
INSERT INTO public.teams VALUES (762, 'Russia');
INSERT INTO public.teams VALUES (764, 'Sweden');
INSERT INTO public.teams VALUES (766, 'Brazil');
INSERT INTO public.teams VALUES (768, 'Uruguay');
INSERT INTO public.teams VALUES (770, 'Colombia');
INSERT INTO public.teams VALUES (772, 'Switzerland');
INSERT INTO public.teams VALUES (774, 'Japan');
INSERT INTO public.teams VALUES (776, 'Mexico');
INSERT INTO public.teams VALUES (778, 'Denmark');
INSERT INTO public.teams VALUES (780, 'Spain');
INSERT INTO public.teams VALUES (782, 'Portugal');
INSERT INTO public.teams VALUES (784, 'Argentina');
INSERT INTO public.teams VALUES (785, 'Germany');
INSERT INTO public.teams VALUES (787, 'Netherlands');
INSERT INTO public.teams VALUES (794, 'Costa Rica');
INSERT INTO public.teams VALUES (802, 'Chile');
INSERT INTO public.teams VALUES (806, 'Nigeria');
INSERT INTO public.teams VALUES (808, 'Algeria');
INSERT INTO public.teams VALUES (812, 'Greece');
INSERT INTO public.teams VALUES (816, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 231, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 816, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

