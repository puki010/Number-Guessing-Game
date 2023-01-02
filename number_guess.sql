--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE users;
--
-- Name: users; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO freecodecamp;

\connect users

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
    user_id integer,
    games_played integer,
    best_game integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_user_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_user_id_seq OWNED BY public.usernames.user_id;


--
-- Name: usernames user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames ALTER COLUMN user_id SET DEFAULT nextval('public.usernames_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 0, 0);
INSERT INTO public.games VALUES (3, 0, 0);
INSERT INTO public.games VALUES (4, 0, 0);
INSERT INTO public.games VALUES (5, 0, 0);
INSERT INTO public.games VALUES (6, 0, 0);
INSERT INTO public.games VALUES (7, 0, 0);
INSERT INTO public.games VALUES (8, 0, 0);
INSERT INTO public.games VALUES (9, 0, 0);
INSERT INTO public.games VALUES (10, 0, 0);
INSERT INTO public.games VALUES (11, 0, 0);
INSERT INTO public.games VALUES (13, 1, 0);
INSERT INTO public.games VALUES (12, 1, 0);
INSERT INTO public.games VALUES (24, 2, 47);
INSERT INTO public.games VALUES (23, 5, 239);
INSERT INTO public.games VALUES (16, 1, 1000);
INSERT INTO public.games VALUES (15, 1, 1000);
INSERT INTO public.games VALUES (14, 3, 2);
INSERT INTO public.games VALUES (27, 2, 471);
INSERT INTO public.games VALUES (18, 2, 385);
INSERT INTO public.games VALUES (26, 5, 67);
INSERT INTO public.games VALUES (17, 5, 417);
INSERT INTO public.games VALUES (1, 4, 0);
INSERT INTO public.games VALUES (25, 3, 2);
INSERT INTO public.games VALUES (20, 2, 481);
INSERT INTO public.games VALUES (19, 5, 88);
INSERT INTO public.games VALUES (29, 2, 40);
INSERT INTO public.games VALUES (28, 5, 95);
INSERT INTO public.games VALUES (22, 2, 363);
INSERT INTO public.games VALUES (21, 5, 326);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES (1, 'puki');
INSERT INTO public.usernames VALUES (2, 'user_1672658824018');
INSERT INTO public.usernames VALUES (3, 'user_1672658824017');
INSERT INTO public.usernames VALUES (4, 'user_1672659013420');
INSERT INTO public.usernames VALUES (5, 'user_1672659013419');
INSERT INTO public.usernames VALUES (6, 'user_1672659935173');
INSERT INTO public.usernames VALUES (7, 'user_1672659935172');
INSERT INTO public.usernames VALUES (8, 'user_1672660682338');
INSERT INTO public.usernames VALUES (9, 'user_1672660682337');
INSERT INTO public.usernames VALUES (10, 'user_1672669334238');
INSERT INTO public.usernames VALUES (11, 'user_1672669334237');
INSERT INTO public.usernames VALUES (12, 'user_1672670503378');
INSERT INTO public.usernames VALUES (13, 'user_1672670503377');
INSERT INTO public.usernames VALUES (14, 'beki');
INSERT INTO public.usernames VALUES (15, 'user_1672671940930');
INSERT INTO public.usernames VALUES (16, 'user_1672671940929');
INSERT INTO public.usernames VALUES (17, 'user_1672673602472');
INSERT INTO public.usernames VALUES (18, 'user_1672673602471');
INSERT INTO public.usernames VALUES (19, 'user_1672673929619');
INSERT INTO public.usernames VALUES (20, 'user_1672673929618');
INSERT INTO public.usernames VALUES (21, 'user_1672674009671');
INSERT INTO public.usernames VALUES (22, 'user_1672674009670');
INSERT INTO public.usernames VALUES (23, 'user_1672674084168');
INSERT INTO public.usernames VALUES (24, 'user_1672674084167');
INSERT INTO public.usernames VALUES (25, 'Haile');
INSERT INTO public.usernames VALUES (26, 'user_1672674319471');
INSERT INTO public.usernames VALUES (27, 'user_1672674319470');
INSERT INTO public.usernames VALUES (28, 'user_1672674466283');
INSERT INTO public.usernames VALUES (29, 'user_1672674466282');


--
-- Name: usernames_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_user_id_seq', 29, true);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.usernames(user_id);


--
-- PostgreSQL database dump complete
--

