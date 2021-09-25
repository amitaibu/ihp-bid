

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



ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;

INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('c0365ace-d319-447e-b2c1-de877b707075', '0b45ee42-6245-4aab-8820-6d0ad00079ad', 'accepted', 0, '2021-09-25 22:15:45.746044+03');
INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('2ea3fcbb-0029-4534-bea4-8c84d6bff757', '0b45ee42-6245-4aab-8820-6d0ad00079ad', 'accepted', 128, '2021-09-25 22:18:37.917599+03');
INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('0a57763c-2972-41a5-89a0-070987387e1c', '0b45ee42-6245-4aab-8820-6d0ad00079ad', 'rejected', 25, '2021-09-25 22:25:13.222877+03');


ALTER TABLE public.bids ENABLE TRIGGER ALL;


