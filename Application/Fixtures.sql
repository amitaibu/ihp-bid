

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

INSERT INTO public.items (id, title, status) VALUES ('9ec0f931-fc8a-4513-97b6-026889cdbeaa', 'First item', 'active');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;

INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('a94f3eaa-2f99-4bc1-b482-d9a815097950', '9ec0f931-fc8a-4513-97b6-026889cdbeaa', 'rejected', 25, '2021-09-25 23:41:42.777443+03');
INSERT INTO public.bids (id, item_id, status, price, created_at) VALUES ('aaf2a4d0-72dd-468b-bf6a-0a105ddd9d2e', '9ec0f931-fc8a-4513-97b6-026889cdbeaa', 'rejected', 35, '2021-09-25 23:41:46.804326+03');


ALTER TABLE public.bids ENABLE TRIGGER ALL;


