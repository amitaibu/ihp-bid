

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

INSERT INTO public.items (id, title, status) VALUES ('271f6d8b-8449-45c9-b2ee-401b2315b25b', '123', 'inactive');
INSERT INTO public.items (id, title, status) VALUES ('1168f178-6dc3-4147-9b8a-a8646ea802d5', '123', 'inactive');
INSERT INTO public.items (id, title, status) VALUES ('9af99978-4b59-458a-879d-5a7bd584583e', '123', 'inactive');
INSERT INTO public.items (id, title, status) VALUES ('25c2c322-799d-4d74-ba4f-4ae6fa218e26', 'foo', 'inactive');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bid_steps DISABLE TRIGGER ALL;

INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('f69422e7-fa99-49e9-a322-68800d4ed7c0', 1, 3, 3, '9af99978-4b59-458a-879d-5a7bd584583e');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('c180fd04-1c08-4ec3-892a-bfc3b57f8ce1', 12, 12, 12, '25c2c322-799d-4d74-ba4f-4ae6fa218e26');


ALTER TABLE public.bid_steps ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;



ALTER TABLE public.bids ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


