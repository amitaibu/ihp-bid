

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

INSERT INTO public.items (id, title, status) VALUES ('98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'bar', 'inactive');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;

INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('e9572876-4269-4332-8e75-aae1fc0ad443', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'rejected', 12, '2021-09-27 19:09:32.369987+03');
INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('9c521b96-af81-4d81-b61d-5abab96c7de4', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'rejected', 15, '2021-09-27 19:09:41.31371+03');
INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('d747180e-317d-465d-a734-dfb6c4cb92a1', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'rejected', 16, '2021-09-27 19:22:12.414543+03');
INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('f7638af3-0f7d-4400-a473-25a78a459cf8', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'rejected', 17, '2021-09-27 19:23:23.186931+03');
INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('0a079dbd-6a7d-451a-b7aa-86f4aee60c0b', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'rejected', 19, '2021-09-27 20:23:29.155941+03');


ALTER TABLE public.bids ENABLE TRIGGER ALL;


