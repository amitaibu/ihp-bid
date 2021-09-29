

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

INSERT INTO public.items (id, title, status) VALUES ('98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'bar', 'active');
INSERT INTO public.items (id, title, status) VALUES ('b003ad37-f728-406a-9229-01c9700c3e57', 'Demo page', 'inactive');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;



ALTER TABLE public.bids ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('20986f14-7085-4f4b-8710-283bf23284a0', 'foo@bar.com', 'sha256|17|t3eYqkPMxoi5N6M/mdrSEg==|B4fHPZNgfPRLbKWjtiylLxKq/NLkVOpGLZbBY3iDxhY=', NULL, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('2d383cf7-3872-4c4d-83a6-c57f9ffc94e3', 'foo@bar', 'sha256|17|ypnH1uqmG3veZS/+wI2UfQ==|xRggOBVNtGj+tR7q5ZA3loEiuV3XIHTx9gpqJBwLRfg=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


