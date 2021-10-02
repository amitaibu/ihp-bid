

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.bid_steps DISABLE TRIGGER ALL;



ALTER TABLE public.bid_steps ENABLE TRIGGER ALL;


ALTER TABLE public.items DISABLE TRIGGER ALL;



ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;

INSERT INTO public.items (id, title, status, bid_steps) VALUES ('d5032062-43b6-4f88-aea7-40a6c2e516df', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'foo-title', 'active', '{}');

ALTER TABLE public.bids ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;


ALTER TABLE public.users ENABLE TRIGGER ALL;


