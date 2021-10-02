

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
INSERT INTO public.items (id, title, status) VALUES ('80b192f9-d803-4817-a512-1be5ec7a08cb', '123', 'inactive');
INSERT INTO public.items (id, title, status) VALUES ('5600c837-4ca0-4352-aa1c-7495448e46e2', 'foo', 'inactive');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bid_steps DISABLE TRIGGER ALL;



ALTER TABLE public.bid_steps ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;

INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d5032062-43b6-4f88-aea7-40a6c2e516df', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'rejected', 12, '2021-09-29 18:08:20.636589+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2d7f4caf-2ae6-4302-b91c-f47fa227725f', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'rejected', 15, '2021-09-29 18:29:18.916386+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d0c5d49f-934c-4c61-bad4-6c7df5c0794a', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 16, '2021-09-29 19:35:00.799078+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3a6b2d0f-39b7-4c56-bbac-a4ae8a540413', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 18, '2021-09-29 19:35:25.558408+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('02d43679-a938-439e-8376-36e05d6e4e31', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 28, '2021-09-29 21:04:38.313092+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('54a9bae2-66e3-4dd2-826e-ab9fcd4cc1d0', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 38, '2021-09-29 21:04:42.144555+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('9fd7e17a-8ccc-4e11-a529-70a8ed689a10', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 48, '2021-09-29 21:16:55.707003+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2f6d2457-34fa-4a45-b28b-da07647504bd', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 58, '2021-09-29 21:16:55.713742+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d6b93fa2-901d-400d-a80d-489ed4e9a568', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 68, '2021-09-29 21:17:24.6625+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('49d8e443-3db7-4a47-9896-268048528e35', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 78, '2021-09-29 21:17:28.013725+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a8bb02d8-5e57-4b84-9e23-0898513cb616', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 88, '2021-09-29 21:17:28.019247+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d1abb000-1ff3-4446-b3e7-9fa216fb8c93', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 98, '2021-09-29 21:18:19.665024+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('efaa02e2-0264-4c68-83c6-796915563b36', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 108, '2021-09-29 21:18:19.67065+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b34a88a4-c26c-4b0d-8860-2d85da70467c', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 118, '2021-09-29 21:42:20.838248+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d04b881f-6756-4959-be07-ece2a1f303fe', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 128, '2021-09-29 21:42:20.843663+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1260884a-13f3-494d-a67f-06b1e916e773', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 138, '2021-09-29 21:45:15.025818+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('19dcba33-e2c7-42c6-966b-82852dc2d07e', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 148, '2021-09-29 21:45:15.051381+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7b5fb735-2ef8-499b-98a4-2199749622c8', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 158, '2021-09-29 21:47:30.941282+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1dc5a83c-9683-44c9-8ec7-2f6653b25e32', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 168, '2021-09-30 00:39:28.11308+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('db6251a4-1f8d-4d84-af37-f69d676b4edc', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 178, '2021-09-30 00:39:28.131098+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1744bd11-b88d-4012-bd94-c05758b3e333', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 188, '2021-09-30 00:39:38.245004+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6cca42dc-1373-44d2-8b6e-9d4e31578bfa', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 198, '2021-09-30 00:39:38.262478+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7e5d9024-5ec3-4837-8189-fa9e5a3dc550', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 199, '2021-09-30 01:01:52.261364+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('c77f4fb0-019e-4bf7-87e5-1e402c51e2d6', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 209, '2021-09-30 01:01:52.268026+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('9395e028-cc6a-4d3e-896c-14027caddbed', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 219, '2021-09-30 08:28:21.510767+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8de23f8f-b739-4eae-9fa9-81303eb9ed8b', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 229, '2021-09-30 08:28:21.525101+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('59b1b2f0-6b08-43e2-b5ad-e64018fa3c40', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 239, '2021-09-30 11:00:36.115743+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('31ad4239-7a61-4202-9d8a-8c20c1de6952', '98ff9c09-55d8-4252-b010-5a6c36cb96a8', 'accepted', 249, '2021-09-30 11:00:36.138438+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('0ba80600-e728-4cd4-862d-1a2003f24dbc', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 10, '2021-09-30 16:16:21.956112+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('88560b0b-0c06-47f9-b312-c5618edbc1b4', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 20, '2021-09-30 16:16:21.962336+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6ba6b210-42fd-457a-9e38-d1c4d81df735', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 30, '2021-09-30 16:16:28.33445+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8c6ebb6e-2a46-438d-9c2d-9f514a1b280a', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 40, '2021-09-30 16:16:28.350236+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('35334fb3-0783-43b0-a53f-cb4bc05a6a2e', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 50, '2021-09-30 16:16:45.59711+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('61074d45-55a7-47ab-bc9e-3cadbf8d46ce', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 60, '2021-09-30 16:16:45.601234+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a9b2390e-bda9-4be0-8589-d77b7690dd12', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 70, '2021-09-30 19:19:03.112093+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8eb5b92f-d209-4a71-8424-3482bb6dd574', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 80, '2021-09-30 19:19:03.124044+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('9ec0e2d8-fa12-4da6-81f5-42e2d712cb56', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 90, '2021-09-30 19:19:19.521218+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('4ffcffee-aed2-4a1f-ba14-ce7aaab8198e', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 100, '2021-09-30 19:20:20.393411+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1bf012e4-29c0-4036-bad0-f92c350ed16c', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 110, '2021-09-30 19:20:27.674747+03', 'agent');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d736cceb-5671-476e-9ba8-f4b7cae1c497', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 120, '2021-09-30 21:22:29.190709+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a159c0b1-7834-489e-8ed0-7ade4d8dd109', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 130, '2021-09-30 21:22:35.982805+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('0ae16094-0e9f-46b6-b3aa-05bf670fcfc5', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 140, '2021-09-30 21:22:35.999967+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d1c8e070-64bb-46c4-9d70-5fd74347eaad', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 150, '2021-10-01 14:31:39.874958+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8817b457-1032-449d-8003-b65198b03e4e', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 160, '2021-10-01 14:31:39.889054+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b7e9a846-4711-481f-9e05-ebe7a633d49c', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 170, '2021-10-01 14:32:29.727649+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8048356b-6a97-4125-9706-70fe6e51f0c2', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 180, '2021-10-01 14:32:29.74533+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('c022690c-2aa2-42a9-8c69-ebe892784c62', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 190, '2021-10-01 14:32:49.395093+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('4ab1ab3e-767a-4ae2-8072-a50043a43e77', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 200, '2021-10-01 14:32:49.41207+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('0057996c-fde1-4d23-b9cb-fd9e48bafbe1', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 210, '2021-10-01 14:33:02.168727+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('da44099c-b9ec-4fee-915e-be3f592bd780', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 220, '2021-10-01 14:33:12.185855+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1fcca259-1cf2-4d6c-9f51-81855c1e99d2', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 230, '2021-10-01 14:33:29.294462+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('72d5a2d5-23d9-4b52-a911-b89e0e951542', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 240, '2021-10-01 14:33:33.315575+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('10e6ba02-3e3e-486c-ad9d-3a4cb8fadfe7', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 250, '2021-10-01 21:55:00.623626+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ee3a664f-2309-4566-9c3a-44837fcf895f', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 260, '2021-10-01 21:55:02.667855+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('48bbfb53-4116-449a-8ffc-2f58df642d03', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 270, '2021-10-01 22:05:19.343532+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('327b3450-389b-42a6-b874-64edc91e015a', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 280, '2021-10-01 22:05:21.363095+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f8a5e53d-6b9e-4cf4-ae75-8dfa299ad057', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 290, '2021-10-01 22:12:29.863114+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b2d4d8f5-2d03-47d5-b4ca-2181477656bc', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 300, '2021-10-01 22:12:31.879418+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f8188925-72b9-4bd2-9fd8-7670f3595b3c', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 310, '2021-10-01 23:36:28.617559+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('5a2deda8-5742-491e-9442-b8993b78dd4e', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 320, '2021-10-01 23:36:30.63085+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3444c575-2a82-4d41-a90f-870629ff52da', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 330, '2021-10-01 23:38:30.538158+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b4a13ce6-de86-4f32-96b0-7a264d041d74', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 340, '2021-10-01 23:38:32.546289+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1aaae15d-47da-48b0-ae57-2ae37487c709', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 350, '2021-10-01 23:38:51.179527+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6be8984d-ec48-4238-9ed2-22d2a25ccc2c', '5600c837-4ca0-4352-aa1c-7495448e46e2', 'accepted', 360, '2021-10-01 23:38:53.186372+03', 'auto_mail');


ALTER TABLE public.bids ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('20986f14-7085-4f4b-8710-283bf23284a0', 'foo@bar.com', 'sha256|17|t3eYqkPMxoi5N6M/mdrSEg==|B4fHPZNgfPRLbKWjtiylLxKq/NLkVOpGLZbBY3iDxhY=', NULL, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('2d383cf7-3872-4c4d-83a6-c57f9ffc94e3', 'foo@bar', 'sha256|17|ypnH1uqmG3veZS/+wI2UfQ==|xRggOBVNtGj+tR7q5ZA3loEiuV3XIHTx9gpqJBwLRfg=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


