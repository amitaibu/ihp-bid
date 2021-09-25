

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

ALTER TABLE public.items DISABLE TRIGGER ALL;

INSERT INTO public.items (id, title) VALUES ('0b45ee42-6245-4aab-8820-6d0ad00079ad', 'First item');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;



ALTER TABLE public.bids ENABLE TRIGGER ALL;


