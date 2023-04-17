--
-- PostgreSQL database dump
--

-- Dumped from database version 13.10 (Debian 13.10-1.pgdg110+1)
-- Dumped by pg_dump version 15.2

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id uuid NOT NULL,
    auth_id character varying NOT NULL,
    email character varying,
    phone_number character varying,
    status character varying DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: friend_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friend_groups (
    id uuid NOT NULL,
    name character varying NOT NULL,
    total_count bigint DEFAULT 0 NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.friend_groups OWNER TO postgres;

--
-- Name: friendship_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendship_requests (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    from_user_id uuid NOT NULL,
    to_user_id uuid NOT NULL
);


ALTER TABLE public.friendship_requests OWNER TO postgres;

--
-- Name: friendships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendships (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL,
    friend_user_id uuid NOT NULL
);


ALTER TABLE public.friendships OWNER TO postgres;

--
-- Name: invitation_acceptances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitation_acceptances (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL,
    invitation_id uuid NOT NULL
);


ALTER TABLE public.invitation_acceptances OWNER TO postgres;

--
-- Name: invitation_awaitings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitation_awaitings (
    id uuid NOT NULL,
    starts_at timestamp with time zone NOT NULL,
    ends_at timestamp with time zone NOT NULL,
    comment character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.invitation_awaitings OWNER TO postgres;

--
-- Name: invitation_denials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitation_denials (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL,
    invitation_id uuid NOT NULL
);


ALTER TABLE public.invitation_denials OWNER TO postgres;

--
-- Name: invitation_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitation_users (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    invitation_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.invitation_users OWNER TO postgres;

--
-- Name: invitations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitations (
    id uuid NOT NULL,
    location character varying NOT NULL,
    coordinate public.geometry(Point,4326),
    comment character varying NOT NULL,
    starts_at timestamp with time zone NOT NULL,
    chat_room_id uuid,
    status character varying DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.invitations OWNER TO postgres;

--
-- Name: push_notification_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_notification_tokens (
    id uuid NOT NULL,
    device_id character varying NOT NULL,
    fcm_token character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.push_notification_tokens OWNER TO postgres;

--
-- Name: user_blocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_blocks (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL,
    block_user_id uuid NOT NULL
);


ALTER TABLE public.user_blocks OWNER TO postgres;

--
-- Name: user_friend_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_friend_groups (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    friend_group_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.user_friend_groups OWNER TO postgres;

--
-- Name: user_location_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_location_histories (
    id uuid NOT NULL,
    coordinate public.geometry(Point,4326) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.user_location_histories OWNER TO postgres;

--
-- Name: user_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_locations (
    id uuid NOT NULL,
    coordinate public.geometry(Point,4326) NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.user_locations OWNER TO postgres;

--
-- Name: user_mutes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_mutes (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL,
    mute_user_id uuid NOT NULL
);


ALTER TABLE public.user_mutes OWNER TO postgres;

--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profiles (
    id uuid NOT NULL,
    screen_id character varying NOT NULL,
    nickname character varying NOT NULL,
    avatar_url character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.user_profiles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    status character varying DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    account_id uuid NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: friend_groups friend_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friend_groups
    ADD CONSTRAINT friend_groups_pkey PRIMARY KEY (id);


--
-- Name: friendship_requests friendship_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship_requests
    ADD CONSTRAINT friendship_requests_pkey PRIMARY KEY (id);


--
-- Name: friendships friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: invitation_acceptances invitation_acceptances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_acceptances
    ADD CONSTRAINT invitation_acceptances_pkey PRIMARY KEY (id);


--
-- Name: invitation_awaitings invitation_awaitings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_awaitings
    ADD CONSTRAINT invitation_awaitings_pkey PRIMARY KEY (id);


--
-- Name: invitation_denials invitation_denials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_denials
    ADD CONSTRAINT invitation_denials_pkey PRIMARY KEY (id);


--
-- Name: invitation_users invitation_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_users
    ADD CONSTRAINT invitation_users_pkey PRIMARY KEY (id);


--
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);


--
-- Name: push_notification_tokens push_notification_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notification_tokens
    ADD CONSTRAINT push_notification_tokens_pkey PRIMARY KEY (id);


--
-- Name: user_blocks user_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_blocks
    ADD CONSTRAINT user_blocks_pkey PRIMARY KEY (id);


--
-- Name: user_friend_groups user_friend_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_friend_groups
    ADD CONSTRAINT user_friend_groups_pkey PRIMARY KEY (id);


--
-- Name: user_location_histories user_location_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_location_histories
    ADD CONSTRAINT user_location_histories_pkey PRIMARY KEY (id);


--
-- Name: user_locations user_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_pkey PRIMARY KEY (id);


--
-- Name: user_mutes user_mutes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_mutes
    ADD CONSTRAINT user_mutes_pkey PRIMARY KEY (id);


--
-- Name: user_profiles user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: accounts_auth_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX accounts_auth_id_key ON public.accounts USING btree (auth_id);


--
-- Name: friendship_user_id_friend_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX friendship_user_id_friend_user_id ON public.friendships USING btree (user_id, friend_user_id);


--
-- Name: friendshiprequest_from_user_id_to_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX friendshiprequest_from_user_id_to_user_id ON public.friendship_requests USING btree (from_user_id, to_user_id);


--
-- Name: invitationacceptance_user_id_invitation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX invitationacceptance_user_id_invitation_id ON public.invitation_acceptances USING btree (user_id, invitation_id);


--
-- Name: invitationdenial_user_id_invitation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX invitationdenial_user_id_invitation_id ON public.invitation_denials USING btree (user_id, invitation_id);


--
-- Name: push_notification_tokens_device_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX push_notification_tokens_device_id_key ON public.push_notification_tokens USING btree (device_id);


--
-- Name: push_notification_tokens_fcm_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX push_notification_tokens_fcm_token_key ON public.push_notification_tokens USING btree (fcm_token);


--
-- Name: user_profiles_screen_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_profiles_screen_id_key ON public.user_profiles USING btree (screen_id);


--
-- Name: user_profiles_user_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_profiles_user_id_key ON public.user_profiles USING btree (user_id);


--
-- Name: userblock_user_id_block_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX userblock_user_id_block_user_id ON public.user_blocks USING btree (user_id, block_user_id);


--
-- Name: userfriendgroup_friend_group_id_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX userfriendgroup_friend_group_id_user_id ON public.user_friend_groups USING btree (friend_group_id, user_id);


--
-- Name: userlocation_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX userlocation_user_id ON public.user_locations USING btree (user_id);


--
-- Name: userlocationhistory_user_id_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX userlocationhistory_user_id_created_at ON public.user_location_histories USING btree (user_id, created_at);


--
-- Name: usermute_user_id_mute_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usermute_user_id_mute_user_id ON public.user_mutes USING btree (user_id, mute_user_id);


--
-- Name: friend_groups friend_groups_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friend_groups
    ADD CONSTRAINT friend_groups_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: friendship_requests friendship_requests_users_from_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship_requests
    ADD CONSTRAINT friendship_requests_users_from_users FOREIGN KEY (from_user_id) REFERENCES public.users(id);


--
-- Name: friendship_requests friendship_requests_users_to_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship_requests
    ADD CONSTRAINT friendship_requests_users_to_users FOREIGN KEY (to_user_id) REFERENCES public.users(id);


--
-- Name: friendships friendships_users_friend_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_users_friend_user FOREIGN KEY (friend_user_id) REFERENCES public.users(id);


--
-- Name: friendships friendships_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: invitation_acceptances invitation_acceptances_invitations_invitation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_acceptances
    ADD CONSTRAINT invitation_acceptances_invitations_invitation FOREIGN KEY (invitation_id) REFERENCES public.invitations(id);


--
-- Name: invitation_acceptances invitation_acceptances_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_acceptances
    ADD CONSTRAINT invitation_acceptances_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: invitation_awaitings invitation_awaitings_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_awaitings
    ADD CONSTRAINT invitation_awaitings_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: invitation_denials invitation_denials_invitations_invitation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_denials
    ADD CONSTRAINT invitation_denials_invitations_invitation FOREIGN KEY (invitation_id) REFERENCES public.invitations(id);


--
-- Name: invitation_denials invitation_denials_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_denials
    ADD CONSTRAINT invitation_denials_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: invitation_users invitation_users_invitations_invitation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_users
    ADD CONSTRAINT invitation_users_invitations_invitation FOREIGN KEY (invitation_id) REFERENCES public.invitations(id);


--
-- Name: invitation_users invitation_users_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitation_users
    ADD CONSTRAINT invitation_users_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: invitations invitations_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: push_notification_tokens push_notification_tokens_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notification_tokens
    ADD CONSTRAINT push_notification_tokens_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_blocks user_blocks_users_block_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_blocks
    ADD CONSTRAINT user_blocks_users_block_user FOREIGN KEY (block_user_id) REFERENCES public.users(id);


--
-- Name: user_blocks user_blocks_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_blocks
    ADD CONSTRAINT user_blocks_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_friend_groups user_friend_groups_friend_groups_friend_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_friend_groups
    ADD CONSTRAINT user_friend_groups_friend_groups_friend_group FOREIGN KEY (friend_group_id) REFERENCES public.friend_groups(id) ON DELETE CASCADE;


--
-- Name: user_friend_groups user_friend_groups_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_friend_groups
    ADD CONSTRAINT user_friend_groups_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_location_histories user_location_histories_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_location_histories
    ADD CONSTRAINT user_location_histories_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_locations user_locations_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_mutes user_mutes_users_mute_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_mutes
    ADD CONSTRAINT user_mutes_users_mute_user FOREIGN KEY (mute_user_id) REFERENCES public.users(id);


--
-- Name: user_mutes user_mutes_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_mutes
    ADD CONSTRAINT user_mutes_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_profiles user_profiles_users_user_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_users_user_profile FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users users_accounts_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_accounts_account FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

