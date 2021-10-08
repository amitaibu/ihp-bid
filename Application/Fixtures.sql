

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

ALTER TABLE public.bid_jobs DISABLE TRIGGER ALL;



ALTER TABLE public.bid_jobs ENABLE TRIGGER ALL;


ALTER TABLE public.items DISABLE TRIGGER ALL;

INSERT INTO public.items (id, title, status, created_at) VALUES ('264e8c78-67d7-494e-a54b-88df32180ded', 'new', 'inactive', '2021-10-06 13:14:53.037976+03');
INSERT INTO public.items (id, title, status, created_at) VALUES ('3436751e-1619-4a01-aca5-80095b651e20', 'Gil', 'inactive', '2021-10-06 13:14:53.039001+03');
INSERT INTO public.items (id, title, status, created_at) VALUES ('7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'g1', 'inactive', '2021-10-06 13:14:53.039706+03');
INSERT INTO public.items (id, title, status, created_at) VALUES ('38dde978-f2f1-4a47-84f6-edf70690e179', 't1', 'inactive', '2021-10-06 13:14:53.040547+03');
INSERT INTO public.items (id, title, status, created_at) VALUES ('2973e904-2139-43f1-b3ff-031875be5e11', '123', 'inactive', '2021-10-06 13:14:53.042452+03');
INSERT INTO public.items (id, title, status, created_at) VALUES ('e39867d1-2168-44ea-be09-f36fadc90af2', 'newnew', 'inactive', '2021-10-06 13:16:45.453367+03');
INSERT INTO public.items (id, title, status, created_at) VALUES ('376f3f87-48d8-4547-b857-643e1fe549a5', '123', 'inactive', '2021-10-06 15:00:27.404329+03');
INSERT INTO public.items (id, title, status, created_at) VALUES ('723751d7-8566-46d4-a78b-a095a7971651', 'tik', 'inactive', '2021-10-06 13:14:53.041485+03');
INSERT INTO public.items (id, title, status, created_at) VALUES ('ad4027b9-dae3-4c0a-b761-d0275701c31c', 'foo', 'active', '2021-10-08 11:13:43.783611+03');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.bid_steps DISABLE TRIGGER ALL;

INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('15687a3c-dd10-4e55-822d-b5f3caa6f4f7', 56, 56, 56, '264e8c78-67d7-494e-a54b-88df32180ded');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('54a6ed1a-a9d0-481e-9106-3d468c9f8a3f', 12, 12, 12, '3436751e-1619-4a01-aca5-80095b651e20');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('d9662a93-5f7b-4330-b9cf-acec00efaa80', 1, 1, 1, '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('de9f9b97-7d55-4b6b-bcc0-2bd644b99487', 1, 1, 1, '38dde978-f2f1-4a47-84f6-edf70690e179');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('4420831e-20ed-4dfb-999e-ffd5ab85b5cf', 2, 3, 3, '723751d7-8566-46d4-a78b-a095a7971651');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('247d1bda-5e03-4b27-9a83-13adc841f6c9', 1, 1, 1, '2973e904-2139-43f1-b3ff-031875be5e11');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('922b9dfb-927e-4a3d-9f19-c7f6fa4d921d', 2, 1, 1, '2973e904-2139-43f1-b3ff-031875be5e11');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('3ef092be-f34f-4717-9e15-ca93cac4edb5', 1, 2, 2, 'e39867d1-2168-44ea-be09-f36fadc90af2');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('e5013132-2a06-4032-a0c4-8328f40c16c1', 12, 43, 43, '376f3f87-48d8-4547-b857-643e1fe549a5');
INSERT INTO public.bid_steps (id, min, max, step, item_id) VALUES ('800c1f53-a51e-4328-a5e4-4596d2d11e48', 1, 2, 2, 'ad4027b9-dae3-4c0a-b761-d0275701c31c');


ALTER TABLE public.bid_steps ENABLE TRIGGER ALL;


ALTER TABLE public.bids DISABLE TRIGGER ALL;

INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2333d359-0843-4eb9-9efc-bbd4ffbfe325', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 25, '2021-10-03 00:42:22.86672+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7e330198-1fe8-49d1-a1ce-fb346661f619', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 35, '2021-10-03 00:42:33.956634+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('52a7d928-034b-4c6f-bd67-70cfd270f53e', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 45, '2021-10-03 00:42:35.962878+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('9c75c84d-59b7-4c74-8e39-3156b25adbfd', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 55, '2021-10-03 00:42:46.152455+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('67f1e0fc-e12f-477b-b845-9100386ea500', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 65, '2021-10-03 00:42:48.16977+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f030879d-be6b-4549-bcee-791a408236cd', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 75, '2021-10-03 00:42:52.752749+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('5229574a-0db1-4db8-bc4a-44656a6e5d5a', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 85, '2021-10-03 00:42:54.770719+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ca2abc41-dd2f-4aa0-ab76-290690fe98f5', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 95, '2021-10-03 00:43:00.503062+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e1fcebf7-d305-4b83-aa0f-c77490c2da74', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 105, '2021-10-03 00:43:02.510355+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('90445efd-30f1-4aa8-b53f-244d5d396a6e', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 115, '2021-10-03 01:09:03.365217+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2e97a163-9f83-49de-9cdb-8dda38ebd0c6', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 125, '2021-10-03 01:09:04.819311+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e308db85-a147-437a-b903-85b0d620bcdc', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 125, '2021-10-03 01:09:05.372157+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d009a06e-4eb8-49d1-9629-7ae741209afa', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 135, '2021-10-03 01:09:06.825515+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('862318bd-db3c-4f4d-9569-6e39f40cdd47', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 145, '2021-10-03 01:09:11.427671+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7b8aacdb-5b8b-4290-b690-3d543b2411ac', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 155, '2021-10-03 01:09:13.437077+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a9682e5c-f808-42cc-aa6d-a01decadd5fa', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 165, '2021-10-03 01:09:43.315081+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('9223bf17-745a-4126-b164-80023234931b', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 175, '2021-10-03 01:09:43.320476+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8948523f-64ae-474b-8bce-bbc6c12602a4', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 185, '2021-10-03 01:09:47.383047+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6810d441-0f54-4c71-addd-3c9181374995', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 195, '2021-10-03 01:09:47.40016+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('69a74248-2929-42ca-93d7-6617d3fa7b05', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 205, '2021-10-03 01:09:49.025897+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('791359ab-1585-4439-aa16-b1c463e41968', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 215, '2021-10-03 01:09:49.03897+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a16d6e4f-5c88-4937-9772-7bc68664d41b', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 225, '2021-10-03 01:09:50.763719+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('36ff0002-1b67-46ca-9099-a2c023629333', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 235, '2021-10-03 01:09:50.768609+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e1583412-e03a-43a1-b461-81d743236a2e', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 245, '2021-10-03 01:09:53.217827+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('00df8436-ef05-4b65-9b04-b5866c5e2ef0', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 255, '2021-10-03 01:09:53.223732+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('9f332dd6-3399-4c6d-80c5-02f9b46d6a80', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 265, '2021-10-03 01:11:54.249086+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7b033c47-478d-4110-915e-144b5c6f2829', '264e8c78-67d7-494e-a54b-88df32180ded', 'accepted', 275, '2021-10-03 01:11:54.266913+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e8339a38-84ea-4015-82c6-e5024af91cb8', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 15, '2021-10-03 16:46:32.597647+03', 'mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7310cb0f-7855-41da-842b-554a4d30b117', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 25, '2021-10-03 16:46:51.811686+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8555a3a4-c8a6-425d-892d-786f40992414', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 35, '2021-10-03 16:46:51.817408+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d099a7be-022b-4e02-b297-013db4e8fa18', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 45, '2021-10-03 16:47:06.560861+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('924b07b6-c3d6-46de-b89a-bcc107f5add2', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 55, '2021-10-03 16:47:06.566627+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1d89b07e-b79c-4338-889b-f873792af416', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 65, '2021-10-03 23:47:02.155158+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('0c00f823-0ddf-43af-adf2-cee4a1eada8d', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 75, '2021-10-03 23:47:02.161086+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('bbb2c9ec-6e29-44bc-9ab8-c02f50ff5a54', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 85, '2021-10-03 23:47:02.167197+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d2ad13a8-2d6e-4cae-a3b8-995b27168890', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 95, '2021-10-03 23:47:02.174035+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('5e33af94-0821-4566-9d44-ec0549d9c27d', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 105, '2021-10-03 23:47:02.181181+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('eb75675c-950b-41a1-a15e-6a143bba0e10', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 115, '2021-10-03 23:47:02.18502+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('20e28248-7cd1-46e8-a6bb-b142a4e47949', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 125, '2021-10-03 23:47:02.187633+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('bc263de1-f054-4dd1-bd4e-66d546614375', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 135, '2021-10-03 23:47:02.193297+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1da33a7b-877e-43d6-b788-027125af353c', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 145, '2021-10-03 23:47:02.197453+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('da333ce8-cba1-410a-89a0-8b6c70b8fbee', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 155, '2021-10-03 23:47:02.199975+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('dd8c8477-a099-469f-ab3e-83b0499ad10b', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 165, '2021-10-03 23:47:02.205495+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('46449a9c-0e0b-4236-b1c9-9d07f41ba575', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 175, '2021-10-03 23:47:02.210409+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('bb97cdbb-24f4-4042-9659-15a5d935c7b2', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 185, '2021-10-03 23:47:02.213088+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('cd0ab3fa-edfb-4eb0-8d7c-c4699850badb', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 195, '2021-10-03 23:47:02.215878+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('24117baa-8a52-4aec-a8f3-877cd21d1d94', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 205, '2021-10-03 23:47:02.21991+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('86381c87-179f-4e60-b35f-268641c79e79', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 215, '2021-10-03 23:47:02.222678+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ca53bc8f-c879-4654-b091-5e07f2bc2258', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 225, '2021-10-03 23:47:02.225963+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('41b42a1d-c261-42bf-a603-4b4f8c668e0f', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 235, '2021-10-03 23:47:02.230337+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('51b63ab0-4cc1-407a-8c4d-58cbd3aeedb0', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 245, '2021-10-03 23:47:02.232748+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('56bfa346-fc97-4d12-8359-8788cef35a3f', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 255, '2021-10-03 23:47:02.235139+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e6fc6c2e-4555-4ff0-8140-a1b5216105c7', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 265, '2021-10-03 23:47:02.23731+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('cd960bf2-2a29-4e89-84f8-19098ef0b491', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 275, '2021-10-03 23:47:02.239552+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f290fef9-4886-46cc-bcb2-9712e3cbd74a', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 285, '2021-10-03 23:47:02.24182+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('127962df-8c0a-4faa-ab1a-3fcd1a17f7d0', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 295, '2021-10-03 23:47:02.244055+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f431192f-39cd-4b5a-9245-a33d45ae433e', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 305, '2021-10-03 23:47:02.248302+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('12215dfb-6a5f-4735-a9bb-b55499e0c320', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 315, '2021-10-03 23:47:02.251572+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f4aacbf6-4633-4c56-a87d-c07dfb8c72b6', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 325, '2021-10-03 23:47:02.253614+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ca4fd1b8-a7c9-4518-84fe-022abc10621e', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 335, '2021-10-03 23:47:02.255891+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('dd44e297-7028-4d50-b132-cdf4604569ae', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 345, '2021-10-03 23:47:02.258056+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('78dcd7e8-21f7-473d-8343-d6fd813f9be2', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 355, '2021-10-03 23:47:02.260188+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b1931412-0b70-45b2-80aa-9a61d2408cfc', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 365, '2021-10-03 23:47:02.262061+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ef958c5e-3364-4f3d-8012-ada78398cf3c', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 375, '2021-10-03 23:47:02.26397+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('20a1fb5f-6bf8-411c-80e4-1ae326b424b2', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 385, '2021-10-03 23:47:02.265975+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('bf2a3291-8dd2-42cd-9e4d-e2a9a307ec54', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 395, '2021-10-03 23:47:02.267956+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('5f6109e7-3199-4019-b153-3934d6ef7713', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 405, '2021-10-03 23:47:02.269901+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f27b6af7-3241-4fcf-9775-4bebf58abcd4', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 415, '2021-10-03 23:47:02.272293+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('99ee217e-c72b-4959-8021-33aa5d755902', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 425, '2021-10-03 23:47:02.275122+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7d4aa6bd-f8f0-4e61-9635-6d7697dc8c69', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 435, '2021-10-03 23:47:02.277339+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f81e3754-8cf4-4172-84a8-6d13b8385528', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 445, '2021-10-03 23:47:02.27978+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1de3d507-4e87-40b6-ac0f-0f311fe5189b', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 455, '2021-10-03 23:47:02.282196+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('38fafa11-2adb-4b7f-b55a-12312c69bbdd', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 465, '2021-10-03 23:47:02.28588+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('67d5299b-7cf8-4be4-9347-d1697870de4e', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 475, '2021-10-03 23:47:02.288444+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2921161f-fb55-4326-842a-96223b8ed244', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 485, '2021-10-03 23:47:02.291298+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6ef71e11-22af-4fbb-ae21-db7765d04978', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 495, '2021-10-03 23:47:02.293512+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('12f045df-e955-4019-811c-9ce263e3d516', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 505, '2021-10-03 23:47:02.295663+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d91cb595-16e5-4b94-a16a-feb903191a02', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 515, '2021-10-03 23:47:17.21242+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d7ae2c6e-c0d4-452a-b8e8-9079ee14029e', '3436751e-1619-4a01-aca5-80095b651e20', 'accepted', 525, '2021-10-03 23:47:17.21919+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('03551546-81f4-4b99-a1f1-edee1eba86e8', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 10, '2021-10-03 23:49:47.961763+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7fcb6353-b8eb-4d67-a0d9-971467f7b738', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 20, '2021-10-03 23:49:49.976054+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('777bea7e-b631-4baf-8906-3f61008e5eae', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 30, '2021-10-03 23:49:51.993487+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b2e18fa1-e8a3-49bf-8de8-ddda1d98ccd8', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 40, '2021-10-03 23:49:54.011502+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7ddb5d46-820d-4d40-9658-21f3034b1456', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 50, '2021-10-03 23:49:56.021804+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('998a0939-8a3f-4f1a-8d92-03d48357b2b9', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 60, '2021-10-03 23:49:58.039198+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2fb9e0ac-4b52-4f75-900d-ec73ad41e5b2', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 70, '2021-10-03 23:50:00.05716+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f809c557-9f8c-4aae-ba84-38a78c99e6ba', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 80, '2021-10-03 23:50:02.065673+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('5cf24f42-b39d-4163-a22d-d795a9ce3b85', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 90, '2021-10-03 23:50:04.083611+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3f4661a4-cc79-44df-9913-23a93ea89776', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 100, '2021-10-03 23:50:06.101761+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2213dba1-f78e-4640-9006-cc1b51a2f9c5', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 110, '2021-10-03 23:50:08.118959+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('46e85ef9-d930-4909-aad9-c7051eb0ed94', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 120, '2021-10-03 23:50:10.13614+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7de2308e-4c4e-4759-8e3b-29b10af3a463', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 130, '2021-10-03 23:50:12.145518+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('cb8dcdf3-0bbe-4253-898b-45350ee6dbdf', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 140, '2021-10-03 23:50:14.153019+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('47e90609-afc3-4fee-8ac4-3de9cb71f083', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 150, '2021-10-03 23:50:16.161455+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7300c92f-d047-4b3e-94a8-5e1232859c21', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 160, '2021-10-03 23:50:18.179786+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('0f4105d8-a8ea-4abe-aa0c-cbcb0873a09e', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 170, '2021-10-03 23:50:20.197841+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('930bc3c4-b00b-4a81-84ce-25212ffc34b3', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 180, '2021-10-03 23:50:22.21687+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f51ffa85-2f22-4ed7-a121-9f2f0df11d21', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 190, '2021-10-03 23:50:24.224773+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('390304cb-960e-4883-a817-58187b31a9e9', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 200, '2021-10-03 23:50:26.241232+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('19e879a9-f0bb-4858-a427-2fc9f952d820', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 210, '2021-10-03 23:50:28.268196+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('43c157a9-7af5-437a-89a9-e6d001cee1b7', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 220, '2021-10-03 23:50:30.287315+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f88e7f45-2311-42bc-8712-996c54ae689d', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 230, '2021-10-03 23:50:32.294271+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3a681e4c-4b54-4bfc-918b-5a1ebfbe46c3', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 240, '2021-10-03 23:50:34.312483+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('845fb632-7d76-49ab-b38e-e8b98849b4a6', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 250, '2021-10-03 23:50:36.331485+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8b218a25-91a5-430f-b339-6b980ccfe439', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 260, '2021-10-03 23:50:38.350118+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6b135bca-a55d-4b94-80e1-2b034ac85f14', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 270, '2021-10-03 23:50:40.367899+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a0b0b8b9-9337-4245-a209-fe3bebfa0660', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 280, '2021-10-03 23:50:42.378064+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('715ba3ce-ea21-4cb4-8be0-40dc935ff203', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 290, '2021-10-03 23:50:44.396115+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('4f4d7a7b-38c9-443f-be97-12d0a96fa2a4', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 300, '2021-10-03 23:50:46.41601+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3dba7fbb-d65d-4927-abe7-159fa2b2b765', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 310, '2021-10-03 23:50:48.435035+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f2571385-e155-4eb5-8fcc-cbb3325476c0', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 320, '2021-10-03 23:50:50.453154+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7905b5a3-9bc3-4071-a8bb-f43fc0381574', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 330, '2021-10-03 23:50:52.471181+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('bcd34935-4d0f-450e-b9be-479f12242f90', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 340, '2021-10-03 23:50:54.491044+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('11ea99e5-be0c-4158-bceb-2d506b728bc6', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 350, '2021-10-03 23:50:56.51123+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a8a5a6a9-c959-4861-8a10-36989976d3a5', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 360, '2021-10-03 23:50:58.530578+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8865070f-f3ce-4e24-9efd-b3594bff5062', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 370, '2021-10-03 23:51:00.549915+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e73049ee-8e08-468e-8901-3c5b9b68fb03', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 380, '2021-10-03 23:51:02.561771+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a9baa605-73fd-404b-a484-569032c449a8', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 390, '2021-10-03 23:51:04.581476+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1368ee0f-2f74-4c7e-b720-64b3f6ec4c14', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 400, '2021-10-03 23:51:06.601136+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3bdf04ab-855a-47a2-ac74-5a7fbdcab8f3', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 410, '2021-10-03 23:51:08.620776+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8c26fb44-72f0-4229-9af7-a2611a78d97b', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 420, '2021-10-03 23:51:10.640518+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('de423990-17ed-47db-8491-d9ea9908e465', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 430, '2021-10-03 23:51:12.659397+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('dbada4d8-2d22-4361-88b1-d8a913ea905c', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 440, '2021-10-03 23:51:14.680104+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1baa5d06-d298-4055-9bdb-00a2ac75f706', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 450, '2021-10-03 23:51:16.697718+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('4f19f532-b5ea-4aa6-990a-3b6061a2a7c6', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 460, '2021-10-03 23:51:18.704824+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('703184c1-cd09-4844-83d0-babe32373f2f', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 470, '2021-10-03 23:51:20.711763+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2477d6eb-791b-407c-b803-f0d9b92b4187', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 480, '2021-10-03 23:51:22.732195+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('0fd1f27b-48e1-4f13-b5e0-492c2a824628', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 490, '2021-10-03 23:51:24.752092+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('9a1395ea-8794-4725-98c1-b52e8482a5ea', '7bcf8716-8ff2-41e7-8f82-bb70dd212ce5', 'accepted', 500, '2021-10-03 23:51:26.772961+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6566c62c-68d7-4eb7-b6d9-9160f8e39e8b', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 1, '2021-10-03 23:52:26.357097+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('32ea9e54-3cc9-4dae-86fb-027aa741aeef', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 11, '2021-10-03 23:52:26.363405+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b7af116b-18da-4667-8da6-30ca1afc5ad2', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 21, '2021-10-03 23:52:26.369257+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('5183a83b-2a3b-4b2a-be76-bf6ac47857f1', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 31, '2021-10-03 23:52:26.375652+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('4469764f-6158-43d5-ab54-108da30dcd5e', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 41, '2021-10-03 23:52:26.381882+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3be636f4-fa34-47d3-b40a-91f33dd72905', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 51, '2021-10-03 23:52:26.385543+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ef16a6db-ecc7-4707-bd07-2278f9d95c70', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 61, '2021-10-03 23:52:26.387789+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('82586c06-449e-488e-8b7e-64662930d0e8', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 71, '2021-10-03 23:52:26.392754+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3f519401-55bd-45c7-ae5e-813be14eee0d', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 81, '2021-10-03 23:52:26.396253+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('1fd71f37-3bb9-4d6b-a936-906eecee2c3d', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 91, '2021-10-03 23:52:26.399978+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8b19fcfe-bf6f-4d9e-9b00-8712988fb660', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 101, '2021-10-03 23:52:26.475294+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('db3a9b60-8b07-4ea3-9f9e-7eb151f488df', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 111, '2021-10-03 23:52:26.47868+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3fda6475-7f03-4fa0-bc3f-d3a8ab8b1536', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 121, '2021-10-03 23:52:26.483267+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('befeed07-476b-4222-b058-2c2e353f083c', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 131, '2021-10-03 23:52:26.486444+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('fc41d69b-2fa7-4673-9d0f-6a071287f267', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 141, '2021-10-03 23:52:26.48838+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8c790470-e852-4cdd-b6c1-67cea90ec270', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 151, '2021-10-03 23:52:26.490624+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('733d748d-f138-422a-8445-93af36eddeeb', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 161, '2021-10-03 23:52:26.492525+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('93173879-416b-4c37-949d-35e0d4f8733d', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 171, '2021-10-03 23:52:26.494245+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ad6f77de-1bed-42e8-9cc1-67506759b29a', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 181, '2021-10-03 23:52:26.4958+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d28ba516-32f0-4ac1-b550-ed63d264d0c9', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 191, '2021-10-03 23:52:26.498977+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('4af2cedd-ac72-46bf-985b-2fd4fb831449', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 201, '2021-10-03 23:52:26.501861+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a9d2f0d6-e73a-4cac-8ef6-3fb5464131db', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 211, '2021-10-03 23:52:26.505379+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6ba98ff2-772e-4aa4-82db-bb3a7cead558', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 221, '2021-10-03 23:52:26.507116+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('255d016c-8d02-474d-98a2-702574294364', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 231, '2021-10-03 23:52:26.511702+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('c6e75bb8-3bb4-407e-9d02-e44117e424b4', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 241, '2021-10-03 23:52:26.514386+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d1237042-1c04-460c-a3f2-b3f3e0287cb3', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 251, '2021-10-03 23:52:26.516423+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('81a4dd90-0cfd-4ccb-9eb0-ec3a9bff9154', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 261, '2021-10-03 23:52:26.518489+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('951a956b-6dfb-423a-84db-6c4472b0615e', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 271, '2021-10-03 23:52:26.520475+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d1621abc-4539-4140-819c-71d60226df7a', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 281, '2021-10-03 23:52:26.522544+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b9a8fec9-8bab-4c08-bdf8-03f764c0a189', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 291, '2021-10-03 23:52:26.524497+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('c65fc269-370f-44e8-8d6f-b63f61131f61', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 301, '2021-10-03 23:52:26.526482+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('4ebaf1da-9425-4963-b0af-f3a7b30bc354', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 311, '2021-10-03 23:52:26.528197+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('54ad6800-e12d-43c2-bb0b-34c023226f46', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 321, '2021-10-03 23:52:26.529909+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f48efc2c-e05c-45c6-91a5-784f1a1f42d1', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 331, '2021-10-03 23:52:26.531664+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e77ffce3-deb6-4263-9500-267325a6be91', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 341, '2021-10-03 23:52:26.533334+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('17c6bac7-782a-4096-b6b5-ab3d499cbaed', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 351, '2021-10-03 23:52:26.534957+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('abc2d25d-4ffd-4a10-a1f3-ced8f9d145b2', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 361, '2021-10-03 23:52:26.536556+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7a9bf334-7ff2-4dae-b80c-3c0670f82a33', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 371, '2021-10-03 23:52:26.538167+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a1a8cd87-6c7f-484f-8f39-b0a73d473a55', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 381, '2021-10-03 23:52:26.539914+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e3753e6a-7b8a-4269-b20d-ddcca18d1ac1', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 391, '2021-10-03 23:52:26.541825+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('2aa17b2b-16ec-456f-a731-7db5daa7bb9b', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 401, '2021-10-03 23:52:26.546003+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('46d8a5d8-8bbb-4325-9990-f45d9f51e329', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 411, '2021-10-03 23:52:26.548087+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3310c03c-e9cd-4128-a207-03475b79d633', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 421, '2021-10-03 23:52:26.550177+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('27cde347-41e1-4c49-9db3-c50480fe1ca3', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 431, '2021-10-03 23:52:26.552131+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('23f3f5e1-8b6c-4ee6-ae4f-45af7cfa570e', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 441, '2021-10-03 23:52:26.554286+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e4b0ba53-6650-4e1a-85bc-83d881d81c41', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 451, '2021-10-03 23:52:26.556362+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7fa85fa4-61e3-4ce2-90e1-ef503ed53a41', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 461, '2021-10-03 23:52:26.558525+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8cff602d-bb26-4fc7-8df0-66a6641153d4', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 471, '2021-10-03 23:52:26.560633+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ea263eec-a250-45f1-9d35-6471bb96a87e', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 481, '2021-10-03 23:52:26.562677+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e213a482-887e-4647-ad65-5f24b96d753a', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 491, '2021-10-03 23:52:26.564516+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7dd00b85-5514-480f-91a0-ad3669b19f01', '38dde978-f2f1-4a47-84f6-edf70690e179', 'accepted', 501, '2021-10-03 23:52:26.568817+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('883f2d90-9ff0-4877-b986-46b222907b88', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 10, '2021-10-04 07:23:54.406502+03', 'internet');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('47710084-5cd1-47d4-ac75-414fdbdf7123', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 20, '2021-10-04 07:23:54.412172+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e0311b3b-747b-41ce-a242-7e500bb5a1d3', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 30, '2021-10-04 07:23:54.415391+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('30d85939-1969-4943-9431-73ea3ffd5d1f', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 40, '2021-10-04 07:23:54.417524+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('be3e15d1-1cb2-4474-b19b-5cec91d9a259', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 50, '2021-10-04 07:23:54.419637+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ef2fcc5a-e80d-4c65-b8eb-dd52c8499cc9', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 60, '2021-10-04 07:23:54.421934+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('40ba7a3e-7384-4c9d-9790-f5d55400d684', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 70, '2021-10-04 07:23:54.4245+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('01b5f18a-a3aa-497b-ae66-6e686e644174', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 80, '2021-10-04 07:23:54.426749+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('087e1bff-8b23-41bd-97da-7bcb3708cbe6', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 90, '2021-10-04 07:23:54.428857+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('18c01102-3852-4157-9701-017557eecd31', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 100, '2021-10-04 07:23:54.430947+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('c237af22-4828-472a-bffd-0b99cd62e6c0', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 110, '2021-10-04 07:23:54.432956+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('dcdb5522-80e9-4a29-aa66-c797c55d478c', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 120, '2021-10-04 07:23:54.435054+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('23566c51-e098-4e7f-b44e-cdf5ebb6456d', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 130, '2021-10-04 07:23:54.437346+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('73c75324-3542-4ed8-b10f-47e92a035279', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 140, '2021-10-04 07:23:54.441398+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f1824537-4c04-448d-bfda-df637d2e183a', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 150, '2021-10-04 07:23:54.443581+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('357b61d9-82ec-4c07-a529-9a83d07f4df7', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 160, '2021-10-04 07:23:54.446287+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('b2f70672-78e7-4254-8bd1-d9b6c0b0949a', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 170, '2021-10-04 07:23:54.450581+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('c983b7bb-8099-4798-948f-4ce3db1fe745', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 180, '2021-10-04 07:23:54.454837+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('c8cde316-5a5e-42cc-b7d2-7ba344135d2c', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 190, '2021-10-04 07:23:54.457737+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('ae561362-106d-46cd-b578-886dea4777ab', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 200, '2021-10-04 07:23:54.459717+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d1868538-5c67-449b-91e5-e8229e0fcabb', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 210, '2021-10-04 07:23:54.462959+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('de1aa42e-758e-4181-85ea-906008b0630f', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 220, '2021-10-04 07:23:54.464687+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('09ddbe45-cc63-47c5-a069-16c60d8af393', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 230, '2021-10-04 07:23:54.467878+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('35f049a8-4dbc-43aa-9831-6cb4548a644b', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 240, '2021-10-04 07:23:54.470875+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7fc53b55-035c-430e-a696-2f91e6fc9669', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 250, '2021-10-04 07:23:54.474022+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('e496c669-8090-4024-a61b-b5df51ad365a', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 260, '2021-10-04 07:23:54.477703+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('0555ef19-72dd-4589-9269-49606f5a9565', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 270, '2021-10-04 07:23:54.479397+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('10ca7b5e-b34e-4e33-a1be-c22fb5811bce', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 280, '2021-10-04 07:23:54.481044+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6fdb7075-23ff-480d-a379-1b1373e8868b', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 290, '2021-10-04 07:23:54.482649+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('4d2f08a1-6fd6-4e80-9b82-945b28ac381a', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 300, '2021-10-04 07:23:54.484362+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3b4dbdab-6c5c-40b0-86ba-e80ce9f9857d', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 310, '2021-10-04 07:23:54.486126+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('597df7aa-8693-4b8a-85ab-ce5a6f9cc64e', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 320, '2021-10-04 07:23:54.488154+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('89134a00-1557-459c-a24e-3c64dc2fa842', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 330, '2021-10-04 07:23:54.490067+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('482c13df-ab4a-4661-a51d-180d7eac2b72', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 340, '2021-10-04 07:23:54.492036+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('d354a8b0-5e69-4da8-b964-f3d51b001074', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 350, '2021-10-04 07:23:54.494097+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8ed7c234-2d9d-4e19-a6c5-973965eef39a', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 360, '2021-10-04 07:23:54.49601+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6cdc990e-0d4f-48f8-8ed1-8ac9c73c31a1', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 370, '2021-10-04 07:23:54.497786+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('a419b4c7-1b26-4ae1-b621-7a5eaef004fb', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 380, '2021-10-04 07:23:54.499766+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('319b9577-5919-4bc8-a2f7-19781933cc46', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 390, '2021-10-04 07:23:54.502587+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('17cc7cfc-49d3-4b11-8c0a-11316b545a5d', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 400, '2021-10-04 07:23:54.504395+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('7d4234c4-63c2-4444-872e-bd136d584eed', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 410, '2021-10-04 07:23:54.506159+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('6d05a5a5-b5bc-48c0-a1fb-88b60be0c4ce', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 420, '2021-10-04 07:23:54.507964+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('76135824-78c6-400d-8cc8-15b7f4fd6dcc', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 430, '2021-10-04 07:23:54.509626+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('29b6f757-50b0-41fa-bc2f-c329218b4c7f', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 440, '2021-10-04 07:23:54.511366+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('be8e7db0-796a-40d5-85b3-01e72c1641ec', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 450, '2021-10-04 07:23:54.513052+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('280199fc-71f1-43f2-8f5d-51d6ebb1bcf2', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 460, '2021-10-04 07:23:54.515013+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('3dcd3bdf-de5e-49f7-862a-5eb897d89dab', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 470, '2021-10-04 07:23:54.516819+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('91239c86-5049-4e87-b099-ff765d7123f6', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 480, '2021-10-04 07:23:54.51879+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('8c7bc331-6226-4101-817e-54263d360280', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 490, '2021-10-04 07:23:54.520925+03', 'auto_mail');
INSERT INTO public.bids (id, item_id, status, price, created_at, bid_type) VALUES ('f82eb897-d388-419a-a3e3-9e0f33837ab6', '723751d7-8566-46d4-a78b-a095a7971651', 'accepted', 500, '2021-10-04 07:23:54.523224+03', 'auto_mail');


ALTER TABLE public.bids ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


