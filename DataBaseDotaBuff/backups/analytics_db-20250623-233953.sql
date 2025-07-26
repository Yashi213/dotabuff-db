--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: language_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.language_enum AS ENUM (
    'ENGLISH',
    'RUSSIAN',
    'GERMAN'
);


ALTER TYPE public.language_enum OWNER TO postgres;

--
-- Name: matchtype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.matchtype AS ENUM (
    'RANKED',
    'UNRANKED',
    'CUSTOM'
);


ALTER TYPE public.matchtype OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievements (
    achievement_id integer NOT NULL,
    name character varying(255),
    description text
);


ALTER TABLE public.achievements OWNER TO postgres;

--
-- Name: achievements_achievement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achievements_achievement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.achievements_achievement_id_seq OWNER TO postgres;

--
-- Name: achievements_achievement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achievements_achievement_id_seq OWNED BY public.achievements.achievement_id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- Name: friendships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendships (
    user_id1 integer NOT NULL,
    user_id2 integer NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.friendships OWNER TO postgres;

--
-- Name: hero_builds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero_builds (
    build_id integer NOT NULL,
    hero_id integer,
    items_seq text,
    talents_seq text,
    win_rate double precision
);


ALTER TABLE public.hero_builds OWNER TO postgres;

--
-- Name: hero_builds_build_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hero_builds_build_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hero_builds_build_id_seq OWNER TO postgres;

--
-- Name: hero_builds_build_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hero_builds_build_id_seq OWNED BY public.hero_builds.build_id;


--
-- Name: hero_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero_stats (
    stat_id integer NOT NULL,
    hero_id integer,
    period_start date,
    period_end date,
    matches_played integer,
    wins integer,
    avg_gpm double precision,
    avg_xpm double precision
);


ALTER TABLE public.hero_stats OWNER TO postgres;

--
-- Name: hero_stats_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hero_stats_stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hero_stats_stat_id_seq OWNER TO postgres;

--
-- Name: hero_stats_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hero_stats_stat_id_seq OWNED BY public.hero_stats.stat_id;


--
-- Name: heroes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.heroes (
    hero_id integer NOT NULL,
    name character varying(100),
    primary_attr character varying(20)
);


ALTER TABLE public.heroes OWNER TO postgres;

--
-- Name: heroes_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.heroes_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.heroes_hero_id_seq OWNER TO postgres;

--
-- Name: heroes_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.heroes_hero_id_seq OWNED BY public.heroes.hero_id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    item_id integer NOT NULL,
    name character varying(100),
    cost integer,
    rarity character varying(20)
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_item_id_seq OWNER TO postgres;

--
-- Name: items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_item_id_seq OWNED BY public.items.item_id;


--
-- Name: kill_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kill_events (
    event_id integer NOT NULL,
    match_id integer,
    killer_id integer,
    victim_id integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.kill_events OWNER TO postgres;

--
-- Name: kill_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kill_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kill_events_event_id_seq OWNER TO postgres;

--
-- Name: kill_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kill_events_event_id_seq OWNED BY public.kill_events.event_id;


--
-- Name: leagues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leagues (
    league_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.leagues OWNER TO postgres;

--
-- Name: leagues_league_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leagues_league_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leagues_league_id_seq OWNER TO postgres;

--
-- Name: leagues_league_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leagues_league_id_seq OWNED BY public.leagues.league_id;


--
-- Name: match_item_purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match_item_purchase (
    purchase_id integer NOT NULL,
    match_id integer,
    profile_id integer,
    item_id integer,
    purchase_time timestamp without time zone
);


ALTER TABLE public.match_item_purchase OWNER TO postgres;

--
-- Name: match_item_purchase_purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.match_item_purchase_purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.match_item_purchase_purchase_id_seq OWNER TO postgres;

--
-- Name: match_item_purchase_purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.match_item_purchase_purchase_id_seq OWNED BY public.match_item_purchase.purchase_id;


--
-- Name: match_player_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match_player_stats (
    stat_id integer NOT NULL,
    match_id integer,
    profile_id integer,
    kills integer,
    deaths integer,
    assists integer,
    gpm integer,
    xpm integer,
    dmg_physical integer,
    dmg_magical integer,
    dmg_pure integer,
    healing integer
);


ALTER TABLE public.match_player_stats OWNER TO postgres;

--
-- Name: match_player_stats_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.match_player_stats_stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.match_player_stats_stat_id_seq OWNER TO postgres;

--
-- Name: match_player_stats_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.match_player_stats_stat_id_seq OWNED BY public.match_player_stats.stat_id;


--
-- Name: matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matches (
    match_id integer NOT NULL,
    tournament_id integer,
    date timestamp without time zone,
    duration interval,
    map character varying(100),
    mode public.matchtype,
    result character varying(50),
    replay_url character varying
);


ALTER TABLE public.matches OWNER TO postgres;

--
-- Name: matches_match_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matches_match_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matches_match_id_seq OWNER TO postgres;

--
-- Name: matches_match_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matches_match_id_seq OWNED BY public.matches.match_id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    notification_id integer NOT NULL,
    user_id integer,
    type character varying(50) NOT NULL,
    is_read boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_notification_id_seq OWNER TO postgres;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;


--
-- Name: player_achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_achievements (
    pa_id integer NOT NULL,
    profile_id integer,
    achievement_id integer,
    unlocked_at timestamp without time zone
);


ALTER TABLE public.player_achievements OWNER TO postgres;

--
-- Name: player_achievements_pa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_achievements_pa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.player_achievements_pa_id_seq OWNER TO postgres;

--
-- Name: player_achievements_pa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_achievements_pa_id_seq OWNED BY public.player_achievements.pa_id;


--
-- Name: player_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_profiles (
    profile_id integer NOT NULL,
    user_id integer,
    steam_id character varying(50),
    nickname character varying(100),
    mmr integer
);


ALTER TABLE public.player_profiles OWNER TO postgres;

--
-- Name: player_profiles_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_profiles_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.player_profiles_profile_id_seq OWNER TO postgres;

--
-- Name: player_profiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_profiles_profile_id_seq OWNED BY public.player_profiles.profile_id;


--
-- Name: players_in_match; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players_in_match (
    match_id integer NOT NULL,
    profile_id integer NOT NULL,
    team_id integer,
    hero_id integer
);


ALTER TABLE public.players_in_match OWNER TO postgres;

--
-- Name: roshan_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roshan_events (
    event_id integer NOT NULL,
    match_id integer,
    team_id integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.roshan_events OWNER TO postgres;

--
-- Name: roshan_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roshan_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roshan_events_event_id_seq OWNER TO postgres;

--
-- Name: roshan_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roshan_events_event_id_seq OWNED BY public.roshan_events.event_id;


--
-- Name: rune_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rune_events (
    event_id integer NOT NULL,
    match_id integer,
    player_id integer,
    rune_type character varying(50),
    "timestamp" timestamp without time zone
);


ALTER TABLE public.rune_events OWNER TO postgres;

--
-- Name: rune_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rune_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rune_events_event_id_seq OWNER TO postgres;

--
-- Name: rune_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rune_events_event_id_seq OWNED BY public.rune_events.event_id;


--
-- Name: team_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_members (
    team_id integer NOT NULL,
    profile_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date
);


ALTER TABLE public.team_members OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(255) NOT NULL,
    region character varying(100)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_team_id_seq OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: tournaments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournaments (
    tournament_id integer NOT NULL,
    name character varying(255) NOT NULL,
    league_id integer,
    start_date date,
    end_date date,
    prize_pool numeric
);


ALTER TABLE public.tournaments OWNER TO postgres;

--
-- Name: tournaments_tournament_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tournaments_tournament_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tournaments_tournament_id_seq OWNER TO postgres;

--
-- Name: tournaments_tournament_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tournaments_tournament_id_seq OWNED BY public.tournaments.tournament_id;


--
-- Name: tower_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tower_events (
    event_id integer NOT NULL,
    match_id integer,
    team_id integer,
    structure character varying(50),
    "timestamp" timestamp without time zone
);


ALTER TABLE public.tower_events OWNER TO postgres;

--
-- Name: tower_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tower_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tower_events_event_id_seq OWNER TO postgres;

--
-- Name: tower_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tower_events_event_id_seq OWNED BY public.tower_events.event_id;


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_settings (
    user_id integer NOT NULL,
    theme character varying(50),
    language public.language_enum,
    date_format character varying(20)
);


ALTER TABLE public.user_settings OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: achievements achievement_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements ALTER COLUMN achievement_id SET DEFAULT nextval('public.achievements_achievement_id_seq'::regclass);


--
-- Name: hero_builds build_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_builds ALTER COLUMN build_id SET DEFAULT nextval('public.hero_builds_build_id_seq'::regclass);


--
-- Name: hero_stats stat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_stats ALTER COLUMN stat_id SET DEFAULT nextval('public.hero_stats_stat_id_seq'::regclass);


--
-- Name: heroes hero_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heroes ALTER COLUMN hero_id SET DEFAULT nextval('public.heroes_hero_id_seq'::regclass);


--
-- Name: items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN item_id SET DEFAULT nextval('public.items_item_id_seq'::regclass);


--
-- Name: kill_events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kill_events ALTER COLUMN event_id SET DEFAULT nextval('public.kill_events_event_id_seq'::regclass);


--
-- Name: leagues league_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leagues ALTER COLUMN league_id SET DEFAULT nextval('public.leagues_league_id_seq'::regclass);


--
-- Name: match_item_purchase purchase_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_item_purchase ALTER COLUMN purchase_id SET DEFAULT nextval('public.match_item_purchase_purchase_id_seq'::regclass);


--
-- Name: match_player_stats stat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_player_stats ALTER COLUMN stat_id SET DEFAULT nextval('public.match_player_stats_stat_id_seq'::regclass);


--
-- Name: matches match_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches ALTER COLUMN match_id SET DEFAULT nextval('public.matches_match_id_seq'::regclass);


--
-- Name: notifications notification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: player_achievements pa_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_achievements ALTER COLUMN pa_id SET DEFAULT nextval('public.player_achievements_pa_id_seq'::regclass);


--
-- Name: player_profiles profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_profiles ALTER COLUMN profile_id SET DEFAULT nextval('public.player_profiles_profile_id_seq'::regclass);


--
-- Name: roshan_events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roshan_events ALTER COLUMN event_id SET DEFAULT nextval('public.roshan_events_event_id_seq'::regclass);


--
-- Name: rune_events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rune_events ALTER COLUMN event_id SET DEFAULT nextval('public.rune_events_event_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Name: tournaments tournament_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournaments ALTER COLUMN tournament_id SET DEFAULT nextval('public.tournaments_tournament_id_seq'::regclass);


--
-- Name: tower_events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tower_events ALTER COLUMN event_id SET DEFAULT nextval('public.tower_events_event_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievements (achievement_id, name, description) FROM stdin;
301	Expect should.	From want certain number manage reach.
302	Else reduce interest.	Many current reveal eye let could.
303	Remain.	Quite forward itself city example table.
304	Nor during kind.	Certain her amount benefit use policy start.
305	Along analysis eight.	Reveal agent activity where shake family.
306	Child identify we.	Give leader policy place participant.
307	Analysis doctor.	Store federal itself mouth and listen.
308	Young by.	Case bank his grow television.
309	Someone or.	State rule analysis.
310	You.	Hot American ground until near foot.
311	Throw explain.	Rule partner well most reflect drop.
312	Challenge station.	Method commercial brother blood.
313	Fall large.	Small senior later build far tonight hot.
314	Air dark.	Treatment wish others today physical food.
315	Company.	Time picture road. Point whatever which.
316	Next indeed consumer cell.	Involve common leg option only.
317	Join pick.	Court reduce open financial know idea century.
318	Business subject already lose.	Wide lose firm past real.
319	Put drive president.	Why television card American vote place.
320	Federal in compare.	Two the move degree the director film however.
321	Drop fact.	As other strong improve inside group.
322	Room.	Heart certain issue my final control.
323	Away.	Early save life truth work.
324	Mother after trouble.	Somebody yard he sport term.
325	Teacher attention chair.	Class test glass hundred heart he four.
326	Soldier south.	Area rather similar morning.
327	Forward capital.	Firm finish summer east between.
328	Check quality.	Congress left green know.
329	Specific.	Scientist magazine ground.
330	Fill person budget.	Industry trial serious us.
331	Response inside professor seat.	Reveal up both risk wall weight.
332	Knowledge food surface hold.	Write part visit push.
333	Fast impact hit.	Husband pick particularly billion will she.
334	Mission someone.	Staff sound read new avoid yourself road address.
335	Idea sing environment dog.	Treatment cold sign stuff truth what take.
336	Meet thus.	Learn miss particular because.
337	Responsibility of.	Behind plant democratic whose.
338	Would institution lead stand.	Smile finish poor low.
339	Whose way.	Throw he region.
340	Story.	Must about color somebody responsibility.
341	Help resource her.	Consumer nor maybe suffer.
342	Middle sound.	Recent year night care.
343	Five various on.	Face wait win seek sea team.
344	Fish as should.	Same especially evening situation garden sign.
345	Dark affect.	Project style others economy state time.
346	Issue out maybe.	While establish power total seven skill.
347	Majority apply close.	Area peace movie also nature.
348	Natural collection.	Reduce lay adult watch story first me.
349	Without hour various interview.	Smile course operation admit structure arrive.
350	Too age.	Close address story but identify follow natural.
351	Suddenly determine sit.	Treatment two use wide music argue form.
352	Skin society.	Name method kind within factor enough.
353	Girl growth need.	Instead big draw.
354	Within walk.	Although professional forget some note.
355	Develop increase they actually.	Always wife pretty safe.
356	Remember.	People need car out. Remain baby trouble treat.
357	That.	Speak instead third instead relate.
358	Thought peace.	Road cover green cause yeah compare foot.
359	Research standard remember.	Discuss five food office will might just.
360	Relationship pattern we.	Edge everybody opportunity reason resource kind.
361	Gas develop.	Community in car less plant human information.
362	Recently size.	Movie early style happy.
363	Those foot tough.	Strategy issue herself including market.
364	Music information.	Smile thus occur community.
365	Paper most.	Soldier protect region recently suffer hit.
366	View politics save.	Wait however few matter the.
367	Agency far.	Identify woman what trouble you management more.
368	Development threat.	Forward lot involve bad.
369	Wind professor foot.	Specific evening list fill long young staff.
370	Quite third.	Yes go make. Institution stop raise more.
371	Trip individual.	Instead college behind board send consider.
372	Several production.	Paper moment give mention show right north.
373	Check front control four.	Receive eat similar quickly hot prevent.
374	Market would.	Clearly training senior clear president player.
375	Work my carry.	Front everybody rate.
376	Short capital consider.	To treat decide. People pass entire stand.
377	Section upon.	Team contain international.
378	Between individual total.	Leave buy information close turn.
379	Story western bag.	End fast career her.
380	Material card.	Carry series act finally.
381	Doctor parent cover thousand.	Happen per artist sit. Measure really market.
382	People deep common.	Not consider poor leader work ever.
383	Practice Democrat pull.	Physical crime seat commercial his care.
384	Space program.	In decade big fact. Art wrong training find.
385	Partner.	Expert win war key. Put over compare work.
386	Garden talk.	Sense foreign would their.
387	Around education success.	Week him claim crime trouble eye.
388	Him despite by.	Perform son support camera pull.
389	So important say.	Push executive bar address yes.
390	Young bank gun.	Adult family challenge after.
391	Total other course.	Light ok the area mother bad.
392	Space short.	Bed cultural hit street eight mention.
393	Without price.	Hair yeah war attack stage.
394	Mention allow message.	Laugh receive director instead power.
395	South although.	Work piece exist.
396	Trip will tell.	Stop rise public guess tax better top.
397	Improve fund hand our.	Continue local message edge.
398	Here than.	Oil say research ground safe.
399	Prove marriage ask.	Future easy fish individual simply baby suddenly.
400	Picture authority guess to.	Accept Mr business card several point.
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	create role	SQL	V1__create_role.sql	1404488710	postgres	2025-06-23 23:04:27.520087	4	t
2	2	core tables	SQL	V2__core_tables.sql	-1591464180	postgres	2025-06-23 23:04:27.578629	24	t
3	3	leagues and tournaments	SQL	V3__leagues_and_tournaments.sql	2064525357	postgres	2025-06-23 23:04:27.638871	11	t
4	4	teams and members	SQL	V4__teams_and_members.sql	-1938014862	postgres	2025-06-23 23:04:27.683031	10	t
5	5	matches and events	SQL	V5__matches_and_events.sql	-199483277	postgres	2025-06-23 23:04:27.718789	19	t
6	6	heroes and achievements	SQL	V6__heroes_and_achievements.sql	-517852553	postgres	2025-06-23 23:04:27.754713	20	t
7	7	player match and items	SQL	V7__player_match_and_items.sql	-2089554162	postgres	2025-06-23 23:04:27.797486	15	t
8	8	add  indexes	SQL	V8__add__indexes.sql	-1923231168	postgres	2025-06-23 23:04:27.823199	18	t
\.


--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendships (user_id1, user_id2, status, created_at) FROM stdin;
\.


--
-- Data for Name: hero_builds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hero_builds (build_id, hero_id, items_seq, talents_seq, win_rate) FROM stdin;
61	61	109,101,110,99,103	4,5,4,5,3,5	0.79
62	62	95,103,111,117,105	3,1,7,6,4,3	0.07
63	63	98,108,118,94,116	8,8,3,5,4,2	0.11
64	64	118,103,114,98,106	1,2,5,1,6,6	0.29
65	65	108,116,117,93,91	8,4,6,7,4,3	0.94
66	66	116,95,118,111,98	7,5,1,3,7,6	0.34
67	67	100,117,120,115,94	6,4,3,8,2,5	0.23
68	68	115,108,110,102,98	7,5,2,1,1,2	0.97
69	69	111,116,113,94,119	3,2,5,8,6,1	0.13
70	70	105,112,92,106,118	8,8,8,3,4,8	0.96
71	71	115,99,98,96,103	2,2,7,7,5,2	0.36
72	72	100,95,94,99,120	7,4,8,2,7,5	0.42
73	73	118,96,105,109,117	4,3,3,2,2,1	0.75
74	74	98,113,95,111,101	4,8,4,7,6,3	0.29
75	75	95,109,108,119,94	5,1,3,8,7,3	0.92
76	76	93,108,92,114,94	3,7,4,1,4,7	0.3
77	77	92,117,112,94,98	6,2,1,6,6,7	0.31
78	78	98,112,119,115,103	6,7,2,4,8,5	0.95
79	79	91,111,119,118,102	7,6,6,4,7,1	0.11
80	80	102,103,95,116,97	4,1,4,3,2,7	0.77
\.


--
-- Data for Name: hero_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hero_stats (stat_id, hero_id, period_start, period_end, matches_played, wins, avg_gpm, avg_xpm) FROM stdin;
61	61	2024-12-28	2025-01-27	284	142	650.82	206.77
62	62	2024-12-12	2025-01-11	239	52	798.71	434.25
63	63	2025-04-25	2025-05-25	359	213	791.74	610.08
64	64	2025-01-27	2025-02-26	359	63	560.42	615.83
65	65	2024-07-12	2024-08-11	88	1	544.43	247.2
66	66	2025-03-25	2025-04-24	425	289	330.03	485.9
67	67	2025-02-09	2025-03-11	365	304	214.95	781.71
68	68	2024-10-19	2024-11-18	193	68	241.8	667.14
69	69	2024-07-20	2024-08-19	444	401	300.15	445.69
70	70	2024-12-23	2025-01-22	416	383	403.57	513.31
71	71	2025-04-16	2025-05-16	155	34	378.39	513.77
72	72	2024-09-10	2024-10-10	431	332	506.32	245.48
73	73	2025-02-28	2025-03-30	490	215	411.74	457.3
74	74	2024-10-03	2024-11-02	377	192	403.91	360.56
75	75	2025-03-14	2025-04-13	300	121	582.87	476.84
76	76	2024-10-18	2024-11-17	313	64	258.25	617.99
77	77	2025-05-15	2025-06-14	70	60	706.33	707.83
78	78	2025-01-06	2025-02-05	309	39	290.61	364.34
79	79	2025-03-21	2025-04-20	55	9	436.89	427.63
80	80	2024-11-28	2024-12-28	450	22	290.46	346.94
\.


--
-- Data for Name: heroes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.heroes (hero_id, name, primary_attr) FROM stdin;
61	Bethanyius	Agility
62	Kathleenius	Intelligence
63	Jamesius	Agility
64	Katherineius	Intelligence
65	Danielleius	Intelligence
66	Christopherius	Strength
67	Donnaius	Agility
68	Jamesius	Strength
69	Veronicaius	Intelligence
70	Amandaius	Agility
71	Sherriius	Strength
72	Joyceius	Intelligence
73	Richardius	Intelligence
74	Christineius	Strength
75	Ebonyius	Agility
76	Justinius	Strength
77	Danielius	Strength
78	Markius	Strength
79	Christopherius	Intelligence
80	Derrickius	Strength
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (item_id, name, cost, rarity) FROM stdin;
91	Own	4352	Uncommon
92	Door	4286	Rare
93	Skill	1093	Uncommon
94	Development	3564	Common
95	Two	4827	Rare
96	Either	1656	Rare
97	Discover	4966	Epic
98	Relationship	2684	Uncommon
99	Receive	1299	Common
100	Peace	4568	Rare
101	Hospital	2163	Uncommon
102	Executive	4406	Common
103	Behind	1896	Rare
104	Significant	4867	Rare
105	Animal	3485	Common
106	Low	2391	Common
107	Theory	2017	Common
108	Great	4635	Rare
109	Thought	3549	Uncommon
110	Public	1406	Uncommon
111	Win	1193	Uncommon
112	None	4319	Uncommon
113	Military	3249	Epic
114	Hour	1488	Rare
115	Against	3154	Epic
116	Fire	4932	Common
117	Teacher	2467	Common
118	Team	3914	Rare
119	Tv	4972	Uncommon
120	Practice	2563	Rare
\.


--
-- Data for Name: kill_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kill_events (event_id, match_id, killer_id, victim_id, "timestamp") FROM stdin;
1858	151	307	394	2025-06-23 20:23:50.455538
1859	151	339	332	2025-06-23 23:04:39.40855
1860	151	381	358	2025-06-23 23:13:49.648562
1861	151	339	326	2025-06-23 21:40:42.715131
1862	151	301	305	2025-06-23 21:45:45.828776
1863	151	384	373	2025-06-23 20:35:56.668232
1864	151	305	332	2025-06-23 21:18:12.327201
1865	151	374	399	2025-06-23 20:57:14.318329
1866	151	390	321	2025-06-23 22:20:42.560373
1867	151	333	312	2025-06-23 22:50:10.066936
1868	151	308	314	2025-06-23 22:20:23.560166
1869	151	390	371	2025-06-23 21:12:40.130378
1870	151	358	352	2025-06-23 21:05:02.707932
1871	151	359	305	2025-06-23 21:56:49.703981
1872	151	331	333	2025-06-23 21:15:00.563665
1873	151	332	357	2025-06-23 22:28:13.67164
1874	151	385	305	2025-06-23 21:51:14.458791
1875	151	368	353	2025-06-23 20:28:29.140557
1876	151	340	338	2025-06-23 21:01:41.514397
1877	151	345	330	2025-06-23 23:21:19.910058
1878	152	331	309	2025-06-23 21:19:31.30648
1879	152	400	327	2025-06-23 22:57:08.531763
1880	152	329	359	2025-06-23 20:56:55.881526
1881	152	310	311	2025-06-23 21:05:17.650263
1882	152	340	385	2025-06-23 21:57:14.139722
1883	152	394	376	2025-06-23 21:57:41.749747
1884	153	357	353	2025-06-23 22:21:11.59665
1885	153	336	334	2025-06-23 21:37:43.233146
1886	153	379	358	2025-06-23 21:09:09.823565
1887	153	321	392	2025-06-23 21:07:13.292043
1888	153	344	370	2025-06-23 21:41:44.320837
1889	153	305	340	2025-06-23 22:35:16.448907
1890	153	324	330	2025-06-23 22:35:28.051225
1891	153	370	308	2025-06-23 21:11:34.80568
1892	153	385	373	2025-06-23 22:18:11.437408
1893	153	375	366	2025-06-23 22:44:41.657952
1894	153	353	340	2025-06-23 21:36:53.976007
1895	153	324	378	2025-06-23 22:15:35.388846
1896	153	341	380	2025-06-23 22:39:28.175045
1897	153	388	348	2025-06-23 20:48:19.881879
1898	153	348	380	2025-06-23 23:01:26.949752
1899	153	345	318	2025-06-23 22:51:07.876322
1900	153	335	392	2025-06-23 21:12:49.470575
1901	153	340	377	2025-06-23 21:54:27.304915
1902	154	366	333	2025-06-23 21:34:44.752756
1903	154	396	316	2025-06-23 21:47:26.868819
1904	154	374	357	2025-06-23 23:10:13.141121
1905	154	357	378	2025-06-23 23:22:53.05621
1906	154	350	323	2025-06-23 22:25:24.329947
1907	154	313	378	2025-06-23 20:44:43.438329
1908	154	352	325	2025-06-23 22:13:42.33291
1909	154	306	321	2025-06-23 20:24:20.662283
1910	154	309	378	2025-06-23 22:08:27.096524
1911	154	352	332	2025-06-23 22:32:44.03116
1912	154	328	361	2025-06-23 21:48:54.117842
1913	155	329	320	2025-06-23 22:59:31.362537
1914	155	365	345	2025-06-23 21:30:46.552506
1915	155	330	335	2025-06-23 21:15:45.604721
1916	155	398	355	2025-06-23 21:57:53.39975
1917	155	341	342	2025-06-23 22:09:14.696867
1918	155	364	372	2025-06-23 21:59:09.89258
1919	155	341	345	2025-06-23 22:34:36.647736
1920	155	363	306	2025-06-23 20:51:48.169178
1921	155	345	359	2025-06-23 21:36:31.096952
1922	155	346	394	2025-06-23 23:10:44.378328
1923	155	304	326	2025-06-23 20:37:24.358901
1924	155	367	303	2025-06-23 21:09:08.312495
1925	156	341	374	2025-06-23 23:20:07.140455
1926	156	337	326	2025-06-23 21:34:59.706212
1927	156	351	342	2025-06-23 22:59:58.664973
1928	156	341	359	2025-06-23 22:42:26.879725
1929	156	318	386	2025-06-23 21:51:41.530141
1930	156	336	317	2025-06-23 23:23:08.861705
1931	156	392	376	2025-06-23 21:23:27.847907
1932	156	330	304	2025-06-23 23:07:35.474897
1933	156	388	347	2025-06-23 20:54:31.011216
1934	156	341	345	2025-06-23 20:56:34.201478
1935	156	332	391	2025-06-23 20:42:40.82278
1936	156	371	387	2025-06-23 22:34:10.432345
1937	156	312	398	2025-06-23 22:26:33.108148
1938	156	345	323	2025-06-23 21:14:14.057461
1939	157	391	324	2025-06-23 20:30:13.794139
1940	157	333	375	2025-06-23 22:40:21.307471
1941	157	353	385	2025-06-23 23:10:02.854588
1942	157	336	396	2025-06-23 23:11:06.601243
1943	157	353	359	2025-06-23 22:01:24.281075
1944	157	329	320	2025-06-23 21:42:53.56745
1945	158	377	353	2025-06-23 22:19:11.135094
1946	158	348	390	2025-06-23 20:25:53.549519
1947	158	337	313	2025-06-23 20:45:51.931266
1948	158	346	321	2025-06-23 20:24:52.440931
1949	158	364	339	2025-06-23 22:14:12.225558
1950	159	316	310	2025-06-23 21:35:37.185094
1951	159	355	341	2025-06-23 22:42:07.058657
1952	159	393	341	2025-06-23 23:16:38.358411
1953	159	301	302	2025-06-23 20:27:21.927357
1954	159	399	383	2025-06-23 22:46:05.115952
1955	159	374	366	2025-06-23 23:07:28.540502
1956	159	347	357	2025-06-23 22:08:21.24302
1957	159	345	390	2025-06-23 21:37:17.328816
1958	159	395	364	2025-06-23 21:07:50.349393
1959	160	363	333	2025-06-23 20:41:01.031026
1960	160	349	306	2025-06-23 21:10:50.723624
1961	160	363	373	2025-06-23 21:42:31.267051
1962	160	350	351	2025-06-23 21:21:23.374028
1963	160	372	336	2025-06-23 21:57:46.250194
1964	160	313	373	2025-06-23 23:06:55.811315
1965	160	393	375	2025-06-23 21:07:01.449155
1966	160	328	321	2025-06-23 23:19:08.622957
1967	160	306	334	2025-06-23 21:51:23.976224
1968	160	355	350	2025-06-23 21:38:32.020161
1969	161	396	335	2025-06-23 22:50:15.820285
1970	161	353	301	2025-06-23 22:11:04.092674
1971	161	396	314	2025-06-23 21:48:02.151807
1972	161	389	361	2025-06-23 22:42:40.117695
1973	161	321	317	2025-06-23 21:31:35.687901
1974	161	325	366	2025-06-23 21:19:42.380765
1975	161	397	327	2025-06-23 20:47:23.537617
1976	162	392	396	2025-06-23 20:27:42.510418
1977	162	308	381	2025-06-23 21:06:24.527415
1978	162	330	332	2025-06-23 22:19:49.306534
1979	162	343	371	2025-06-23 20:39:17.246555
1980	162	381	391	2025-06-23 22:03:09.41967
1981	162	382	326	2025-06-23 22:58:05.901696
1982	162	392	320	2025-06-23 22:02:39.60236
1983	162	309	396	2025-06-23 22:30:52.003583
1984	162	364	334	2025-06-23 20:59:47.934172
1985	162	368	349	2025-06-23 21:26:03.872286
1986	162	318	334	2025-06-23 23:03:40.688945
1987	162	355	330	2025-06-23 22:50:55.254739
1988	162	396	310	2025-06-23 22:15:04.546919
1989	162	373	358	2025-06-23 22:23:45.413997
1990	163	392	373	2025-06-23 22:40:37.479741
1991	163	400	309	2025-06-23 23:07:47.609566
1992	163	364	345	2025-06-23 22:47:36.118506
1993	163	389	313	2025-06-23 21:37:26.680933
1994	163	383	340	2025-06-23 23:05:14.844573
1995	163	378	332	2025-06-23 22:27:53.649856
1996	163	370	400	2025-06-23 20:29:13.403453
1997	163	385	319	2025-06-23 23:09:42.938005
1998	163	349	393	2025-06-23 22:54:52.56832
1999	163	302	379	2025-06-23 20:37:02.196053
2000	163	346	314	2025-06-23 21:10:37.471271
2001	163	386	374	2025-06-23 22:36:29.949157
2002	163	356	382	2025-06-23 21:34:26.043256
2003	163	356	312	2025-06-23 23:20:02.219135
2004	163	321	310	2025-06-23 22:14:17.984223
2005	163	360	358	2025-06-23 20:46:17.062807
2006	163	358	383	2025-06-23 23:00:53.546035
2007	163	333	307	2025-06-23 21:01:30.279
2008	164	396	328	2025-06-23 21:36:28.5662
2009	164	346	372	2025-06-23 23:12:25.057104
2010	164	395	349	2025-06-23 21:23:43.431235
2011	164	375	306	2025-06-23 22:56:32.182155
2012	164	335	324	2025-06-23 23:01:28.957284
2013	164	355	393	2025-06-23 20:47:46.961386
2014	165	391	312	2025-06-23 20:27:19.390773
2015	165	324	354	2025-06-23 20:26:36.359674
2016	165	367	326	2025-06-23 20:33:36.54223
2017	165	357	391	2025-06-23 21:29:27.969888
2018	165	345	312	2025-06-23 23:13:31.095118
2019	166	392	370	2025-06-23 20:45:59.239437
2020	166	351	337	2025-06-23 23:18:32.629434
2021	166	397	395	2025-06-23 20:51:49.05888
2022	166	334	371	2025-06-23 22:58:48.554379
2023	166	318	306	2025-06-23 21:40:51.450604
2024	166	347	363	2025-06-23 22:01:13.23497
2025	167	358	316	2025-06-23 22:25:23.116146
2026	167	352	390	2025-06-23 22:35:39.557657
2027	167	399	322	2025-06-23 21:46:59.344263
2028	167	307	362	2025-06-23 21:27:11.980282
2029	167	370	354	2025-06-23 21:39:39.264067
2030	167	329	313	2025-06-23 22:48:44.571558
2031	167	324	354	2025-06-23 21:11:26.231252
2032	167	301	352	2025-06-23 20:24:37.496662
2033	167	365	336	2025-06-23 22:24:28.204241
2034	167	360	382	2025-06-23 21:19:34.245827
2035	167	325	328	2025-06-23 21:16:25.147638
2036	167	398	347	2025-06-23 22:35:56.558581
2037	167	365	362	2025-06-23 21:54:50.856285
2038	168	376	341	2025-06-23 22:04:16.231686
2039	168	337	327	2025-06-23 22:04:35.811862
2040	168	378	344	2025-06-23 21:26:27.700515
2041	168	329	303	2025-06-23 22:57:31.311763
2042	168	365	342	2025-06-23 21:23:53.852223
2043	168	390	321	2025-06-23 20:45:50.326472
2044	168	332	388	2025-06-23 22:13:25.376673
2045	168	316	308	2025-06-23 21:15:42.860595
2046	168	309	394	2025-06-23 22:10:06.948286
2047	168	315	330	2025-06-23 23:20:39.289117
2048	168	333	389	2025-06-23 22:10:31.465665
2049	168	305	364	2025-06-23 20:23:45.239528
2050	168	357	364	2025-06-23 23:20:29.38488
2051	168	359	333	2025-06-23 21:32:58.070394
2052	168	309	395	2025-06-23 21:14:56.656833
2053	168	371	395	2025-06-23 22:51:00.563831
2054	169	393	356	2025-06-23 20:25:12.737849
2055	169	342	335	2025-06-23 20:57:15.495388
2056	169	383	384	2025-06-23 22:32:45.833021
2057	169	379	301	2025-06-23 22:55:59.803428
2058	169	313	388	2025-06-23 22:59:22.387484
2059	170	370	308	2025-06-23 20:59:23.431694
2060	170	302	316	2025-06-23 21:12:23.940655
2061	170	320	347	2025-06-23 21:10:05.662806
2062	170	319	382	2025-06-23 22:57:53.752904
2063	170	351	344	2025-06-23 23:11:20.989731
2064	170	344	370	2025-06-23 22:44:04.418497
2065	170	364	332	2025-06-23 21:28:56.986213
2066	170	372	368	2025-06-23 21:42:04.463348
2067	170	329	321	2025-06-23 20:50:21.331178
2068	171	350	324	2025-06-23 21:02:46.028748
2069	171	359	356	2025-06-23 21:48:32.644525
2070	171	389	386	2025-06-23 22:14:40.116691
2071	171	361	379	2025-06-23 21:32:10.233897
2072	171	321	342	2025-06-23 22:21:10.055843
2073	171	331	337	2025-06-23 22:47:09.826857
2074	171	357	350	2025-06-23 21:53:52.288848
2075	171	384	386	2025-06-23 22:08:21.755073
2076	171	309	345	2025-06-23 21:32:45.599746
2077	171	350	311	2025-06-23 22:06:11.624957
2078	171	378	340	2025-06-23 23:02:45.398752
2079	171	339	326	2025-06-23 22:03:29.850703
2080	172	341	326	2025-06-23 21:09:41.357595
2081	172	350	388	2025-06-23 21:08:00.733381
2082	172	371	386	2025-06-23 21:43:14.749322
2083	172	360	361	2025-06-23 22:00:12.003388
2084	172	339	372	2025-06-23 21:36:21.057227
2085	172	340	324	2025-06-23 22:42:55.543878
2086	172	400	315	2025-06-23 22:29:07.233756
2087	172	318	370	2025-06-23 21:52:16.730843
2088	172	381	329	2025-06-23 20:48:35.65307
2089	172	378	392	2025-06-23 22:55:20.67969
2090	172	347	366	2025-06-23 22:01:14.029462
2091	173	354	384	2025-06-23 21:07:00.350206
2092	173	370	320	2025-06-23 22:19:02.662015
2093	173	376	316	2025-06-23 21:50:25.33912
2094	173	396	316	2025-06-23 21:59:19.985338
2095	173	304	397	2025-06-23 22:56:00.02073
2096	173	339	324	2025-06-23 21:05:33.769319
2097	173	309	323	2025-06-23 22:10:15.059207
2098	173	309	311	2025-06-23 21:17:31.950256
2099	173	303	396	2025-06-23 22:30:06.750648
2100	173	331	338	2025-06-23 22:21:05.404117
2101	173	358	305	2025-06-23 20:45:51.303337
2102	173	320	386	2025-06-23 23:09:57.245337
2103	174	335	334	2025-06-23 23:10:23.66861
2104	174	371	384	2025-06-23 21:04:34.874304
2105	174	397	383	2025-06-23 21:03:00.248752
2106	174	384	339	2025-06-23 21:15:11.631798
2107	174	394	358	2025-06-23 22:39:42.317015
2108	174	303	400	2025-06-23 21:58:14.242442
2109	174	353	322	2025-06-23 20:29:12.07649
2110	174	377	366	2025-06-23 20:42:18.074046
2111	174	330	333	2025-06-23 21:32:31.189018
2112	174	303	379	2025-06-23 20:45:45.233652
2113	174	371	302	2025-06-23 22:15:59.345003
2114	174	397	394	2025-06-23 21:07:20.247147
2115	175	309	335	2025-06-23 21:07:34.001223
2116	175	366	336	2025-06-23 21:40:02.408312
2117	175	338	305	2025-06-23 20:32:13.725621
2118	175	384	325	2025-06-23 20:42:41.707916
2119	175	315	390	2025-06-23 22:53:18.835926
2120	175	399	363	2025-06-23 21:31:57.234924
2121	175	335	349	2025-06-23 23:19:07.068281
2122	175	351	315	2025-06-23 20:29:00.196189
2123	175	376	350	2025-06-23 21:37:19.704872
2124	175	383	390	2025-06-23 23:16:37.635484
2125	175	350	360	2025-06-23 20:50:58.486868
2126	175	339	381	2025-06-23 20:51:28.882813
2127	175	314	321	2025-06-23 23:16:16.062036
2128	175	361	302	2025-06-23 20:39:07.16397
2129	175	366	315	2025-06-23 21:13:28.217693
2130	175	351	355	2025-06-23 21:50:00.938513
2131	175	358	360	2025-06-23 22:12:56.08936
2132	175	400	361	2025-06-23 22:57:55.85504
2133	176	329	387	2025-06-23 23:14:03.764706
2134	176	324	364	2025-06-23 20:31:27.241275
2135	176	308	343	2025-06-23 21:33:20.194736
2136	176	315	347	2025-06-23 21:29:39.463074
2137	176	354	307	2025-06-23 22:21:41.632241
2138	176	317	325	2025-06-23 20:44:13.753743
2139	176	320	328	2025-06-23 21:39:35.064091
2140	176	384	398	2025-06-23 22:24:50.1028
2141	176	319	394	2025-06-23 21:24:40.767643
2142	176	365	340	2025-06-23 20:44:33.161735
2143	176	353	380	2025-06-23 21:21:09.038507
2144	176	354	325	2025-06-23 22:56:46.489238
2145	176	326	313	2025-06-23 23:08:23.494895
2146	176	380	349	2025-06-23 20:52:53.928519
2147	176	339	316	2025-06-23 22:30:33.175683
2148	176	387	324	2025-06-23 22:24:17.431925
2149	176	302	343	2025-06-23 20:53:04.820157
2150	176	392	379	2025-06-23 21:00:25.117658
2151	176	319	340	2025-06-23 23:14:18.979918
2152	176	373	337	2025-06-23 22:34:25.681624
2153	177	317	313	2025-06-23 23:01:17.081873
2154	177	344	316	2025-06-23 22:37:11.392164
2155	177	335	309	2025-06-23 21:07:21.111752
2156	177	395	323	2025-06-23 22:50:35.818267
2157	177	343	350	2025-06-23 20:25:48.929955
2158	177	362	302	2025-06-23 20:34:30.649113
2159	177	354	388	2025-06-23 22:06:22.565468
2160	177	329	389	2025-06-23 22:21:36.833834
2161	177	345	326	2025-06-23 22:45:13.047482
2162	177	325	361	2025-06-23 20:41:02.106444
2163	177	328	309	2025-06-23 22:41:03.636698
2164	177	374	324	2025-06-23 22:53:15.73651
2165	177	393	375	2025-06-23 21:50:36.683746
2166	177	316	387	2025-06-23 22:45:25.561589
2167	177	356	354	2025-06-23 22:31:44.527588
2168	177	336	385	2025-06-23 22:46:09.851646
2169	177	395	371	2025-06-23 23:02:15.468775
2170	177	386	364	2025-06-23 23:11:51.735759
2171	177	356	316	2025-06-23 20:31:27.979577
2172	177	392	362	2025-06-23 20:25:36.564927
2173	178	378	341	2025-06-23 20:42:36.027953
2174	178	354	302	2025-06-23 21:27:42.703193
2175	178	367	330	2025-06-23 21:17:12.510948
2176	178	381	325	2025-06-23 21:31:34.216712
2177	178	342	324	2025-06-23 20:35:58.396176
2178	178	303	361	2025-06-23 20:46:03.938895
2179	178	372	308	2025-06-23 21:23:11.438677
2180	178	346	367	2025-06-23 22:57:55.299875
2181	178	331	337	2025-06-23 20:29:17.926636
2182	179	328	331	2025-06-23 20:30:40.909414
2183	179	393	353	2025-06-23 21:56:00.829934
2184	179	317	308	2025-06-23 22:44:03.726718
2185	179	357	362	2025-06-23 23:12:31.369266
2186	179	310	312	2025-06-23 22:54:18.083365
2187	179	313	385	2025-06-23 21:31:09.360834
2188	179	318	395	2025-06-23 22:40:12.339677
2189	179	332	346	2025-06-23 23:13:25.403919
2190	179	388	337	2025-06-23 22:24:04.70182
2191	179	362	376	2025-06-23 21:18:47.731365
2192	179	311	301	2025-06-23 22:52:37.530013
2193	179	367	380	2025-06-23 23:23:32.473687
2194	179	377	369	2025-06-23 23:19:22.7359
2195	179	376	302	2025-06-23 23:03:59.094871
2196	179	387	333	2025-06-23 22:43:58.25671
2197	179	385	343	2025-06-23 20:37:17.86558
2198	180	390	393	2025-06-23 22:38:52.689904
2199	180	385	318	2025-06-23 21:04:36.167161
2200	180	397	371	2025-06-23 22:57:43.212188
2201	180	362	302	2025-06-23 22:56:07.738787
2202	180	339	327	2025-06-23 22:31:59.518492
2203	181	314	369	2025-06-23 21:02:36.242602
2204	181	397	341	2025-06-23 21:01:06.276203
2205	181	303	392	2025-06-23 22:18:17.870965
2206	181	337	347	2025-06-23 21:28:25.216143
2207	181	313	354	2025-06-23 22:40:37.418378
2208	181	372	351	2025-06-23 22:13:35.792988
2209	181	370	353	2025-06-23 21:15:05.602482
2210	181	309	388	2025-06-23 23:14:08.568791
2211	181	385	361	2025-06-23 23:10:16.418131
2212	181	310	389	2025-06-23 22:26:29.599347
2213	181	350	355	2025-06-23 21:31:38.972061
2214	181	345	310	2025-06-23 21:43:33.81851
2215	181	302	314	2025-06-23 23:19:43.594213
2216	181	310	340	2025-06-23 20:49:46.247515
2217	181	301	371	2025-06-23 23:17:09.285638
2218	181	345	388	2025-06-23 21:26:15.461971
2219	182	389	346	2025-06-23 20:25:31.731089
2220	182	317	337	2025-06-23 22:56:02.926665
2221	182	382	329	2025-06-23 22:07:51.062972
2222	182	309	380	2025-06-23 20:58:47.779835
2223	182	308	330	2025-06-23 21:05:31.255094
2224	182	343	346	2025-06-23 22:49:42.974913
2225	182	336	337	2025-06-23 20:58:07.674276
2226	182	390	355	2025-06-23 23:16:13.847895
2227	182	347	392	2025-06-23 21:41:15.225048
2228	182	365	346	2025-06-23 20:29:54.672578
2229	182	381	380	2025-06-23 21:50:36.355035
2230	182	339	322	2025-06-23 21:09:03.189848
2231	182	396	346	2025-06-23 21:17:22.701767
2232	182	342	384	2025-06-23 21:51:30.691779
2233	182	399	393	2025-06-23 22:01:23.687943
2234	182	303	349	2025-06-23 22:26:39.717154
2235	182	359	364	2025-06-23 23:13:36.406931
2236	182	374	356	2025-06-23 22:54:40.994614
2237	182	303	315	2025-06-23 21:40:08.577051
2238	182	309	338	2025-06-23 23:11:45.391428
2239	183	369	366	2025-06-23 21:29:53.821735
2240	183	320	350	2025-06-23 22:33:10.032387
2241	183	376	330	2025-06-23 23:13:20.882824
2242	183	381	326	2025-06-23 21:17:24.680879
2243	183	323	393	2025-06-23 21:02:01.013861
2244	184	356	391	2025-06-23 21:10:36.904729
2245	184	370	363	2025-06-23 21:38:14.024582
2246	184	350	337	2025-06-23 23:01:37.938395
2247	184	384	323	2025-06-23 22:14:39.291789
2248	184	381	378	2025-06-23 23:18:39.383545
2249	184	377	398	2025-06-23 21:29:19.140681
2250	184	375	389	2025-06-23 21:07:56.875777
2251	184	393	309	2025-06-23 23:06:07.392037
2252	185	395	326	2025-06-23 22:06:08.83409
2253	185	376	380	2025-06-23 21:36:48.556812
2254	185	332	363	2025-06-23 23:16:13.036384
2255	185	325	309	2025-06-23 22:08:28.067334
2256	185	330	387	2025-06-23 22:38:33.121342
2257	185	387	315	2025-06-23 22:26:46.717872
2258	185	387	312	2025-06-23 21:55:31.058175
2259	185	364	355	2025-06-23 20:29:50.743073
2260	185	307	371	2025-06-23 20:47:48.018422
2261	185	303	377	2025-06-23 21:02:59.973847
2262	185	353	318	2025-06-23 23:13:55.797406
2263	185	352	390	2025-06-23 22:31:29.103411
2264	185	371	346	2025-06-23 20:39:28.190596
2265	185	338	378	2025-06-23 20:58:40.805898
2266	185	333	357	2025-06-23 22:11:47.730163
2267	185	354	388	2025-06-23 22:53:56.327838
2268	185	378	319	2025-06-23 21:14:14.173152
2269	186	333	385	2025-06-23 23:04:54.855017
2270	186	380	320	2025-06-23 20:53:38.277909
2271	186	340	359	2025-06-23 22:16:00.641024
2272	186	344	369	2025-06-23 22:19:47.168486
2273	186	311	353	2025-06-23 21:31:54.403817
2274	186	367	350	2025-06-23 22:07:30.397789
2275	186	372	366	2025-06-23 21:10:08.456315
2276	186	360	368	2025-06-23 21:57:08.505913
2277	186	339	334	2025-06-23 23:16:11.724283
2278	186	379	313	2025-06-23 22:37:43.561498
2279	186	335	307	2025-06-23 22:45:10.922929
2280	186	355	367	2025-06-23 23:23:37.729266
2281	187	374	323	2025-06-23 21:39:43.192964
2282	187	399	362	2025-06-23 20:52:57.997834
2283	187	378	337	2025-06-23 23:17:49.37973
2284	187	364	311	2025-06-23 23:02:29.370449
2285	187	315	307	2025-06-23 22:50:27.570891
2286	187	389	372	2025-06-23 23:22:25.406909
2287	187	352	393	2025-06-23 20:51:47.468015
2288	187	329	333	2025-06-23 22:10:40.386802
2289	187	309	347	2025-06-23 21:18:32.451351
2290	187	387	313	2025-06-23 20:31:40.48669
2291	188	307	314	2025-06-23 20:55:35.620071
2292	188	312	343	2025-06-23 20:53:11.879578
2293	188	338	328	2025-06-23 23:10:31.833383
2294	188	360	400	2025-06-23 23:15:22.599747
2295	188	356	353	2025-06-23 22:52:11.727526
2296	188	344	365	2025-06-23 21:08:24.295927
2297	188	335	325	2025-06-23 22:25:05.844512
2298	188	392	347	2025-06-23 23:18:24.576704
2299	188	303	373	2025-06-23 23:18:29.182148
2300	188	371	359	2025-06-23 23:11:20.844072
2301	188	369	341	2025-06-23 22:23:25.563845
2302	188	373	389	2025-06-23 23:06:49.484657
2303	188	384	363	2025-06-23 21:37:30.943451
2304	188	375	362	2025-06-23 22:14:11.653174
2305	188	375	400	2025-06-23 21:35:53.302097
2306	188	310	332	2025-06-23 22:28:02.434953
2307	188	386	360	2025-06-23 23:07:06.276473
2308	189	382	322	2025-06-23 21:33:01.726411
2309	189	347	310	2025-06-23 20:38:05.428705
2310	189	303	317	2025-06-23 21:05:53.952237
2311	189	365	363	2025-06-23 22:32:30.691182
2312	189	365	313	2025-06-23 22:33:25.488857
2313	190	360	346	2025-06-23 21:07:24.006157
2314	190	361	365	2025-06-23 21:04:53.550682
2315	190	334	304	2025-06-23 23:22:19.609303
2316	190	351	311	2025-06-23 20:37:28.279463
2317	190	333	384	2025-06-23 20:45:22.211115
2318	190	385	327	2025-06-23 22:16:56.970219
2319	190	395	345	2025-06-23 21:04:20.801574
2320	190	335	332	2025-06-23 23:12:43.339915
2321	191	326	334	2025-06-23 21:39:08.348474
2322	191	303	365	2025-06-23 22:34:53.40626
2323	191	339	382	2025-06-23 20:41:41.491927
2324	191	364	368	2025-06-23 22:34:30.556408
2325	191	338	328	2025-06-23 20:46:40.343677
2326	191	376	367	2025-06-23 22:30:28.232987
2327	191	397	321	2025-06-23 21:13:17.887875
2328	191	315	311	2025-06-23 22:58:38.488303
2329	191	322	388	2025-06-23 20:38:19.979355
2330	191	384	314	2025-06-23 21:47:49.036199
2331	191	305	334	2025-06-23 22:18:16.524317
2332	191	375	391	2025-06-23 22:06:04.762269
2333	191	324	314	2025-06-23 20:41:34.93731
2334	191	381	385	2025-06-23 22:08:25.931155
2335	191	359	358	2025-06-23 22:32:21.949654
2336	191	331	303	2025-06-23 21:26:07.888004
2337	191	362	302	2025-06-23 22:20:44.251545
2338	191	318	311	2025-06-23 22:01:27.595391
2339	191	366	377	2025-06-23 21:08:34.161302
2340	191	380	320	2025-06-23 22:10:22.095377
2341	192	310	393	2025-06-23 20:32:05.661306
2342	192	307	353	2025-06-23 23:13:32.924061
2343	192	353	378	2025-06-23 21:02:36.366684
2344	192	333	392	2025-06-23 21:28:07.96415
2345	192	376	310	2025-06-23 21:35:03.215499
2346	192	381	391	2025-06-23 20:32:14.770106
2347	192	318	384	2025-06-23 22:22:33.810535
2348	193	333	350	2025-06-23 22:21:23.518722
2349	193	373	306	2025-06-23 22:17:03.579982
2350	193	345	375	2025-06-23 21:53:37.243594
2351	193	386	380	2025-06-23 20:38:04.118445
2352	193	333	335	2025-06-23 20:58:17.224974
2353	193	371	378	2025-06-23 22:57:39.295447
2354	193	312	362	2025-06-23 21:29:49.69839
2355	193	346	302	2025-06-23 21:13:40.193901
2356	193	400	396	2025-06-23 20:27:07.297788
2357	193	384	398	2025-06-23 21:32:13.566596
2358	193	344	372	2025-06-23 21:02:29.540424
2359	193	377	388	2025-06-23 20:25:40.482718
2360	193	374	351	2025-06-23 23:04:41.883389
2361	193	360	317	2025-06-23 20:48:08.460186
2362	193	311	372	2025-06-23 22:58:51.168846
2363	193	389	349	2025-06-23 23:09:22.128523
2364	194	371	352	2025-06-23 22:42:52.525366
2365	194	400	337	2025-06-23 23:21:09.605859
2366	194	373	303	2025-06-23 22:07:53.257824
2367	194	348	310	2025-06-23 23:04:43.573027
2368	194	359	351	2025-06-23 21:16:16.450253
2369	194	398	341	2025-06-23 22:38:00.837979
2370	194	381	369	2025-06-23 23:09:43.055257
2371	194	302	342	2025-06-23 22:47:29.06281
2372	194	317	310	2025-06-23 20:58:09.981292
2373	194	366	347	2025-06-23 22:28:33.921135
2374	194	381	342	2025-06-23 22:19:38.388788
2375	194	376	327	2025-06-23 20:47:24.708998
2376	194	328	360	2025-06-23 21:02:38.371787
2377	195	354	383	2025-06-23 20:24:50.054694
2378	195	317	357	2025-06-23 22:15:10.941127
2379	195	317	378	2025-06-23 22:24:42.575741
2380	195	340	370	2025-06-23 20:52:25.343588
2381	195	314	315	2025-06-23 21:58:46.57134
2382	195	313	317	2025-06-23 22:34:55.643414
2383	195	317	395	2025-06-23 22:42:49.937038
2384	195	302	321	2025-06-23 22:06:22.82272
2385	195	350	385	2025-06-23 23:00:54.810179
2386	195	344	307	2025-06-23 22:56:54.617512
2387	195	375	317	2025-06-23 23:01:15.552464
2388	195	302	372	2025-06-23 21:46:18.680253
2389	195	349	308	2025-06-23 20:54:02.478889
2390	195	341	349	2025-06-23 21:48:12.187616
2391	195	326	384	2025-06-23 21:25:52.693126
2392	195	351	310	2025-06-23 22:52:00.257205
2393	196	391	372	2025-06-23 22:15:37.279252
2394	196	348	388	2025-06-23 22:28:25.062738
2395	196	352	303	2025-06-23 20:24:20.783879
2396	196	315	332	2025-06-23 20:49:04.456964
2397	196	381	303	2025-06-23 21:04:34.593589
2398	196	380	376	2025-06-23 22:09:45.274238
2399	196	385	351	2025-06-23 21:25:10.912576
2400	196	335	372	2025-06-23 20:30:59.413341
2401	196	373	363	2025-06-23 21:28:29.475139
2402	196	306	358	2025-06-23 20:36:14.113607
2403	196	354	320	2025-06-23 20:39:06.648001
2404	196	372	345	2025-06-23 22:37:52.833105
2405	196	311	345	2025-06-23 21:37:29.382903
2406	196	391	312	2025-06-23 22:59:40.747751
2407	196	332	367	2025-06-23 22:18:27.588348
2408	196	311	392	2025-06-23 20:48:36.630471
2409	196	336	362	2025-06-23 20:44:02.551914
2410	196	396	390	2025-06-23 22:30:27.556405
2411	197	358	323	2025-06-23 21:05:57.398873
2412	197	331	382	2025-06-23 21:29:35.458535
2413	197	316	335	2025-06-23 22:10:06.019864
2414	197	367	380	2025-06-23 22:11:59.517697
2415	197	324	395	2025-06-23 21:12:10.140728
2416	197	306	371	2025-06-23 22:06:48.190407
2417	197	377	327	2025-06-23 22:41:22.12232
2418	197	303	380	2025-06-23 21:41:33.007925
2419	197	326	312	2025-06-23 21:16:12.763746
2420	197	303	350	2025-06-23 21:26:09.2501
2421	198	374	341	2025-06-23 21:40:24.757816
2422	198	377	371	2025-06-23 22:48:32.136559
2423	198	388	317	2025-06-23 21:34:36.322405
2424	198	335	400	2025-06-23 22:00:15.99294
2425	198	397	381	2025-06-23 21:23:18.156514
2426	198	317	319	2025-06-23 21:55:44.001311
2427	198	384	352	2025-06-23 23:04:15.509049
2428	198	378	369	2025-06-23 21:42:54.738051
2429	198	344	378	2025-06-23 22:14:44.827093
2430	198	329	360	2025-06-23 21:01:39.681666
2431	199	373	387	2025-06-23 21:20:58.02319
2432	199	301	393	2025-06-23 20:36:41.934228
2433	199	351	311	2025-06-23 20:47:53.932553
2434	199	331	349	2025-06-23 20:33:51.940069
2435	199	379	378	2025-06-23 21:22:24.822791
2436	199	320	362	2025-06-23 21:06:27.075376
2437	199	385	367	2025-06-23 21:36:31.977265
2438	199	327	312	2025-06-23 20:57:31.51545
2439	200	368	326	2025-06-23 21:02:01.092167
2440	200	380	337	2025-06-23 21:08:04.462088
2441	200	326	389	2025-06-23 20:26:50.821747
2442	200	384	323	2025-06-23 21:40:36.552507
2443	200	342	383	2025-06-23 22:27:18.881446
2444	200	314	331	2025-06-23 22:41:56.910761
2445	200	374	301	2025-06-23 21:54:23.829077
2446	200	307	390	2025-06-23 22:35:59.324199
2447	200	320	352	2025-06-23 22:54:00.952117
2448	200	385	397	2025-06-23 21:14:09.693754
2449	200	347	342	2025-06-23 23:06:52.921125
2450	200	382	301	2025-06-23 21:01:53.810788
2451	200	394	339	2025-06-23 22:18:39.295799
\.


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leagues (league_id, name) FROM stdin;
16	Sosa and Sons
17	Williams, Johnson and Rodriguez
18	Hunter, Calhoun and Hill
19	Chambers Group
20	Ryan and Sons
\.


--
-- Data for Name: match_item_purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match_item_purchase (purchase_id, match_id, profile_id, item_id, purchase_time) FROM stdin;
2251	151	361	118	2025-06-23 22:31:32.625782
2252	151	361	101	2025-06-23 23:11:43.747086
2253	151	361	99	2025-06-23 22:27:52.557205
2254	151	377	116	2025-06-23 22:57:58.417978
2255	151	377	117	2025-06-23 21:40:46.441556
2256	151	377	95	2025-06-23 20:55:18.504714
2257	151	391	105	2025-06-23 22:03:47.270755
2258	151	391	102	2025-06-23 22:25:44.805774
2259	151	391	109	2025-06-23 20:29:59.366988
2260	151	348	98	2025-06-23 22:27:39.772976
2261	151	348	112	2025-06-23 21:15:21.433785
2262	151	348	111	2025-06-23 20:58:01.760906
2263	151	315	101	2025-06-23 21:59:24.647862
2264	151	315	102	2025-06-23 20:24:11.947836
2265	151	315	100	2025-06-23 20:43:38.294708
2266	152	385	115	2025-06-23 21:03:29.676093
2267	152	385	112	2025-06-23 21:39:28.206994
2268	152	385	104	2025-06-23 21:26:48.52065
2269	152	313	96	2025-06-23 23:10:13.481144
2270	152	313	100	2025-06-23 21:11:39.444463
2271	152	313	91	2025-06-23 23:15:32.550069
2272	152	310	96	2025-06-23 21:56:49.664544
2273	152	310	93	2025-06-23 21:10:00.234773
2274	152	310	111	2025-06-23 20:57:09.792444
2275	152	378	115	2025-06-23 22:53:12.980265
2276	152	378	98	2025-06-23 23:08:51.787248
2277	152	378	96	2025-06-23 22:57:18.16467
2278	152	301	101	2025-06-23 20:59:55.625391
2279	152	301	94	2025-06-23 21:55:32.864306
2280	152	301	115	2025-06-23 22:34:15.746895
2281	153	302	106	2025-06-23 21:40:28.435921
2282	153	302	108	2025-06-23 22:32:44.59568
2283	153	302	96	2025-06-23 21:04:48.088343
2284	153	367	97	2025-06-23 20:37:35.762904
2285	153	367	114	2025-06-23 20:41:04.25058
2286	153	367	96	2025-06-23 20:34:54.718101
2287	153	325	106	2025-06-23 22:32:27.470534
2288	153	325	111	2025-06-23 21:43:22.722458
2289	153	325	99	2025-06-23 21:03:46.726048
2290	153	341	94	2025-06-23 21:52:03.768322
2291	153	341	107	2025-06-23 21:33:36.524503
2292	153	341	118	2025-06-23 21:39:21.184059
2293	153	390	95	2025-06-23 20:59:15.219575
2294	153	390	105	2025-06-23 22:26:42.102786
2295	153	390	100	2025-06-23 20:57:48.456398
2296	154	326	92	2025-06-23 21:08:02.071014
2297	154	326	96	2025-06-23 22:36:31.22393
2298	154	326	102	2025-06-23 20:24:36.510888
2299	154	301	102	2025-06-23 20:44:20.992498
2300	154	301	111	2025-06-23 21:34:33.128989
2301	154	301	117	2025-06-23 21:03:04.192272
2302	154	382	114	2025-06-23 23:07:42.411608
2303	154	382	94	2025-06-23 20:41:12.419192
2304	154	382	92	2025-06-23 21:53:21.701757
2305	154	340	105	2025-06-23 21:31:22.781418
2306	154	340	99	2025-06-23 20:41:03.767392
2307	154	340	114	2025-06-23 20:30:30.273046
2308	154	334	97	2025-06-23 20:26:48.860076
2309	154	334	109	2025-06-23 21:22:54.977575
2310	154	334	104	2025-06-23 22:53:08.876573
2311	155	307	91	2025-06-23 22:40:16.739133
2312	155	307	100	2025-06-23 21:24:31.717543
2313	155	307	111	2025-06-23 22:44:10.275599
2314	155	356	111	2025-06-23 22:37:24.973799
2315	155	356	97	2025-06-23 21:46:02.052617
2316	155	356	110	2025-06-23 20:28:48.84062
2317	155	345	98	2025-06-23 21:16:28.869963
2318	155	345	101	2025-06-23 21:55:32.657717
2319	155	345	109	2025-06-23 20:51:03.443082
2320	155	346	100	2025-06-23 21:44:55.09912
2321	155	346	116	2025-06-23 22:43:57.202522
2322	155	346	106	2025-06-23 22:16:42.947953
2323	155	333	96	2025-06-23 23:05:30.496436
2324	155	333	107	2025-06-23 21:03:11.29587
2325	155	333	105	2025-06-23 21:52:06.888007
2326	156	398	120	2025-06-23 21:17:36.89106
2327	156	398	115	2025-06-23 22:55:31.349261
2328	156	398	99	2025-06-23 23:07:42.186809
2329	156	329	104	2025-06-23 21:56:59.738705
2330	156	329	117	2025-06-23 23:10:05.630189
2331	156	329	106	2025-06-23 20:36:31.881576
2332	156	390	99	2025-06-23 21:21:23.963713
2333	156	390	92	2025-06-23 22:14:59.916147
2334	156	390	112	2025-06-23 22:21:33.833221
2335	156	303	96	2025-06-23 21:48:41.930126
2336	156	303	113	2025-06-23 23:10:12.324655
2337	156	303	119	2025-06-23 21:23:56.933185
2338	156	386	96	2025-06-23 21:20:12.250088
2339	156	386	95	2025-06-23 20:25:59.015846
2340	156	386	115	2025-06-23 21:11:15.896045
2341	157	398	96	2025-06-23 21:54:48.499803
2342	157	398	111	2025-06-23 21:08:50.942759
2343	157	398	110	2025-06-23 21:43:54.258947
2344	157	328	106	2025-06-23 20:58:21.867996
2345	157	328	110	2025-06-23 23:13:46.264577
2346	157	328	111	2025-06-23 20:38:07.116346
2347	157	378	113	2025-06-23 21:26:12.966958
2348	157	378	115	2025-06-23 21:42:34.634109
2349	157	378	96	2025-06-23 20:54:45.303208
2350	157	338	110	2025-06-23 20:25:37.632475
2351	157	338	97	2025-06-23 20:29:05.374364
2352	157	338	103	2025-06-23 20:45:52.014741
2353	157	384	101	2025-06-23 22:11:26.044576
2354	157	384	111	2025-06-23 22:43:42.820933
2355	157	384	120	2025-06-23 22:28:52.380219
2356	158	319	99	2025-06-23 22:18:02.220797
2357	158	319	104	2025-06-23 22:42:44.367078
2358	158	319	110	2025-06-23 22:40:17.052814
2359	158	318	118	2025-06-23 21:26:57.677841
2360	158	318	95	2025-06-23 21:56:18.919693
2361	158	318	99	2025-06-23 20:54:49.262443
2362	158	333	101	2025-06-23 21:08:03.601281
2363	158	333	98	2025-06-23 20:29:15.859592
2364	158	333	117	2025-06-23 22:39:13.810749
2365	158	340	96	2025-06-23 22:29:11.549779
2366	158	340	102	2025-06-23 21:49:23.919293
2367	158	340	106	2025-06-23 20:41:15.472713
2368	158	369	112	2025-06-23 22:47:42.721423
2369	158	369	120	2025-06-23 22:54:48.141554
2370	158	369	96	2025-06-23 20:38:37.234885
2371	159	338	95	2025-06-23 21:38:00.378857
2372	159	338	101	2025-06-23 21:37:53.946162
2373	159	338	100	2025-06-23 23:07:12.556613
2374	159	381	108	2025-06-23 23:08:36.37964
2375	159	381	114	2025-06-23 21:57:19.703686
2376	159	381	104	2025-06-23 21:44:22.068451
2377	159	387	104	2025-06-23 21:02:06.962954
2378	159	387	113	2025-06-23 23:14:06.160527
2379	159	387	98	2025-06-23 22:04:42.601813
2380	159	371	104	2025-06-23 20:39:39.414093
2381	159	371	115	2025-06-23 20:33:09.873584
2382	159	371	110	2025-06-23 21:18:45.869775
2383	159	388	97	2025-06-23 20:33:08.436924
2384	159	388	115	2025-06-23 21:58:39.890665
2385	159	388	103	2025-06-23 20:51:27.766759
2386	160	303	106	2025-06-23 22:09:33.774116
2387	160	303	118	2025-06-23 21:42:37.8268
2388	160	303	108	2025-06-23 21:47:04.481788
2389	160	325	92	2025-06-23 22:32:19.650671
2390	160	325	104	2025-06-23 22:14:43.976594
2391	160	325	119	2025-06-23 22:21:13.196136
2392	160	320	105	2025-06-23 21:24:21.494431
2393	160	320	112	2025-06-23 23:09:13.480107
2394	160	320	109	2025-06-23 20:30:14.936776
2395	160	362	119	2025-06-23 21:47:50.52574
2396	160	362	103	2025-06-23 21:27:25.110646
2397	160	362	95	2025-06-23 21:42:31.427652
2398	160	400	102	2025-06-23 22:05:20.799741
2399	160	400	95	2025-06-23 20:25:24.747287
2400	160	400	96	2025-06-23 23:18:21.24656
2401	161	340	99	2025-06-23 22:25:58.531376
2402	161	340	114	2025-06-23 21:54:03.99974
2403	161	340	118	2025-06-23 23:06:18.73473
2404	161	316	110	2025-06-23 23:07:30.492473
2405	161	316	117	2025-06-23 20:55:39.950401
2406	161	316	106	2025-06-23 20:25:56.149312
2407	161	354	111	2025-06-23 21:31:57.816349
2408	161	354	102	2025-06-23 22:30:31.876523
2409	161	354	115	2025-06-23 21:51:56.976722
2410	161	360	102	2025-06-23 20:33:20.179375
2411	161	360	100	2025-06-23 22:43:06.999718
2412	161	360	96	2025-06-23 22:47:06.073812
2413	161	370	105	2025-06-23 21:35:54.701611
2414	161	370	106	2025-06-23 22:59:51.724804
2415	161	370	119	2025-06-23 22:05:09.297202
2416	162	347	92	2025-06-23 23:15:31.993001
2417	162	347	109	2025-06-23 23:21:29.062324
2418	162	347	107	2025-06-23 22:10:08.012508
2419	162	356	112	2025-06-23 21:49:41.834329
2420	162	356	117	2025-06-23 22:01:29.006279
2421	162	356	107	2025-06-23 22:38:27.781
2422	162	372	105	2025-06-23 21:05:38.536813
2423	162	372	104	2025-06-23 21:01:20.686271
2424	162	372	91	2025-06-23 21:25:13.041828
2425	162	316	98	2025-06-23 22:52:44.803573
2426	162	316	102	2025-06-23 20:35:58.431593
2427	162	316	114	2025-06-23 21:13:03.255661
2428	162	377	109	2025-06-23 23:16:04.780569
2429	162	377	115	2025-06-23 21:16:23.561588
2430	162	377	110	2025-06-23 22:25:55.949499
2431	163	363	114	2025-06-23 22:16:18.820387
2432	163	363	105	2025-06-23 21:51:29.683749
2433	163	363	95	2025-06-23 23:01:41.67668
2434	163	355	99	2025-06-23 21:25:36.901596
2435	163	355	115	2025-06-23 22:14:05.562249
2436	163	355	111	2025-06-23 21:26:41.265853
2437	163	332	93	2025-06-23 22:42:10.277052
2438	163	332	97	2025-06-23 21:35:38.740978
2439	163	332	100	2025-06-23 21:05:00.850292
2440	163	306	112	2025-06-23 22:48:17.864186
2441	163	306	95	2025-06-23 21:27:18.402961
2442	163	306	110	2025-06-23 20:24:55.126014
2443	163	318	95	2025-06-23 22:58:58.889901
2444	163	318	92	2025-06-23 22:37:52.843275
2445	163	318	104	2025-06-23 21:55:00.946476
2446	164	309	93	2025-06-23 20:44:42.016527
2447	164	309	92	2025-06-23 21:58:38.606199
2448	164	309	101	2025-06-23 23:01:35.396304
2449	164	310	110	2025-06-23 20:34:04.238494
2450	164	310	120	2025-06-23 22:36:45.038751
2451	164	310	108	2025-06-23 22:24:45.40057
2452	164	375	114	2025-06-23 22:28:06.582496
2453	164	375	117	2025-06-23 21:23:57.272193
2454	164	375	115	2025-06-23 20:29:13.746157
2455	164	349	115	2025-06-23 21:02:30.789708
2456	164	349	118	2025-06-23 21:11:23.717653
2457	164	349	109	2025-06-23 23:14:52.219004
2458	164	365	96	2025-06-23 20:54:00.549376
2459	164	365	93	2025-06-23 22:26:43.802701
2460	164	365	107	2025-06-23 21:22:39.364055
2461	165	326	113	2025-06-23 21:15:04.20105
2462	165	326	94	2025-06-23 22:16:52.008402
2463	165	326	120	2025-06-23 21:36:44.753633
2464	165	356	99	2025-06-23 22:50:26.803358
2465	165	356	116	2025-06-23 22:48:57.713361
2466	165	356	100	2025-06-23 21:42:01.590141
2467	165	316	95	2025-06-23 20:24:33.744636
2468	165	316	101	2025-06-23 22:02:48.849807
2469	165	316	108	2025-06-23 21:13:18.17033
2470	165	327	105	2025-06-23 20:39:06.089333
2471	165	327	100	2025-06-23 22:54:12.176088
2472	165	327	95	2025-06-23 21:43:41.414925
2473	165	381	94	2025-06-23 21:04:09.286294
2474	165	381	91	2025-06-23 20:28:16.046398
2475	165	381	120	2025-06-23 21:29:47.850883
2476	166	373	110	2025-06-23 22:00:28.837347
2477	166	373	98	2025-06-23 22:47:30.594305
2478	166	373	91	2025-06-23 23:11:57.036123
2479	166	336	103	2025-06-23 21:21:30.183385
2480	166	336	111	2025-06-23 20:39:16.891552
2481	166	336	109	2025-06-23 22:43:11.315569
2482	166	399	104	2025-06-23 22:44:29.572068
2483	166	399	119	2025-06-23 20:57:42.686513
2484	166	399	95	2025-06-23 23:13:46.337104
2485	166	327	110	2025-06-23 20:34:33.295625
2486	166	327	118	2025-06-23 21:53:05.799628
2487	166	327	111	2025-06-23 22:08:17.957737
2488	166	390	91	2025-06-23 23:09:35.089314
2489	166	390	117	2025-06-23 22:03:55.2674
2490	166	390	92	2025-06-23 21:53:19.879358
2491	167	386	102	2025-06-23 23:09:05.295034
2492	167	386	101	2025-06-23 20:28:07.657556
2493	167	386	115	2025-06-23 21:37:05.916284
2494	167	360	93	2025-06-23 22:33:51.711793
2495	167	360	103	2025-06-23 22:59:07.719808
2496	167	360	95	2025-06-23 21:07:25.285367
2497	167	303	114	2025-06-23 22:13:20.197687
2498	167	303	117	2025-06-23 22:37:51.663615
2499	167	303	98	2025-06-23 22:56:16.859714
2500	167	349	97	2025-06-23 21:58:02.379133
2501	167	349	120	2025-06-23 20:42:02.268333
2502	167	349	105	2025-06-23 20:56:42.661375
2503	167	367	94	2025-06-23 22:32:45.001704
2504	167	367	117	2025-06-23 22:14:34.857589
2505	167	367	112	2025-06-23 21:47:53.858897
2506	168	305	94	2025-06-23 22:55:54.179769
2507	168	305	111	2025-06-23 22:35:59.75479
2508	168	305	105	2025-06-23 23:15:28.933289
2509	168	334	109	2025-06-23 21:42:50.885311
2510	168	334	94	2025-06-23 22:19:35.593176
2511	168	334	103	2025-06-23 22:45:46.798673
2512	168	344	109	2025-06-23 21:15:00.929641
2513	168	344	116	2025-06-23 22:36:40.629558
2514	168	344	105	2025-06-23 23:16:42.289004
2515	168	363	94	2025-06-23 22:01:30.161696
2516	168	363	112	2025-06-23 21:27:54.264956
2517	168	363	108	2025-06-23 22:41:36.833648
2518	168	342	114	2025-06-23 20:36:56.213329
2519	168	342	105	2025-06-23 20:46:08.63973
2520	168	342	104	2025-06-23 21:22:52.18595
2521	169	362	112	2025-06-23 22:08:20.500953
2522	169	362	93	2025-06-23 22:18:27.112443
2523	169	362	103	2025-06-23 21:10:32.093375
2524	169	303	112	2025-06-23 21:48:51.345765
2525	169	303	111	2025-06-23 20:34:06.604666
2526	169	303	114	2025-06-23 21:22:07.691473
2527	169	332	97	2025-06-23 21:01:04.583996
2528	169	332	103	2025-06-23 21:19:36.389567
2529	169	332	112	2025-06-23 22:34:54.592446
2530	169	339	103	2025-06-23 20:42:08.760054
2531	169	339	106	2025-06-23 21:27:19.818936
2532	169	339	113	2025-06-23 22:58:24.169905
2533	169	370	92	2025-06-23 22:03:29.067774
2534	169	370	109	2025-06-23 22:41:16.165344
2535	169	370	114	2025-06-23 22:31:33.390813
2536	170	364	97	2025-06-23 21:53:34.262288
2537	170	364	101	2025-06-23 22:29:54.603953
2538	170	364	107	2025-06-23 22:39:50.830426
2539	170	367	118	2025-06-23 22:13:07.895586
2540	170	367	115	2025-06-23 21:18:20.215475
2541	170	367	92	2025-06-23 21:37:19.904304
2542	170	361	96	2025-06-23 22:18:03.502029
2543	170	361	111	2025-06-23 21:54:24.602296
2544	170	361	97	2025-06-23 20:56:46.336076
2545	170	346	107	2025-06-23 21:06:04.950535
2546	170	346	115	2025-06-23 23:01:44.681088
2547	170	346	112	2025-06-23 22:53:55.145952
2548	170	390	102	2025-06-23 20:34:19.646276
2549	170	390	103	2025-06-23 20:34:31.973463
2550	170	390	97	2025-06-23 23:11:29.447123
2551	171	386	107	2025-06-23 23:00:30.434025
2552	171	386	120	2025-06-23 22:19:49.952827
2553	171	386	119	2025-06-23 23:18:48.792883
2554	171	384	107	2025-06-23 22:49:34.669021
2555	171	384	105	2025-06-23 23:07:35.097947
2556	171	384	94	2025-06-23 21:13:37.959243
2557	171	372	107	2025-06-23 20:40:34.159189
2558	171	372	120	2025-06-23 21:49:20.428271
2559	171	372	94	2025-06-23 20:45:20.388604
2560	171	304	112	2025-06-23 22:49:30.254541
2561	171	304	106	2025-06-23 23:06:55.151472
2562	171	304	100	2025-06-23 22:11:49.395157
2563	171	366	111	2025-06-23 22:41:48.720837
2564	171	366	105	2025-06-23 21:28:17.569741
2565	171	366	96	2025-06-23 22:45:32.374853
2566	172	302	92	2025-06-23 21:16:30.357089
2567	172	302	105	2025-06-23 21:53:01.586831
2568	172	302	118	2025-06-23 21:26:17.577115
2569	172	377	98	2025-06-23 21:24:06.208134
2570	172	377	100	2025-06-23 21:01:03.400366
2571	172	377	110	2025-06-23 22:01:21.620424
2572	172	310	102	2025-06-23 20:39:57.246662
2573	172	310	114	2025-06-23 22:01:51.23608
2574	172	310	103	2025-06-23 22:50:22.995685
2575	172	316	117	2025-06-23 20:54:54.089807
2576	172	316	100	2025-06-23 23:10:30.218763
2577	172	316	108	2025-06-23 20:24:20.871859
2578	172	381	116	2025-06-23 21:54:02.992867
2579	172	381	120	2025-06-23 22:13:16.631342
2580	172	381	119	2025-06-23 20:29:01.610571
2581	173	337	106	2025-06-23 21:51:29.771598
2582	173	337	100	2025-06-23 21:07:52.817208
2583	173	337	112	2025-06-23 23:14:56.878227
2584	173	314	120	2025-06-23 22:25:06.238101
2585	173	314	108	2025-06-23 21:39:39.100102
2586	173	314	109	2025-06-23 23:18:05.136813
2587	173	341	120	2025-06-23 22:43:03.82801
2588	173	341	115	2025-06-23 22:53:18.906495
2589	173	341	116	2025-06-23 23:04:55.541765
2590	173	301	107	2025-06-23 22:33:40.397351
2591	173	301	105	2025-06-23 21:20:14.510535
2592	173	301	109	2025-06-23 20:38:12.157041
2593	173	323	93	2025-06-23 22:14:12.317501
2594	173	323	92	2025-06-23 22:42:26.541655
2595	173	323	103	2025-06-23 22:47:38.039264
2596	174	334	105	2025-06-23 22:02:38.102935
2597	174	334	107	2025-06-23 22:08:22.19045
2598	174	334	103	2025-06-23 22:25:59.552602
2599	174	340	96	2025-06-23 21:09:10.236969
2600	174	340	110	2025-06-23 22:54:14.599762
2601	174	340	106	2025-06-23 21:07:46.771368
2602	174	367	114	2025-06-23 20:39:19.381207
2603	174	367	100	2025-06-23 21:07:59.737586
2604	174	367	96	2025-06-23 20:59:19.59473
2605	174	337	120	2025-06-23 22:12:00.309972
2606	174	337	102	2025-06-23 23:10:28.514375
2607	174	337	99	2025-06-23 21:42:33.023419
2608	174	393	112	2025-06-23 23:03:19.40646
2609	174	393	100	2025-06-23 21:28:28.860757
2610	174	393	94	2025-06-23 21:56:19.32071
2611	175	372	98	2025-06-23 20:26:49.641484
2612	175	372	113	2025-06-23 21:54:03.961855
2613	175	372	91	2025-06-23 22:39:13.658956
2614	175	394	96	2025-06-23 20:42:20.020642
2615	175	394	108	2025-06-23 22:35:18.981404
2616	175	394	117	2025-06-23 21:55:33.870151
2617	175	311	96	2025-06-23 21:16:44.130651
2618	175	311	110	2025-06-23 21:11:50.650762
2619	175	311	102	2025-06-23 20:55:38.202358
2620	175	371	101	2025-06-23 23:02:53.094886
2621	175	371	118	2025-06-23 21:41:35.043834
2622	175	371	120	2025-06-23 21:52:55.623503
2623	175	386	98	2025-06-23 22:33:19.455572
2624	175	386	96	2025-06-23 22:49:51.941043
2625	175	386	95	2025-06-23 22:24:37.731697
2626	176	305	112	2025-06-23 22:09:32.873603
2627	176	305	102	2025-06-23 21:07:43.891667
2628	176	305	113	2025-06-23 21:12:41.984455
2629	176	393	120	2025-06-23 20:49:07.965582
2630	176	393	106	2025-06-23 22:41:55.265153
2631	176	393	92	2025-06-23 21:59:30.774345
2632	176	323	103	2025-06-23 21:46:37.903219
2633	176	323	116	2025-06-23 21:48:08.538754
2634	176	323	92	2025-06-23 20:29:15.825522
2635	176	386	99	2025-06-23 23:22:13.115208
2636	176	386	113	2025-06-23 23:14:49.472548
2637	176	386	97	2025-06-23 23:15:52.539825
2638	176	311	119	2025-06-23 21:07:23.130265
2639	176	311	106	2025-06-23 21:39:07.893552
2640	176	311	104	2025-06-23 22:55:24.502359
2641	177	332	97	2025-06-23 22:24:22.649826
2642	177	332	116	2025-06-23 22:03:27.38123
2643	177	332	105	2025-06-23 21:53:51.776415
2644	177	328	99	2025-06-23 20:43:45.50035
2645	177	328	107	2025-06-23 21:52:14.481091
2646	177	328	110	2025-06-23 23:12:44.19528
2647	177	312	103	2025-06-23 21:10:56.222408
2648	177	312	110	2025-06-23 21:23:24.751693
2649	177	312	93	2025-06-23 21:05:26.065432
2650	177	302	112	2025-06-23 21:52:29.293102
2651	177	302	91	2025-06-23 22:24:28.593405
2652	177	302	101	2025-06-23 22:32:49.181031
2653	177	381	115	2025-06-23 21:00:59.385207
2654	177	381	104	2025-06-23 21:04:26.529108
2655	177	381	99	2025-06-23 21:42:22.348594
2656	178	352	100	2025-06-23 22:03:02.272639
2657	178	352	96	2025-06-23 23:14:22.157663
2658	178	352	101	2025-06-23 23:17:29.403787
2659	178	344	112	2025-06-23 20:48:37.341442
2660	178	344	92	2025-06-23 21:54:56.086528
2661	178	344	97	2025-06-23 21:11:01.869879
2662	178	327	116	2025-06-23 20:24:34.534483
2663	178	327	95	2025-06-23 21:58:22.334395
2664	178	327	118	2025-06-23 22:42:29.854844
2665	178	307	120	2025-06-23 22:34:19.471119
2666	178	307	94	2025-06-23 22:09:31.999793
2667	178	307	115	2025-06-23 20:24:36.146787
2668	178	385	94	2025-06-23 20:28:34.716044
2669	178	385	117	2025-06-23 21:58:20.978715
2670	178	385	110	2025-06-23 21:01:21.201254
2671	179	341	115	2025-06-23 21:31:37.849476
2672	179	341	102	2025-06-23 21:44:15.759319
2673	179	341	117	2025-06-23 23:03:46.972398
2674	179	336	109	2025-06-23 22:52:16.572824
2675	179	336	115	2025-06-23 21:08:27.170835
2676	179	336	103	2025-06-23 22:50:32.433258
2677	179	355	104	2025-06-23 20:37:20.401856
2678	179	355	119	2025-06-23 21:49:06.493513
2679	179	355	116	2025-06-23 22:07:51.984816
2680	179	324	113	2025-06-23 21:12:36.220522
2681	179	324	117	2025-06-23 23:22:39.643732
2682	179	324	94	2025-06-23 21:25:03.837912
2683	179	321	118	2025-06-23 22:03:19.976217
2684	179	321	98	2025-06-23 21:40:14.642745
2685	179	321	117	2025-06-23 22:41:42.255167
2686	180	360	110	2025-06-23 21:00:25.977135
2687	180	360	101	2025-06-23 22:37:56.349512
2688	180	360	93	2025-06-23 21:36:25.674139
2689	180	310	106	2025-06-23 22:22:39.653958
2690	180	310	103	2025-06-23 23:21:06.537915
2691	180	310	111	2025-06-23 22:39:38.179631
2692	180	327	91	2025-06-23 21:18:47.648024
2693	180	327	94	2025-06-23 21:32:48.718012
2694	180	327	108	2025-06-23 23:23:16.94896
2695	180	386	115	2025-06-23 22:46:42.760699
2696	180	386	116	2025-06-23 22:52:15.159369
2697	180	386	101	2025-06-23 21:06:41.999213
2698	180	330	100	2025-06-23 22:57:50.182371
2699	180	330	120	2025-06-23 21:11:55.96406
2700	180	330	93	2025-06-23 22:11:13.068212
2701	181	388	114	2025-06-23 21:25:56.324306
2702	181	388	109	2025-06-23 22:43:58.062693
2703	181	388	105	2025-06-23 21:14:30.535832
2704	181	349	120	2025-06-23 22:22:40.067586
2705	181	349	105	2025-06-23 22:46:49.591705
2706	181	349	91	2025-06-23 20:56:51.058317
2707	181	370	97	2025-06-23 22:03:56.743875
2708	181	370	94	2025-06-23 21:09:17.744651
2709	181	370	103	2025-06-23 22:12:20.708093
2710	181	337	120	2025-06-23 21:37:28.736675
2711	181	337	113	2025-06-23 22:34:19.440636
2712	181	337	100	2025-06-23 22:28:47.227625
2713	181	321	94	2025-06-23 21:40:51.646621
2714	181	321	111	2025-06-23 22:07:33.321802
2715	181	321	113	2025-06-23 23:07:49.521523
2716	182	311	113	2025-06-23 21:39:18.202652
2717	182	311	98	2025-06-23 20:50:44.710358
2718	182	311	111	2025-06-23 21:02:22.295495
2719	182	391	96	2025-06-23 23:18:36.570697
2720	182	391	107	2025-06-23 22:31:09.877307
2721	182	391	102	2025-06-23 21:22:30.324417
2722	182	316	92	2025-06-23 22:48:08.719613
2723	182	316	114	2025-06-23 23:20:58.827471
2724	182	316	106	2025-06-23 21:28:23.167315
2725	182	344	109	2025-06-23 22:47:42.444894
2726	182	344	103	2025-06-23 21:35:29.778514
2727	182	344	116	2025-06-23 22:39:51.743151
2728	182	303	99	2025-06-23 23:06:43.66134
2729	182	303	114	2025-06-23 22:01:54.311266
2730	182	303	116	2025-06-23 20:44:18.552951
2731	183	332	95	2025-06-23 22:18:54.67615
2732	183	332	99	2025-06-23 21:26:27.128397
2733	183	332	104	2025-06-23 20:40:31.055808
2734	183	355	118	2025-06-23 20:27:50.736937
2735	183	355	105	2025-06-23 22:31:53.097499
2736	183	355	109	2025-06-23 22:30:37.622535
2737	183	316	98	2025-06-23 21:16:02.560817
2738	183	316	101	2025-06-23 23:18:19.760113
2739	183	316	111	2025-06-23 23:17:34.24486
2740	183	375	91	2025-06-23 20:26:49.59688
2741	183	375	117	2025-06-23 21:35:08.246912
2742	183	375	119	2025-06-23 20:58:14.849881
2743	183	313	117	2025-06-23 22:37:38.666036
2744	183	313	108	2025-06-23 22:25:45.519393
2745	183	313	107	2025-06-23 20:34:17.838566
2746	184	380	117	2025-06-23 22:54:09.957195
2747	184	380	118	2025-06-23 23:04:11.018979
2748	184	380	105	2025-06-23 22:00:26.966813
2749	184	350	100	2025-06-23 22:20:16.196905
2750	184	350	106	2025-06-23 21:44:56.598034
2751	184	350	103	2025-06-23 21:56:54.625497
2752	184	323	108	2025-06-23 21:01:22.848905
2753	184	323	120	2025-06-23 21:37:39.699721
2754	184	323	116	2025-06-23 20:30:07.499281
2755	184	398	117	2025-06-23 22:09:37.461378
2756	184	398	95	2025-06-23 21:50:02.718158
2757	184	398	93	2025-06-23 21:20:07.90269
2758	184	301	95	2025-06-23 21:48:10.575907
2759	184	301	113	2025-06-23 22:29:28.89231
2760	184	301	101	2025-06-23 22:01:26.658144
2761	185	302	102	2025-06-23 21:11:10.815889
2762	185	302	118	2025-06-23 21:30:17.385592
2763	185	302	94	2025-06-23 21:59:52.838182
2764	185	319	104	2025-06-23 22:24:57.729978
2765	185	319	100	2025-06-23 21:18:32.330091
2766	185	319	98	2025-06-23 21:12:52.298299
2767	185	369	102	2025-06-23 21:25:29.233875
2768	185	369	114	2025-06-23 20:48:25.379032
2769	185	369	109	2025-06-23 23:08:27.115011
2770	185	309	98	2025-06-23 22:47:20.459462
2771	185	309	92	2025-06-23 20:28:05.61972
2772	185	309	117	2025-06-23 22:02:39.13064
2773	185	338	118	2025-06-23 22:37:08.605526
2774	185	338	96	2025-06-23 22:16:12.741146
2775	185	338	106	2025-06-23 21:56:05.617474
2776	186	324	114	2025-06-23 22:10:17.689069
2777	186	324	119	2025-06-23 22:04:44.555859
2778	186	324	104	2025-06-23 21:40:08.631779
2779	186	332	107	2025-06-23 21:02:02.140257
2780	186	332	100	2025-06-23 20:27:15.649231
2781	186	332	119	2025-06-23 22:12:50.482521
2782	186	355	119	2025-06-23 22:26:56.084142
2783	186	355	120	2025-06-23 21:37:29.511917
2784	186	355	108	2025-06-23 21:17:00.85219
2785	186	382	104	2025-06-23 20:28:53.431858
2786	186	382	115	2025-06-23 23:16:23.821765
2787	186	382	96	2025-06-23 20:38:17.953265
2788	186	336	100	2025-06-23 20:50:07.368413
2789	186	336	102	2025-06-23 22:18:21.445528
2790	186	336	113	2025-06-23 21:53:25.438397
2791	187	367	117	2025-06-23 22:40:44.502563
2792	187	367	103	2025-06-23 20:54:13.739841
2793	187	367	119	2025-06-23 22:47:50.521596
2794	187	360	98	2025-06-23 23:16:05.602429
2795	187	360	96	2025-06-23 21:56:19.907995
2796	187	360	101	2025-06-23 21:08:27.877629
2797	187	347	94	2025-06-23 21:51:28.469986
2798	187	347	103	2025-06-23 23:07:19.467649
2799	187	347	114	2025-06-23 21:02:09.821923
2800	187	332	97	2025-06-23 22:36:27.193732
2801	187	332	118	2025-06-23 22:32:17.453338
2802	187	332	98	2025-06-23 22:44:27.602213
2803	187	371	103	2025-06-23 20:24:44.868556
2804	187	371	91	2025-06-23 20:48:17.160645
2805	187	371	100	2025-06-23 21:38:31.398852
2806	188	387	104	2025-06-23 22:04:42.723711
2807	188	387	102	2025-06-23 22:42:11.140047
2808	188	387	96	2025-06-23 22:56:40.213435
2809	188	364	120	2025-06-23 22:09:54.124089
2810	188	364	96	2025-06-23 23:03:09.626433
2811	188	364	97	2025-06-23 20:50:40.504498
2812	188	353	108	2025-06-23 21:25:06.113694
2813	188	353	102	2025-06-23 22:26:58.976345
2814	188	353	107	2025-06-23 20:41:12.748756
2815	188	341	118	2025-06-23 22:15:11.590119
2816	188	341	101	2025-06-23 21:33:43.668196
2817	188	341	103	2025-06-23 22:39:20.383074
2818	188	363	102	2025-06-23 20:32:49.587605
2819	188	363	112	2025-06-23 21:38:39.911303
2820	188	363	114	2025-06-23 22:51:41.241753
2821	189	320	105	2025-06-23 21:55:51.496851
2822	189	320	97	2025-06-23 22:42:56.224796
2823	189	320	118	2025-06-23 21:09:06.395276
2824	189	324	102	2025-06-23 21:58:36.833412
2825	189	324	91	2025-06-23 21:46:04.600662
2826	189	324	114	2025-06-23 20:29:08.728449
2827	189	349	105	2025-06-23 21:25:31.90435
2828	189	349	97	2025-06-23 22:59:24.231006
2829	189	349	92	2025-06-23 22:16:09.42652
2830	189	360	92	2025-06-23 22:41:23.091012
2831	189	360	99	2025-06-23 21:00:34.509782
2832	189	360	102	2025-06-23 20:46:24.110564
2833	189	391	120	2025-06-23 23:21:02.550807
2834	189	391	103	2025-06-23 23:21:15.351716
2835	189	391	93	2025-06-23 20:55:59.966966
2836	190	366	106	2025-06-23 21:52:11.839438
2837	190	366	118	2025-06-23 20:31:18.163314
2838	190	366	95	2025-06-23 21:33:06.012374
2839	190	385	99	2025-06-23 20:59:33.219589
2840	190	385	105	2025-06-23 22:24:40.340341
2841	190	385	110	2025-06-23 21:56:00.140746
2842	190	301	106	2025-06-23 20:31:19.364277
2843	190	301	102	2025-06-23 20:36:33.904456
2844	190	301	93	2025-06-23 22:50:28.338328
2845	190	382	104	2025-06-23 21:06:36.430305
2846	190	382	108	2025-06-23 21:13:13.398428
2847	190	382	97	2025-06-23 22:55:05.309739
2848	190	336	98	2025-06-23 20:45:48.160099
2849	190	336	115	2025-06-23 23:01:56.298748
2850	190	336	114	2025-06-23 20:33:49.353384
2851	191	336	108	2025-06-23 21:11:33.307374
2852	191	336	119	2025-06-23 20:24:34.126227
2853	191	336	97	2025-06-23 22:04:09.452461
2854	191	316	104	2025-06-23 22:53:02.007467
2855	191	316	100	2025-06-23 23:03:14.103235
2856	191	316	107	2025-06-23 22:14:15.877848
2857	191	360	101	2025-06-23 22:56:06.556928
2858	191	360	102	2025-06-23 22:53:49.294422
2859	191	360	98	2025-06-23 21:48:13.681948
2860	191	329	97	2025-06-23 21:27:07.930821
2861	191	329	117	2025-06-23 22:25:07.729427
2862	191	329	118	2025-06-23 22:21:45.560285
2863	191	363	100	2025-06-23 22:35:46.99839
2864	191	363	104	2025-06-23 21:46:45.759052
2865	191	363	116	2025-06-23 23:01:23.898159
2866	192	342	99	2025-06-23 20:38:51.093548
2867	192	342	118	2025-06-23 22:56:43.452055
2868	192	342	92	2025-06-23 20:56:21.825559
2869	192	356	106	2025-06-23 20:27:47.353382
2870	192	356	93	2025-06-23 21:38:52.079995
2871	192	356	115	2025-06-23 21:17:50.944969
2872	192	331	110	2025-06-23 21:03:11.596194
2873	192	331	112	2025-06-23 21:57:34.448339
2874	192	331	95	2025-06-23 21:36:52.650527
2875	192	375	94	2025-06-23 22:47:23.752253
2876	192	375	103	2025-06-23 23:18:30.963145
2877	192	375	105	2025-06-23 22:52:34.731177
2878	192	338	99	2025-06-23 21:01:15.15135
2879	192	338	107	2025-06-23 20:32:45.821704
2880	192	338	115	2025-06-23 21:16:07.60735
2881	193	305	98	2025-06-23 21:51:09.686602
2882	193	305	112	2025-06-23 21:31:09.771879
2883	193	305	115	2025-06-23 21:11:52.76675
2884	193	382	102	2025-06-23 22:16:24.941894
2885	193	382	105	2025-06-23 22:05:41.955074
2886	193	382	113	2025-06-23 22:35:26.998012
2887	193	375	98	2025-06-23 20:41:30.436613
2888	193	375	95	2025-06-23 22:40:51.569335
2889	193	375	108	2025-06-23 22:45:33.926852
2890	193	318	93	2025-06-23 21:10:42.793963
2891	193	318	107	2025-06-23 20:47:15.84805
2892	193	318	108	2025-06-23 21:27:07.914666
2893	193	358	108	2025-06-23 22:10:38.110296
2894	193	358	96	2025-06-23 23:18:15.54066
2895	193	358	107	2025-06-23 21:10:05.072426
2896	194	358	119	2025-06-23 20:41:07.181176
2897	194	358	94	2025-06-23 22:47:09.414911
2898	194	358	95	2025-06-23 21:12:52.672448
2899	194	350	92	2025-06-23 21:24:12.271774
2900	194	350	115	2025-06-23 21:00:58.883499
2901	194	350	112	2025-06-23 22:59:03.66966
2902	194	361	91	2025-06-23 22:46:53.341636
2903	194	361	93	2025-06-23 22:14:50.901172
2904	194	361	103	2025-06-23 22:26:29.566697
2905	194	346	116	2025-06-23 22:38:46.257163
2906	194	346	111	2025-06-23 21:48:36.280883
2907	194	346	114	2025-06-23 20:49:12.508115
2908	194	338	103	2025-06-23 21:45:34.423707
2909	194	338	108	2025-06-23 20:30:47.574185
2910	194	338	106	2025-06-23 21:57:37.260789
2911	195	302	102	2025-06-23 20:48:12.822291
2912	195	302	100	2025-06-23 21:17:30.99436
2913	195	302	99	2025-06-23 22:38:51.192826
2914	195	395	112	2025-06-23 21:01:36.566152
2915	195	395	108	2025-06-23 22:16:55.553529
2916	195	395	95	2025-06-23 22:53:35.638677
2917	195	324	95	2025-06-23 22:10:17.939804
2918	195	324	91	2025-06-23 22:59:29.518477
2919	195	324	105	2025-06-23 22:20:55.17021
2920	195	316	118	2025-06-23 21:34:36.264944
2921	195	316	104	2025-06-23 23:20:32.700851
2922	195	316	111	2025-06-23 21:55:25.125758
2923	195	343	112	2025-06-23 21:09:42.61127
2924	195	343	93	2025-06-23 20:34:02.636664
2925	195	343	95	2025-06-23 22:09:19.364589
2926	196	394	103	2025-06-23 23:22:28.636383
2927	196	394	94	2025-06-23 20:54:58.047146
2928	196	394	92	2025-06-23 20:29:43.740983
2929	196	383	112	2025-06-23 20:34:12.936967
2930	196	383	105	2025-06-23 20:32:26.267222
2931	196	383	95	2025-06-23 22:18:09.551426
2932	196	357	102	2025-06-23 23:13:10.335458
2933	196	357	97	2025-06-23 21:47:35.167114
2934	196	357	99	2025-06-23 22:33:28.290097
2935	196	398	115	2025-06-23 21:45:20.502701
2936	196	398	109	2025-06-23 21:30:24.843704
2937	196	398	98	2025-06-23 20:59:46.78799
2938	196	343	108	2025-06-23 22:58:49.042973
2939	196	343	110	2025-06-23 20:38:33.613363
2940	196	343	119	2025-06-23 20:37:51.697917
2941	197	338	98	2025-06-23 22:47:18.578907
2942	197	338	111	2025-06-23 21:55:24.346847
2943	197	338	91	2025-06-23 21:04:11.603815
2944	197	335	107	2025-06-23 20:34:47.441492
2945	197	335	100	2025-06-23 20:28:31.282173
2946	197	335	106	2025-06-23 23:06:19.959674
2947	197	357	96	2025-06-23 20:52:17.529402
2948	197	357	114	2025-06-23 21:01:23.083584
2949	197	357	105	2025-06-23 20:27:24.813468
2950	197	360	107	2025-06-23 21:46:50.059346
2951	197	360	113	2025-06-23 22:41:14.725657
2952	197	360	106	2025-06-23 21:40:24.53559
2953	197	330	93	2025-06-23 21:10:48.879324
2954	197	330	101	2025-06-23 20:38:08.569457
2955	197	330	113	2025-06-23 22:02:36.347743
2956	198	309	102	2025-06-23 22:47:10.436368
2957	198	309	114	2025-06-23 22:06:35.382109
2958	198	309	105	2025-06-23 21:51:39.714292
2959	198	340	109	2025-06-23 20:34:49.865772
2960	198	340	114	2025-06-23 22:44:40.170449
2961	198	340	93	2025-06-23 21:11:53.985024
2962	198	341	100	2025-06-23 22:50:30.932864
2963	198	341	99	2025-06-23 20:41:42.616515
2964	198	341	101	2025-06-23 22:31:15.414494
2965	198	337	104	2025-06-23 21:53:58.081503
2966	198	337	118	2025-06-23 22:54:18.148387
2967	198	337	108	2025-06-23 21:41:21.105134
2968	198	327	98	2025-06-23 22:35:35.153342
2969	198	327	105	2025-06-23 22:34:37.964339
2970	198	327	95	2025-06-23 23:16:32.811048
2971	199	348	92	2025-06-23 20:34:11.38387
2972	199	348	109	2025-06-23 21:35:56.284493
2973	199	348	115	2025-06-23 21:55:38.081842
2974	199	336	100	2025-06-23 22:44:13.870335
2975	199	336	102	2025-06-23 20:35:56.047946
2976	199	336	95	2025-06-23 21:08:58.161534
2977	199	324	107	2025-06-23 21:58:11.767755
2978	199	324	93	2025-06-23 21:09:08.117493
2979	199	324	97	2025-06-23 20:50:00.837151
2980	199	360	117	2025-06-23 21:06:38.616769
2981	199	360	114	2025-06-23 21:39:43.796555
2982	199	360	96	2025-06-23 20:30:52.785801
2983	199	309	92	2025-06-23 21:26:16.656487
2984	199	309	99	2025-06-23 22:17:56.680717
2985	199	309	93	2025-06-23 20:34:28.16924
2986	200	374	97	2025-06-23 20:27:02.391045
2987	200	374	109	2025-06-23 22:29:16.607906
2988	200	374	106	2025-06-23 21:46:17.123016
2989	200	390	100	2025-06-23 20:48:00.52678
2990	200	390	102	2025-06-23 22:05:06.194226
2991	200	390	94	2025-06-23 21:39:21.462444
2992	200	358	106	2025-06-23 21:11:44.192215
2993	200	358	113	2025-06-23 23:22:24.944299
2994	200	358	104	2025-06-23 21:14:02.103031
2995	200	333	110	2025-06-23 23:14:58.769716
2996	200	333	92	2025-06-23 22:39:42.738499
2997	200	333	118	2025-06-23 20:48:45.777308
2998	200	318	105	2025-06-23 20:50:20.220929
2999	200	318	91	2025-06-23 20:55:17.213943
3000	200	318	117	2025-06-23 22:13:20.315449
\.


--
-- Data for Name: match_player_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match_player_stats (stat_id, match_id, profile_id, kills, deaths, assists, gpm, xpm, dmg_physical, dmg_magical, dmg_pure, healing) FROM stdin;
1501	151	400	8	13	0	502	657	1531	3224	3144	155
1502	151	315	10	3	19	257	409	2490	2419	3098	337
1503	151	352	18	14	12	295	285	3822	4561	9211	49
1504	151	303	11	12	18	484	589	1651	3355	4018	411
1505	151	398	1	13	5	557	777	4453	2127	8139	457
1506	151	316	11	14	22	659	771	1085	4966	4387	452
1507	151	396	17	15	24	464	411	2608	2609	9812	10
1508	151	312	13	2	8	772	377	4883	3312	5010	5
1509	151	304	10	5	16	233	293	1335	1784	4026	116
1510	151	397	4	0	23	627	290	2560	3094	5682	41
1511	152	319	12	1	2	399	384	3800	2581	8019	30
1512	152	397	13	5	25	397	684	2470	3348	6048	170
1513	152	364	15	2	11	559	454	3718	3814	6122	338
1514	152	343	6	8	20	565	368	3746	4367	5762	209
1515	152	354	11	5	15	306	578	2476	1225	6238	13
1516	152	314	5	20	25	686	730	1935	3238	7101	112
1517	152	360	15	6	2	547	592	1130	3670	8166	145
1518	152	302	3	14	15	573	717	4888	3774	9400	312
1519	152	382	6	12	28	214	366	2912	4040	9267	237
1520	152	348	18	14	13	240	577	4343	3617	1808	486
1521	153	379	4	15	3	375	409	3841	4716	1994	345
1522	153	318	2	10	7	260	520	2114	3311	7971	459
1523	153	334	11	3	17	227	506	4416	2764	8289	134
1524	153	380	13	6	29	766	531	4880	1479	7871	316
1525	153	323	8	15	16	777	502	3155	3824	7645	491
1526	153	393	2	17	15	325	719	4418	3321	5857	455
1527	153	351	7	16	29	545	340	3368	2096	1761	114
1528	153	330	19	11	27	582	566	4855	3694	8135	356
1529	153	319	2	18	17	786	720	4447	4459	2804	360
1530	153	376	8	2	28	447	490	4979	1754	7070	442
1531	154	304	5	1	10	248	546	2367	3859	3041	136
1532	154	325	14	3	29	599	320	3785	2108	7148	418
1533	154	308	12	15	15	579	217	3797	3736	3722	321
1534	154	315	9	0	29	365	646	2714	4007	4154	310
1535	154	329	7	8	8	547	637	2858	2793	2588	219
1536	154	328	9	5	5	772	254	4121	1125	2040	424
1537	154	358	3	4	21	489	333	4083	2210	8986	119
1538	154	395	7	11	29	203	339	1498	2867	7131	394
1539	154	362	1	5	2	344	463	4097	3869	5242	296
1540	154	387	7	1	2	618	563	4211	4914	6229	217
1541	155	384	16	5	29	253	576	2447	2728	8381	405
1542	155	338	0	11	14	225	212	2473	1438	3261	131
1543	155	385	0	4	14	248	401	3964	3819	2620	169
1544	155	323	16	6	11	207	280	4533	3569	1015	303
1545	155	381	10	19	19	508	567	2553	4604	2895	203
1546	155	366	5	0	1	346	285	3702	1873	5381	449
1547	155	341	20	5	10	725	487	4315	4921	2150	214
1548	155	340	10	1	16	261	329	3376	1170	5955	456
1549	155	389	8	4	5	777	655	3733	4156	8026	106
1550	155	329	14	16	28	674	256	4408	4633	3100	256
1551	156	400	4	2	24	680	674	1607	4317	6487	307
1552	156	309	20	14	29	786	741	1928	4047	8189	56
1553	156	392	17	13	1	294	370	1831	1153	3071	279
1554	156	354	4	0	21	277	761	3014	4380	1112	179
1555	156	310	20	14	19	222	385	2559	2647	5166	131
1556	156	315	10	2	5	451	398	2417	2039	9709	130
1557	156	381	6	0	27	346	727	4018	2781	4447	321
1558	156	393	20	10	0	542	701	1536	3211	9235	13
1559	156	343	16	12	8	677	709	1010	3889	8587	261
1560	156	308	1	12	2	540	313	4869	3247	4679	330
1561	157	307	2	6	7	296	474	2309	3019	7491	242
1562	157	371	16	11	16	718	792	3597	2721	3937	361
1563	157	312	13	1	26	675	447	1766	2560	9338	274
1564	157	353	17	10	26	375	524	4735	1204	6196	139
1565	157	384	15	3	6	361	537	3578	4060	8495	158
1566	157	395	20	16	22	692	315	3431	3301	9179	19
1567	157	391	7	3	22	586	280	3225	1020	8920	476
1568	157	324	0	14	2	516	313	1986	2383	4104	107
1569	157	322	16	10	24	278	386	2860	2969	6099	245
1570	157	340	8	2	29	479	736	3690	4057	1861	55
1571	158	359	5	5	20	208	610	3128	1208	8593	317
1572	158	312	11	4	14	472	779	4847	2522	8103	414
1573	158	358	16	11	20	531	422	4652	2149	3431	415
1574	158	377	18	3	23	551	256	4371	2743	4121	156
1575	158	375	1	6	27	214	800	2760	4062	7208	117
1576	158	318	11	7	10	302	593	3837	2933	6637	353
1577	158	378	13	19	29	355	456	2811	4969	8685	446
1578	158	316	13	17	27	397	774	4262	1918	2267	191
1579	158	311	10	9	29	581	311	3249	1081	7912	496
1580	158	329	18	5	19	464	742	1493	3152	7614	400
1581	159	394	9	14	1	757	474	3717	4227	1879	326
1582	159	334	12	14	19	478	744	4806	1629	1435	36
1583	159	316	12	20	21	594	652	2831	3277	7234	407
1584	159	337	2	12	30	719	785	4606	2435	4824	482
1585	159	347	12	9	18	494	356	2128	1480	7369	106
1586	159	335	0	0	11	488	565	4988	4187	2468	140
1587	159	312	20	15	30	421	504	3865	1956	4851	312
1588	159	382	3	4	11	492	297	3763	4534	4755	262
1589	159	344	18	6	4	560	643	1251	2903	8217	195
1590	159	336	17	15	7	741	662	2147	1104	7274	46
1591	160	385	7	12	17	697	720	2310	2943	6347	224
1592	160	339	5	0	30	590	505	3324	1562	6328	167
1593	160	325	10	15	9	588	395	4755	4946	6861	494
1594	160	349	8	14	1	777	302	4235	2370	1939	253
1595	160	333	11	12	12	545	361	4138	3793	4677	385
1596	160	337	4	8	20	739	695	1210	4574	8305	162
1597	160	318	20	16	23	351	692	4189	3455	4171	327
1598	160	356	17	18	16	221	326	3735	2613	4773	284
1599	160	352	5	20	5	386	646	3751	3290	9664	421
1600	160	400	11	5	10	681	248	4552	4035	9822	89
1601	161	335	12	9	30	349	664	4195	3051	5270	279
1602	161	395	5	2	19	235	267	4429	2216	1071	396
1603	161	324	7	3	2	230	657	1431	2063	7699	125
1604	161	329	16	8	3	361	787	1848	2168	7530	84
1605	161	318	17	13	13	534	218	2234	1778	5717	275
1606	161	384	14	4	16	783	674	3370	4441	2553	86
1607	161	361	19	9	23	675	372	4812	1790	4946	15
1608	161	376	7	19	30	589	759	3686	3529	2385	364
1609	161	397	16	20	1	466	442	4575	3003	2942	84
1610	161	381	4	18	18	724	646	3732	4422	5842	110
1611	162	400	10	19	19	481	365	4270	2184	1097	285
1612	162	376	18	14	9	570	732	4802	3040	3884	333
1613	162	377	8	0	12	543	418	4802	2283	5123	82
1614	162	329	19	9	13	800	392	3291	2374	7488	384
1615	162	374	16	12	15	697	462	4472	4507	6064	164
1616	162	330	18	4	30	289	704	4933	3895	5802	434
1617	162	347	16	9	2	769	502	1389	4957	4790	289
1618	162	312	19	19	20	388	740	2844	2438	7563	14
1619	162	383	3	1	18	394	781	1733	1729	8184	327
1620	162	361	3	16	30	758	695	3659	1957	4736	283
1621	163	364	14	17	4	385	245	2394	3036	4396	280
1622	163	332	12	7	13	291	796	2164	1365	3525	400
1623	163	383	4	17	0	550	322	2322	3351	6698	329
1624	163	310	20	10	6	238	750	1981	4354	2127	270
1625	163	368	20	5	19	796	233	3869	4771	7274	416
1626	163	304	13	19	17	791	675	1891	2534	9897	62
1627	163	389	4	15	16	785	756	1183	1274	8884	77
1628	163	385	18	13	23	708	234	4464	4790	7294	457
1629	163	337	12	5	20	436	679	2215	4401	1616	247
1630	163	369	2	11	22	220	249	2014	1982	4172	180
1631	164	350	11	12	13	769	358	1997	2945	7412	341
1632	164	344	0	19	30	579	628	3365	3800	5632	385
1633	164	315	19	0	26	622	550	1203	3115	3212	22
1634	164	305	5	5	14	584	337	3870	1395	3888	290
1635	164	378	13	1	12	785	522	1276	3981	2997	443
1636	164	309	17	20	12	370	378	3224	4485	3780	152
1637	164	397	0	5	25	374	467	4403	1628	2443	140
1638	164	381	2	20	5	783	716	2626	3100	8446	359
1639	164	311	19	0	17	467	640	2508	2558	5192	354
1640	164	339	9	4	26	443	679	2443	2512	5107	85
1641	165	331	0	18	16	721	710	3995	1390	7448	414
1642	165	356	15	10	11	786	655	3340	2591	8544	192
1643	165	318	6	8	1	383	280	1059	3296	6551	3
1644	165	310	0	9	28	657	755	3371	3080	9112	281
1645	165	323	19	11	12	381	218	1875	4058	4520	446
1646	165	372	3	3	29	430	725	2534	2532	1797	280
1647	165	394	17	1	8	494	665	4596	4962	4219	87
1648	165	302	2	20	29	293	298	3826	3705	1551	35
1649	165	383	20	12	21	515	642	3623	3269	2322	60
1650	165	315	14	14	7	703	562	4607	3815	9733	444
1651	166	361	20	16	28	741	603	1764	1105	8673	446
1652	166	322	6	17	25	213	217	4409	2146	6058	312
1653	166	387	12	13	21	225	360	3909	1971	9345	456
1654	166	372	4	15	25	217	251	3587	4367	4595	224
1655	166	323	15	15	19	520	474	1283	4364	9115	52
1656	166	319	14	0	14	750	640	3292	4678	2150	12
1657	166	355	16	13	26	652	601	2045	1885	7592	440
1658	166	313	14	6	21	475	580	4783	4499	5816	278
1659	166	359	0	14	7	683	200	4233	1056	3015	61
1660	166	342	9	6	27	557	428	1877	3376	4237	314
1661	167	356	14	3	3	571	249	4382	4487	6427	482
1662	167	394	13	9	11	371	729	4398	2543	4085	237
1663	167	305	16	1	25	281	738	2338	1391	6783	458
1664	167	331	15	15	4	753	366	1002	3564	4146	213
1665	167	357	17	20	1	623	792	4394	2476	5951	382
1666	167	324	18	8	0	485	242	1247	1454	8211	24
1667	167	304	7	15	2	537	417	3152	1804	5904	250
1668	167	375	1	6	7	346	688	3713	4358	1859	439
1669	167	333	10	5	1	669	457	3107	1194	3243	479
1670	167	371	4	3	13	659	660	1717	1340	7549	455
1671	168	367	1	15	5	401	762	3272	1842	2291	10
1672	168	346	13	6	4	777	275	4414	3796	3664	332
1673	168	392	0	13	10	294	565	4293	1610	5740	386
1674	168	356	12	17	4	397	685	2747	2225	5289	221
1675	168	376	18	6	26	243	245	1732	3914	4147	308
1676	168	344	11	4	7	430	558	1246	2868	4485	283
1677	168	322	19	16	2	786	554	4780	3253	6503	454
1678	168	393	6	16	8	414	621	3869	4331	9359	194
1679	168	317	17	7	27	786	742	2649	2469	7248	459
1680	168	307	14	16	16	294	587	4031	2105	3689	208
1681	169	362	20	18	9	413	456	2014	4775	3533	431
1682	169	324	10	5	8	582	439	3890	1972	3740	124
1683	169	396	8	5	11	229	229	3081	4181	2755	449
1684	169	372	6	8	29	259	436	4417	2285	5450	328
1685	169	384	5	18	4	212	775	4068	3019	1347	181
1686	169	353	3	9	21	451	293	1398	4520	7973	94
1687	169	358	19	1	27	742	354	2964	1791	4298	202
1688	169	323	5	10	1	716	442	4150	2255	8347	271
1689	169	315	4	17	11	435	415	3172	3219	1495	85
1690	169	382	7	9	12	237	591	3040	1389	6611	453
1691	170	315	17	7	27	207	547	4213	3074	6705	126
1692	170	358	14	1	17	662	537	4982	3669	9175	434
1693	170	339	16	7	8	350	794	4264	2450	9258	468
1694	170	328	17	14	1	296	302	2464	1308	6743	200
1695	170	387	15	17	29	251	779	3173	3554	7811	255
1696	170	319	12	20	30	759	718	2718	4856	1354	361
1697	170	314	20	4	20	495	655	3516	2989	7157	163
1698	170	334	4	10	9	210	294	4653	1658	2980	302
1699	170	359	4	6	9	759	625	2234	3616	8230	222
1700	170	381	15	15	0	314	417	3248	4545	6825	482
1701	171	387	13	13	24	590	505	4057	1931	1951	130
1702	171	374	16	19	9	707	648	4278	3395	7990	275
1703	171	308	13	14	23	210	673	1265	2540	6247	108
1704	171	309	11	4	10	507	483	2278	2075	7404	222
1705	171	313	17	10	17	719	488	3277	2452	3827	214
1706	171	324	11	14	9	231	441	1562	2945	4623	378
1707	171	357	10	0	23	447	592	3140	1817	3667	162
1708	171	397	15	0	5	382	800	4852	3212	9558	221
1709	171	337	19	0	1	651	616	2808	2452	4127	198
1710	171	363	10	12	4	643	245	1354	4935	8724	56
1711	172	373	14	12	22	479	255	4947	2220	2445	364
1712	172	348	10	19	4	392	447	1885	1158	8061	83
1713	172	303	20	9	21	554	363	1182	4345	6702	64
1714	172	349	4	5	9	585	717	4080	3721	2712	337
1715	172	328	13	5	16	646	278	2998	4151	1083	280
1716	172	371	8	12	30	531	320	4497	2983	4925	360
1717	172	345	18	11	14	517	240	4040	3428	3765	46
1718	172	386	2	6	0	482	311	2941	4987	5964	9
1719	172	319	12	20	5	738	343	2649	3465	8633	275
1720	172	376	8	6	3	216	422	2820	4272	5755	355
1721	173	302	14	2	16	538	361	2593	1943	8728	154
1722	173	316	19	16	10	476	208	4541	2217	1338	105
1723	173	334	17	15	12	229	770	2910	2421	4920	254
1724	173	399	7	8	29	636	518	1352	1182	1391	335
1725	173	308	8	1	24	229	368	3476	2879	6461	189
1726	173	312	15	5	28	243	455	1228	4067	5303	263
1727	173	314	10	2	19	791	741	4060	3911	5840	355
1728	173	344	16	0	25	471	629	1253	3925	7009	235
1729	173	310	5	12	9	736	674	2385	4533	9634	103
1730	173	360	11	3	23	356	768	3970	4586	7044	295
1731	174	335	20	3	10	275	722	1151	4820	9637	482
1732	174	349	1	11	1	372	509	2918	3308	6503	386
1733	174	346	9	5	4	403	441	3317	4583	8174	423
1734	174	325	8	14	26	477	691	4748	3097	9215	485
1735	174	397	5	7	30	665	466	4172	3175	9506	358
1736	174	353	18	6	10	294	398	1987	1504	9040	107
1737	174	360	9	7	2	739	789	3770	2305	3446	188
1738	174	333	8	9	0	619	749	4291	2177	8453	264
1739	174	395	15	6	1	562	272	3624	2640	8717	101
1740	174	305	13	9	27	575	294	4359	3023	3075	148
1741	175	360	15	2	3	599	619	1361	3955	3306	39
1742	175	306	16	16	0	758	644	3527	3839	5680	206
1743	175	319	11	1	19	703	267	4598	4017	1590	155
1744	175	379	14	14	6	636	280	2828	4996	7436	209
1745	175	301	5	15	11	258	319	3796	2989	7980	193
1746	175	355	4	10	14	478	222	3293	2150	1223	117
1747	175	376	18	5	24	743	469	3873	1024	9776	388
1748	175	302	19	11	9	740	498	4685	1811	3920	489
1749	175	333	5	3	7	756	692	2171	3511	1146	381
1750	175	314	7	0	22	585	641	4568	2470	6930	454
1751	176	397	18	2	23	685	539	1335	4941	2581	410
1752	176	315	15	20	21	494	541	2261	4597	1566	143
1753	176	382	16	0	0	548	559	2862	2881	2079	455
1754	176	342	7	20	3	374	743	2097	1431	4591	277
1755	176	313	9	15	14	457	633	1868	1875	1681	86
1756	176	384	6	5	24	437	371	4801	1311	8707	121
1757	176	349	1	17	23	465	739	1192	2485	3787	467
1758	176	324	10	2	15	350	508	4484	4443	9556	172
1759	176	341	6	9	23	474	390	2112	3218	3878	175
1760	176	400	5	16	6	315	494	3258	4842	8206	396
1761	177	339	19	17	26	793	794	4155	2655	5850	41
1762	177	359	11	17	6	342	767	3198	4234	5829	408
1763	177	325	8	5	14	771	766	2597	3715	5901	383
1764	177	307	12	15	15	722	316	1790	2528	9450	171
1765	177	312	13	7	22	334	222	2497	4731	9543	273
1766	177	357	3	4	19	229	314	1787	1268	2418	316
1767	177	362	8	14	20	727	551	1804	1443	6388	63
1768	177	319	7	10	16	583	688	1168	3150	4608	474
1769	177	313	6	20	26	772	482	1271	3595	4478	95
1770	177	380	18	10	11	239	510	1996	4093	8343	453
1771	178	343	15	11	7	359	236	1305	3430	3765	394
1772	178	383	11	13	30	433	737	1499	4610	4760	194
1773	178	367	17	18	20	786	736	3104	1775	8028	398
1774	178	357	1	0	25	592	673	4934	1742	1919	390
1775	178	329	3	10	26	798	526	4250	1234	7154	253
1776	178	305	17	4	24	450	260	4062	1687	6279	257
1777	178	333	11	20	24	578	612	4469	1287	8290	428
1778	178	315	15	18	27	609	624	3601	4210	5123	25
1779	178	354	16	15	17	276	549	1347	4607	2900	363
1780	178	348	17	11	12	780	287	4524	2497	7720	457
1781	179	370	16	10	22	532	329	4810	4803	1077	182
1782	179	364	3	12	21	515	493	4828	3799	8117	19
1783	179	321	0	16	28	388	618	3743	1214	3485	214
1784	179	381	2	1	26	363	377	2841	4426	1694	230
1785	179	325	18	17	20	438	774	3039	1135	2143	180
1786	179	390	15	12	11	429	616	1651	2311	4551	330
1787	179	397	1	19	21	633	363	2831	2881	6840	45
1788	179	385	18	19	18	618	257	4399	2905	1672	493
1789	179	340	17	10	12	724	388	2169	1190	5918	196
1790	179	398	16	20	15	307	561	3611	2008	1547	394
1791	180	313	8	11	27	311	531	2940	4628	2768	418
1792	180	326	0	2	3	781	566	2165	4070	5583	358
1793	180	397	8	13	19	205	396	3090	1927	4403	452
1794	180	369	16	11	18	267	296	1680	2248	2780	6
1795	180	301	16	18	13	792	465	3183	1942	3484	456
1796	180	349	10	19	19	396	512	1872	1680	7965	26
1797	180	387	3	3	14	295	500	1176	3115	3462	108
1798	180	378	6	15	10	505	428	3062	4734	6079	344
1799	180	337	19	10	17	419	371	2057	4265	3252	300
1800	180	328	11	14	29	315	496	1875	1021	5339	231
1801	181	357	19	10	24	220	545	3576	3643	6226	243
1802	181	382	16	17	27	521	421	2145	1760	6118	491
1803	181	332	6	3	30	481	796	4418	1493	5714	98
1804	181	312	3	12	24	473	686	1617	3798	5453	145
1805	181	373	14	7	20	673	383	4547	2882	3941	345
1806	181	380	7	0	2	434	467	2010	3464	3759	466
1807	181	328	4	9	14	284	521	3829	3612	4042	394
1808	181	344	6	5	1	531	544	3409	2508	5564	430
1809	181	333	2	9	18	668	590	2779	4525	5443	62
1810	181	356	3	13	26	461	321	2640	1296	6780	129
1811	182	346	20	10	15	580	328	3983	3765	7860	173
1812	182	319	13	10	9	564	613	1622	2295	4025	337
1813	182	375	11	7	13	559	295	1646	3252	4209	181
1814	182	387	10	6	1	429	225	3323	3133	6171	172
1815	182	379	10	17	17	585	383	1575	2417	8198	211
1816	182	341	16	8	25	245	373	1604	1883	9379	49
1817	182	350	10	8	0	703	624	3293	4914	9921	447
1818	182	322	14	9	29	619	709	1712	1186	5445	491
1819	182	400	8	5	11	284	417	1863	1871	2523	360
1820	182	302	14	2	25	274	609	1314	1216	8571	258
1821	183	343	2	8	1	318	303	1854	1392	8699	462
1822	183	370	14	0	3	298	353	4372	3765	1303	466
1823	183	330	17	8	26	412	741	4037	1235	4763	207
1824	183	331	8	11	10	333	690	2978	1825	5795	211
1825	183	398	17	5	9	750	724	1519	2643	9809	32
1826	183	334	6	10	2	685	688	3636	4037	7033	21
1827	183	318	12	0	26	796	587	3406	4637	8548	138
1828	183	396	18	12	10	726	389	2272	2609	9999	77
1829	183	351	11	20	12	733	730	4961	1824	1868	316
1830	183	394	7	16	7	354	357	2458	2293	3656	71
1831	184	301	7	9	18	346	409	2550	2479	4884	286
1832	184	382	13	7	12	380	207	2687	2977	1429	102
1833	184	326	10	17	5	446	295	2872	4286	1305	324
1834	184	377	14	1	28	234	238	3188	3920	2992	120
1835	184	355	15	1	30	680	408	4969	4825	4475	408
1836	184	384	16	2	9	263	412	2694	4078	3709	127
1837	184	367	12	12	24	346	701	3892	3085	8330	116
1838	184	351	6	9	25	231	363	3929	4731	1449	363
1839	184	389	14	19	8	668	322	2094	3009	6675	46
1840	184	324	10	14	6	349	421	3227	1189	7142	286
1841	185	374	5	9	4	520	441	1550	1622	8337	443
1842	185	356	16	9	24	748	352	4509	4323	3423	347
1843	185	335	8	6	23	500	558	2292	3319	6215	254
1844	185	360	19	8	23	465	729	3877	1705	7303	83
1845	185	326	12	9	18	626	410	3440	1624	1841	332
1846	185	301	5	8	13	360	672	1774	2225	8283	453
1847	185	331	11	16	17	465	398	3271	1099	6071	38
1848	185	313	18	19	28	680	476	2664	3810	9987	276
1849	185	361	12	16	13	797	517	1729	1517	3519	455
1850	185	305	7	13	24	268	625	3512	3994	4476	302
1851	186	384	15	12	21	787	550	1236	4607	8402	125
1852	186	342	11	10	20	318	268	4747	2343	2241	60
1853	186	359	5	13	14	429	522	2674	2680	8301	404
1854	186	336	19	11	4	217	436	4501	2069	9939	374
1855	186	341	3	9	20	728	770	3754	3400	2459	334
1856	186	334	8	8	1	690	554	3473	4881	4938	82
1857	186	325	13	8	8	449	273	3986	2415	2487	423
1858	186	394	5	10	28	709	756	4675	2199	5840	474
1859	186	337	6	6	8	422	747	1196	2663	7975	483
1860	186	305	12	16	15	691	794	3141	3171	2575	275
1861	187	366	13	7	23	323	618	4139	3410	5313	356
1862	187	381	9	15	30	418	220	1558	3771	2010	195
1863	187	335	11	10	13	340	720	3026	2924	4591	326
1864	187	363	16	11	4	369	564	4995	2679	8000	439
1865	187	367	3	15	3	627	408	1941	3093	3740	193
1866	187	389	18	15	8	723	343	1692	3370	8532	31
1867	187	394	10	14	26	491	479	1101	2596	4266	351
1868	187	349	4	18	14	321	620	3251	1729	7529	68
1869	187	352	2	19	7	235	332	1329	2873	4252	100
1870	187	388	11	9	24	206	638	1194	3597	7470	175
1871	188	350	11	0	24	367	411	1974	3105	8288	380
1872	188	361	9	5	20	656	566	3707	3719	7283	486
1873	188	335	13	3	3	567	755	2446	2211	5621	331
1874	188	377	2	5	6	470	237	3481	3614	4630	420
1875	188	400	8	1	19	796	251	2924	2834	3973	430
1876	188	302	6	18	17	455	777	1994	1489	7164	488
1877	188	379	9	4	0	580	310	4530	1760	8351	399
1878	188	376	13	5	25	498	292	3687	3459	9067	55
1879	188	368	14	10	17	613	406	4665	4405	9045	277
1880	188	319	6	10	16	513	713	1304	3565	9453	13
1881	189	303	4	4	23	287	529	3000	3275	4127	281
1882	189	318	5	0	19	203	608	1370	3802	6825	108
1883	189	330	2	20	20	626	757	3756	2702	1964	269
1884	189	387	2	12	1	364	633	1477	1333	3909	336
1885	189	361	19	11	20	235	425	2331	3404	8669	86
1886	189	312	16	0	14	400	777	3414	1663	6732	476
1887	189	316	1	4	25	200	313	2742	4879	2013	252
1888	189	348	9	9	10	240	533	1651	4358	3509	16
1889	189	339	0	1	9	418	429	3502	1905	7178	54
1890	189	304	15	7	5	656	697	3422	3858	1437	5
1891	190	371	13	10	9	455	345	1734	4636	3922	168
1892	190	309	8	2	19	586	644	4305	4532	5899	153
1893	190	308	3	5	16	310	468	3385	2492	5879	492
1894	190	370	10	6	5	517	764	1136	1402	9413	185
1895	190	333	9	14	23	482	484	1905	1098	9684	167
1896	190	400	5	11	1	277	671	3042	4365	3725	411
1897	190	366	20	3	24	555	432	2559	2838	4670	314
1898	190	337	15	4	25	390	291	3065	3536	1060	170
1899	190	386	10	16	5	420	558	2170	1021	2770	201
1900	190	307	4	11	7	536	602	1453	2339	3911	50
1901	191	385	9	1	2	668	758	1859	2433	5959	32
1902	191	346	2	0	12	581	333	3391	3372	4759	181
1903	191	394	15	19	19	535	226	2947	1143	2402	245
1904	191	374	19	7	7	429	505	3955	2510	7737	263
1905	191	307	1	19	30	291	214	4929	3548	8036	485
1906	191	313	7	15	13	381	533	4869	2298	9876	461
1907	191	345	15	6	14	328	496	2038	4054	1578	253
1908	191	386	20	13	28	693	452	3418	2674	9043	368
1909	191	319	20	13	21	355	379	2320	4042	1189	170
1910	191	371	15	5	13	469	202	3912	4462	6492	487
1911	192	380	6	20	17	366	574	3272	3656	8694	35
1912	192	392	20	4	6	201	236	2441	1933	1532	262
1913	192	369	5	11	0	651	440	4772	2949	7532	446
1914	192	316	1	0	6	352	234	3877	4905	3001	126
1915	192	333	20	19	22	537	235	3224	2089	1982	249
1916	192	322	7	1	8	237	255	1083	1368	7397	136
1917	192	364	1	12	11	632	344	4171	1104	3036	332
1918	192	394	20	9	8	514	779	4768	1174	7847	35
1919	192	342	1	11	20	275	293	3013	4695	7106	337
1920	192	345	18	14	16	520	250	3923	3876	3427	499
1921	193	302	15	20	4	446	211	1169	2114	4177	233
1922	193	344	16	17	9	702	673	1289	3823	7882	120
1923	193	396	6	9	8	373	577	1615	2082	2706	270
1924	193	326	6	13	8	318	657	1064	2547	5035	11
1925	193	364	14	9	14	743	319	4097	3795	3681	65
1926	193	377	12	6	17	231	755	4587	3400	9279	323
1927	193	328	3	0	4	295	322	2948	2847	8866	166
1928	193	397	17	5	14	726	664	2250	3011	5906	351
1929	193	339	5	7	9	713	556	2141	4299	9411	473
1930	193	392	14	8	11	730	752	3686	3237	8365	180
1931	194	361	1	19	23	432	620	3836	3109	4036	146
1932	194	336	15	6	10	282	239	3894	3765	3654	490
1933	194	373	0	4	22	529	386	2406	4309	6129	307
1934	194	354	13	5	4	660	698	2742	1927	6139	30
1935	194	378	6	6	13	399	200	1537	1035	7305	276
1936	194	360	1	3	5	790	610	1044	4252	5237	467
1937	194	321	11	1	9	794	586	4813	1146	8063	224
1938	194	376	20	8	10	659	279	2421	2938	8293	197
1939	194	301	3	17	17	268	414	1383	3646	4979	434
1940	194	364	20	6	28	267	772	1734	1665	3131	268
1941	195	368	16	1	11	601	247	4616	3475	4375	291
1942	195	339	1	6	16	728	544	1514	2075	1894	468
1943	195	367	4	19	25	313	625	3660	4168	1314	149
1944	195	312	1	12	19	571	264	3454	4198	2621	34
1945	195	342	11	7	29	641	398	3488	1659	4924	473
1946	195	307	3	15	30	683	608	4024	3311	5621	415
1947	195	314	16	0	6	516	376	2276	4893	7057	285
1948	195	347	0	16	3	655	759	4216	4821	1934	430
1949	195	362	8	9	0	338	266	4919	3043	4019	262
1950	195	385	1	5	28	301	349	2875	3702	2553	385
1951	196	331	19	11	2	595	323	2138	2196	8309	498
1952	196	391	15	11	16	280	655	2765	2618	1371	87
1953	196	326	19	18	23	248	631	3147	3142	9450	123
1954	196	341	4	0	7	541	680	4287	3828	5372	135
1955	196	377	15	13	14	669	222	1132	2564	3639	51
1956	196	333	9	2	0	690	243	3368	3445	4200	432
1957	196	347	5	3	11	487	421	2555	1175	2811	477
1958	196	301	18	4	23	663	607	4712	1075	4633	74
1959	196	338	14	3	2	719	707	4952	1031	8190	470
1960	196	397	11	2	16	422	496	3110	4568	5584	262
1961	197	387	2	17	1	720	746	1529	4116	4403	117
1962	197	340	13	14	29	485	574	4269	4556	9522	266
1963	197	384	19	5	5	292	577	2499	2396	2453	486
1964	197	335	18	6	0	758	437	3385	3835	7050	110
1965	197	333	17	6	19	712	545	1508	1165	4377	192
1966	197	307	16	10	14	748	469	1024	4660	4660	8
1967	197	391	20	11	30	445	502	2537	2777	7387	417
1968	197	334	6	11	29	272	652	4288	3047	4546	161
1969	197	395	0	5	10	563	718	3778	2076	1251	300
1970	197	306	18	6	13	292	411	2350	4566	6311	133
1971	198	396	20	4	27	620	771	4946	2345	8002	402
1972	198	383	18	5	14	543	253	4043	3097	6806	156
1973	198	390	16	5	10	369	368	2525	3987	7771	21
1974	198	375	8	4	27	524	624	3853	4345	6683	294
1975	198	358	14	16	2	558	512	3604	1379	6498	302
1976	198	371	11	20	4	268	654	3381	4039	4200	418
1977	198	373	8	5	14	746	756	2869	2027	7840	159
1978	198	387	11	1	21	795	512	2601	1956	4044	151
1979	198	334	20	3	13	261	306	4495	1039	2752	492
1980	198	374	1	11	7	444	404	4805	2769	2499	83
1981	199	326	7	2	6	739	670	4680	3432	5512	37
1982	199	339	12	15	0	637	249	4952	1012	9248	24
1983	199	320	16	13	14	480	577	4555	3161	3850	143
1984	199	364	20	8	4	413	749	2407	4345	6952	300
1985	199	303	20	19	15	244	425	2321	1986	9673	354
1986	199	377	16	16	17	207	394	3973	4512	3634	296
1987	199	313	18	8	12	386	239	1626	4798	1948	35
1988	199	399	1	14	6	219	442	3350	4110	3201	5
1989	199	346	10	4	10	411	397	4929	3718	3193	213
1990	199	363	5	3	7	553	799	2383	4619	3603	306
1991	200	381	2	14	6	459	334	3349	4505	8071	9
1992	200	308	8	19	6	749	225	1187	1543	8645	455
1993	200	378	16	3	13	387	251	1365	3189	1040	310
1994	200	359	10	5	30	518	462	1749	3114	4798	228
1995	200	304	1	2	30	340	606	1605	4923	1211	202
1996	200	377	4	13	27	717	527	3262	2935	4027	12
1997	200	356	12	7	16	463	402	2456	1397	6789	431
1998	200	307	9	0	28	309	290	1766	4660	4611	367
1999	200	349	9	16	17	513	326	4642	2998	7950	307
2000	200	379	1	8	11	414	304	4744	3439	8967	394
\.


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matches (match_id, tournament_id, date, duration, map, mode, result, replay_url) FROM stdin;
151	31	2025-06-23 23:19:50.582203	00:47:00	environment	RANKED	Radiant	https://vasquez.com/main/tagcategory.jsp
152	31	2025-06-23 23:18:35.354578	00:32:00	necessary	RANKED	Radiant	http://www.allen.com/appabout.asp
153	31	2025-06-23 23:23:09.995106	00:32:00	stage	CUSTOM	Dire	http://www.bishop-salas.biz/listfaq.htm
154	31	2025-06-23 23:23:29.884196	00:22:00	find	CUSTOM	Radiant	https://mendez.com/tag/blog/wp-contentcategory.htm
155	31	2025-06-23 23:19:22.928802	00:26:00	plan	CUSTOM	Dire	https://harris.com/app/blog/listterms.php
156	32	2025-06-23 23:20:00.061459	00:28:00	box	UNRANKED	Dire	http://clayton-erickson.com/categories/main/tagterms.php
157	32	2025-06-23 23:21:29.840968	00:22:00	finally	CUSTOM	Dire	https://hudson-lozano.info/categorieshome.html
158	32	2025-06-23 23:23:31.69713	00:25:00	church	CUSTOM	Radiant	http://nelson-young.com/app/search/listindex.htm
159	32	2025-06-23 23:18:25.153038	00:47:00	stock	RANKED	Dire	https://www.campbell-oliver.org/category/category/categoryauthor.asp
160	32	2025-06-23 23:20:55.566417	00:27:00	expert	UNRANKED	Dire	https://dorsey-beasley.net/postsregister.htm
161	33	2025-06-23 23:20:30.726675	00:46:00	first	UNRANKED	Radiant	http://kramer.com/category/tags/explorefaq.jsp
162	33	2025-06-23 23:22:24.325573	00:21:00	next	RANKED	Radiant	http://www.casey-johnson.com/categoriessearch.htm
163	33	2025-06-23 23:20:29.435632	00:26:00	guy	UNRANKED	Dire	https://hunt.biz/explore/categoriessearch.htm
164	33	2025-06-23 23:19:27.822646	00:44:00	hand	RANKED	Dire	https://www.hernandez-farley.biz/appcategory.htm
165	33	2025-06-23 23:18:52.719503	00:59:00	Republican	CUSTOM	Radiant	http://klein.org/posts/postsindex.asp
166	34	2025-06-23 23:18:13.445267	00:28:00	me	UNRANKED	Dire	https://phillips-butler.info/tags/categoryterms.php
167	34	2025-06-23 23:17:51.557703	00:54:00	enter	RANKED	Radiant	https://rodriguez.com/posts/postsfaq.html
168	34	2025-06-23 23:20:53.466907	01:00:00	local	RANKED	Radiant	http://hernandez-davis.com/exploreindex.html
169	34	2025-06-23 23:18:07.675697	00:38:00	region	UNRANKED	Radiant	http://www.anderson-thomas.com/tags/category/appindex.asp
170	34	2025-06-23 23:21:34.252206	00:50:00	notice	RANKED	Dire	https://www.vazquez-adams.info/app/blogmain.asp
171	35	2025-06-23 23:23:25.174906	00:48:00	kid	CUSTOM	Dire	http://www.jimenez.biz/search/searchauthor.html
172	35	2025-06-23 23:21:24.060444	00:47:00	admit	UNRANKED	Dire	https://ortega-hoffman.com/main/search/mainhome.htm
173	35	2025-06-23 23:22:52.478675	00:39:00	expect	RANKED	Radiant	http://perkins.com/posts/explore/appregister.html
174	35	2025-06-23 23:21:22.203591	00:35:00	kitchen	RANKED	Dire	http://nelson.com/categories/list/wp-contenthomepage.html
175	35	2025-06-23 23:23:05.484351	00:48:00	still	UNRANKED	Dire	https://www.anderson-james.org/category/exploresearch.html
176	36	2025-06-23 23:23:29.044232	00:27:00	present	CUSTOM	Dire	https://stevenson.com/listsearch.html
177	36	2025-06-23 23:21:27.896795	00:33:00	involve	CUSTOM	Dire	http://anderson.com/blog/postsindex.php
178	36	2025-06-23 23:22:37.971223	00:36:00	reveal	UNRANKED	Radiant	https://www.gould-fleming.org/tags/app/poststerms.php
179	36	2025-06-23 23:19:01.20176	00:23:00	contain	CUSTOM	Dire	http://www.williams-roberts.com/blogpost.html
180	36	2025-06-23 23:22:37.346622	00:48:00	soon	RANKED	Radiant	https://www.patterson.com/listindex.html
181	37	2025-06-23 23:23:03.936119	00:38:00	program	UNRANKED	Dire	http://bush.com/search/posts/tagslogin.asp
182	37	2025-06-23 23:19:29.521797	00:38:00	himself	RANKED	Radiant	http://www.griffin.com/mainabout.html
183	37	2025-06-23 23:22:47.517619	00:48:00	current	CUSTOM	Dire	https://www.black-castro.com/category/exploreregister.php
184	37	2025-06-23 23:21:57.119423	00:42:00	son	UNRANKED	Radiant	https://kent.org/searchcategory.html
185	37	2025-06-23 23:19:16.172693	00:31:00	bill	UNRANKED	Radiant	https://www.walter-mcmillan.com/list/tags/appterms.jsp
186	38	2025-06-23 23:20:24.748004	00:55:00	situation	CUSTOM	Dire	https://www.burton-johnson.net/app/posts/searchcategory.asp
187	38	2025-06-23 23:20:03.711854	00:20:00	pattern	RANKED	Dire	http://www.lambert.com/explore/app/blogindex.jsp
188	38	2025-06-23 23:20:50.399825	00:54:00	fine	CUSTOM	Dire	https://may-shepherd.info/tags/category/tagfaq.php
189	38	2025-06-23 23:23:10.778611	00:26:00	population	CUSTOM	Radiant	https://www.brown-mcclure.biz/exploreprivacy.asp
190	38	2025-06-23 23:20:26.453577	00:37:00	letter	UNRANKED	Radiant	https://www.gill-reed.com/postsfaq.htm
191	39	2025-06-23 23:23:14.119766	00:49:00	to	UNRANKED	Radiant	https://www.matthews.com/tag/blog/apphomepage.html
192	39	2025-06-23 23:20:51.335535	00:26:00	sister	RANKED	Dire	https://www.brown-castro.biz/searchmain.php
193	39	2025-06-23 23:21:51.175461	00:38:00	table	RANKED	Radiant	http://ryan.com/main/categories/categoriesauthor.html
194	39	2025-06-23 23:19:28.208946	00:39:00	whether	RANKED	Radiant	https://jones.com/searchauthor.html
195	39	2025-06-23 23:20:54.840433	00:53:00	civil	UNRANKED	Dire	https://meadows.info/exploreindex.htm
196	40	2025-06-23 23:20:54.628202	00:40:00	camera	UNRANKED	Dire	http://glass-hamilton.biz/posts/search/searchregister.htm
197	40	2025-06-23 23:22:38.670394	00:40:00	field	UNRANKED	Radiant	http://bridges.com/listmain.asp
198	40	2025-06-23 23:21:56.826478	00:24:00	teacher	RANKED	Dire	http://www.williams-martin.biz/main/categoriesabout.htm
199	40	2025-06-23 23:23:10.724159	00:50:00	party	UNRANKED	Dire	https://friedman.com/categories/postshome.htm
200	40	2025-06-23 23:23:16.929781	00:32:00	guess	RANKED	Dire	https://www.martin.info/tags/wp-contentlogin.asp
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (notification_id, user_id, type, is_read, created_at) FROM stdin;
\.


--
-- Data for Name: player_achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_achievements (pa_id, profile_id, achievement_id, unlocked_at) FROM stdin;
151	314	366	2025-06-23 23:20:10.537879
152	394	372	2025-06-23 23:22:11.663254
153	342	386	2025-06-23 23:18:22.508076
154	369	399	2025-06-23 23:18:57.75651
155	389	385	2025-06-23 23:22:55.765722
156	337	380	2025-06-23 23:21:20.709946
157	390	303	2025-06-23 23:21:37.16586
158	395	339	2025-06-23 23:23:03.53261
159	388	371	2025-06-23 23:22:35.63556
160	387	328	2025-06-23 23:17:42.003465
161	305	389	2025-06-23 23:22:23.756874
162	380	349	2025-06-23 23:20:25.304736
163	331	322	2025-06-23 23:19:33.527884
164	329	319	2025-06-23 23:18:18.6163
165	318	338	2025-06-23 23:22:52.107743
166	358	311	2025-06-23 23:18:20.015076
167	320	334	2025-06-23 23:23:05.409613
168	393	344	2025-06-23 23:19:23.305809
169	375	373	2025-06-23 23:19:53.276075
170	304	381	2025-06-23 23:23:10.619852
171	338	352	2025-06-23 23:20:54.305252
172	392	364	2025-06-23 23:18:57.702549
173	332	335	2025-06-23 23:20:15.893741
174	398	395	2025-06-23 23:19:20.576061
175	367	315	2025-06-23 23:17:51.334808
176	399	380	2025-06-23 23:19:30.952487
177	354	363	2025-06-23 23:19:07.318707
178	381	398	2025-06-23 23:18:11.50494
179	396	371	2025-06-23 23:23:09.243939
180	348	325	2025-06-23 23:23:34.849078
181	400	397	2025-06-23 23:18:36.769815
182	384	392	2025-06-23 23:19:21.207458
183	351	345	2025-06-23 23:23:28.789257
184	382	301	2025-06-23 23:22:06.555512
185	303	305	2025-06-23 23:22:05.351382
186	321	336	2025-06-23 23:19:10.569389
187	340	372	2025-06-23 23:22:13.726956
188	313	312	2025-06-23 23:19:51.506854
189	391	361	2025-06-23 23:19:21.800056
190	376	329	2025-06-23 23:21:11.801672
191	310	393	2025-06-23 23:19:24.782015
192	323	301	2025-06-23 23:22:51.637857
193	309	333	2025-06-23 23:18:47.503769
194	330	385	2025-06-23 23:23:09.645166
195	324	388	2025-06-23 23:23:22.253706
196	386	339	2025-06-23 23:18:18.652997
197	371	385	2025-06-23 23:17:57.016631
198	368	354	2025-06-23 23:19:57.755718
199	363	385	2025-06-23 23:18:31.166115
200	350	345	2025-06-23 23:17:46.697541
\.


--
-- Data for Name: player_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_profiles (profile_id, user_id, steam_id, nickname, mmr) FROM stdin;
301	301	1174dac9-0efb-49ce-8af8-c54a037cb53c	chase14	8961
302	302	4ec6ec40-87a5-4a76-a524-bd4b8f58a625	stephanie53	9776
303	303	d9bfb4d6-7c49-4606-9b53-f9105ec57bcd	pmoore	8131
304	304	80d2bbc2-61f7-4f9a-83c0-a1109101c315	danielwest	9742
305	305	5679ed4e-c5f4-40f6-82ed-b40aa7276fd3	coleemma	5776
306	306	018016d5-dfc1-4e2f-a1e9-6f5279a0e301	davidhodges	8890
307	307	9b8d56b6-3c6f-4ba8-b463-0adab0edb5d0	theresa24	7172
308	308	86472d0f-f13a-49df-ad41-bde7d6248d1a	eevans	8923
309	309	af5fa935-6aea-470f-bd10-e11ed0b7ad68	brandonboyle	9294
310	310	5cf2a255-457e-4361-ad0a-1394e63b4acb	josebarton	5534
311	311	d2b1bc82-f62f-417f-b197-e25e1d174f00	sarahcampbell	7989
312	312	cf6a0498-58aa-4a53-973c-3a558594abd7	riveramatthew	9085
313	313	2ad86a3c-d6a0-4334-ba49-727609261d94	ovaldez	8258
314	314	a43dbffa-5643-4e95-ac21-96fefac32fda	dferguson	9105
315	315	407eaae7-2cb6-4f41-9878-2a5e09c802ee	kelly09	9606
316	316	ddf7721c-6ae4-4db3-b780-f2e0d264bb97	halljohnathan	6502
317	317	bb02c226-ad4c-49fa-b745-307c95511016	kelseyhayes	6402
318	318	a8722432-0d3e-41a8-bd66-07976b418314	curryjeffrey	9456
319	319	056a8b9b-ea67-43f3-bdef-79e7559fa7df	bethhall	6401
320	320	80df1d92-9cc1-45ab-a1da-9abb31951362	emilyburns	6584
321	321	18d313cf-d856-48a4-a2f9-9b9ada29562a	rodney48	6241
322	322	05a2ead4-3a3c-4319-a013-a504e0fb4880	meganwilliams	5365
323	323	56467840-dfb4-49db-8464-7705e3f8bdc9	awheeler	5180
324	324	afee5ca1-91f6-4d89-a5c4-e3464dae9781	kramerhelen	6588
325	325	abe396f4-d6a0-4746-9df5-5686533b7ceb	simsbenjamin	8503
326	326	50e05fc1-53a4-4390-9c35-41bef3db6cdc	torreskatie	5169
327	327	6c1f0c73-d381-4bd8-8053-ae001b4d095a	lori91	8898
328	328	80074b67-5d8e-4222-a2f2-7fa40e034e59	estradarenee	6898
329	329	f023b65b-b8f0-4d9c-88f8-b10847f1e52e	harrisholly	5592
330	330	df3b472f-a342-4c03-a2fe-4d9b89791f9a	amysmith	7976
331	331	a0e7d64e-68da-491b-8ccb-660ac1123de6	imendoza	9813
332	332	8bb40566-2f50-424d-8b43-55261a1d15a3	matazachary	7520
333	333	5cd9b57e-cd09-42f5-b80b-ef0174cd4939	bruce52	9851
334	334	f1b96ba6-6601-4ea3-90c5-033734ae6001	adam90	9369
335	335	349b1d12-ef03-469e-bc14-314b45547cfb	joseph80	9862
336	336	5f3eaf4a-b39c-4907-b12d-a7e4288d3d02	victorianewton	9221
337	337	31ccf096-d62f-42ed-a4f2-ad5f3b8336ec	oliverjennifer	6427
338	338	edf5bc2f-884c-45a3-9031-3e4b10b0d625	garzahunter	8080
339	339	4cae6d00-3cec-414b-a58e-0eb36d3f96b1	stephaniemyers	5601
340	340	e3ffe9bb-b1a9-4fae-9e33-179d90de966d	jason38	6990
341	341	643732a5-fc3a-4192-af77-581136247cba	jeffrey60	6374
342	342	89e16f02-5188-4275-b530-cc73ca11066d	dorothypeck	6229
343	343	ea35c6c8-c12e-464d-8c0e-cb57e1fd54b7	qnunez	5017
344	344	6918e24a-4805-4480-ac67-26c22a9ad8ad	thompsonjennifer	6996
345	345	258488ef-c6f9-40b4-ac5f-84b85c212e43	frank72	6570
346	346	810576f0-347f-4be5-8cc5-d006bcf26faf	churchjacob	8953
347	347	7173a5d1-d4d9-4fe9-bb2a-ace79ded1acc	nelsonlindsey	7060
348	348	ba8df92e-defa-4d6b-a9dd-0e2e1095cb81	iheath	6355
349	349	616d6731-0971-4945-b63f-c8def9ca59e0	matthew67	7355
350	350	c84eca7c-b534-4d46-8b79-ee4879501da0	stuartjohn	8842
351	351	cd7a77b7-2ffa-4fca-b68a-f16fa1a7d0b3	marshallrobert	9113
352	352	e09111ce-42a7-4765-9a05-fde828caeda4	brownpatricia	8798
353	353	adda6b6a-1c66-43ea-85a7-32af9178f782	rachael59	8306
354	354	8474c38a-4b99-4f18-b016-447274de6e92	linda89	9653
355	355	4c1fbd56-f1cc-4e92-8ce4-a7827954b81d	lisachang	9245
356	356	65ebb12e-99a3-49bc-92d3-b7533131485a	millerronald	8917
357	357	1f2895e5-8e2b-45b4-8a07-fcc1d153f00f	rothkeith	7774
358	358	fb18b5ff-2e34-46d4-85f7-825d45086bd8	dwilliams	9563
359	359	013e0aff-6641-41e0-a866-b123b626d8e3	frobinson	7132
360	360	d93e9ef4-7244-4b7d-99e8-3e13fa1cd05d	katiejones	7284
361	361	fb5d50be-506d-47f3-8d51-0db4d51340f7	ojones	9549
362	362	8f1c853f-b620-4a57-bc30-2a7101d476e7	meyersmatthew	9748
363	363	60e44827-6868-4468-93a9-b2edbb92098e	galvankim	7925
364	364	60032718-dee7-434b-90db-5db4ac8f7e00	joseph00	8939
365	365	fe378577-b9ca-4943-a842-3d5cf62a9bea	shelbygreen	6003
366	366	0b87ded8-4362-451d-b95a-8f5b3b4318ba	bpalmer	5316
367	367	a2206496-fa4b-44c6-a66d-05a0eddf3473	ijones	9412
368	368	81e167c6-7368-45e1-8670-8e55f6490d5c	welchkimberly	8417
369	369	3d2003ec-9b6d-46bb-88d6-966fc20c33d1	barronryan	8959
370	370	a6e42b63-c135-4170-91ca-cc3562486c1b	ruben37	6701
371	371	ee216919-07e6-4057-b1b8-a7a99abb463e	zimmermangregory	6032
372	372	735aab3c-6763-4a38-98a1-92eb96675e5a	keith14	5411
373	373	35e1d308-8113-4bc5-9aed-e17eb251d113	ystephenson	8756
374	374	c253d6e5-6ae7-450b-a195-8e9f2c24f5b6	vwallace	9274
375	375	a5664c03-a6a1-44d4-b59c-b92bdfd7987b	michael86	6401
376	376	23e5b619-37ac-4b98-8150-9e1f489ec59c	michael70	5641
377	377	39fdd631-3650-44b3-853c-3522a9db11f4	scottholly	8939
378	378	0f1aecce-d62c-4b06-8c0a-838605f62a1a	randy33	9389
379	379	267fb3d1-4230-48b4-bea8-a30faf67c78f	lynchcaroline	6178
380	380	e553deb9-d7e9-43f3-a694-90630750f08b	kirkzachary	5145
381	381	3b70542c-bedb-4a49-8559-f3b6006ca32f	vickischmidt	8564
382	382	52206206-310b-4724-803a-395296dd278f	jenniferanderson	8489
383	383	68b6db1e-9fee-4886-847a-c1ddfc1440d8	briancox	9832
384	384	b512f3ab-e33c-40a4-9ecf-0b401deda0f7	nbates	5162
385	385	1dbccb4b-be48-4ce3-a499-c12bf941c631	sherri11	7227
386	386	ed23bf04-e273-4ed5-bf22-a947f30f1f12	marie14	6811
387	387	1a2f3831-c352-4671-87ac-d1119036414b	christopher71	9602
388	388	85b65ba7-8148-4820-a66e-a4dd0d9a859f	abigailbarron	5855
389	389	dae71405-7ed9-409c-95c4-0a77513ee3a2	brittany08	6991
390	390	3479158e-65e1-45f0-9cb7-6024dffd53d8	vasquezjose	5711
391	391	baa464ba-e21f-4450-be9e-769416ca30fc	stephensnyder	5633
392	392	1e85aac2-fe4a-40c0-bbc5-c33ffeebb923	thomaslauren	7554
393	393	a8f9fdd1-ceb6-4f9d-9842-fb46a9da55a6	mccoylindsay	8153
394	394	6965707c-859e-4376-a060-e0cc7ee245dd	omoss	8818
395	395	364a67eb-57aa-4269-bde8-2126bb12fff9	brittany54	8416
396	396	6df39391-66f6-4121-a13b-058c1924d745	paultorres	9177
397	397	f6505106-6c6e-435e-96a2-21ccd3bb709c	rhuber	8301
398	398	08562121-6271-4b0c-9283-675b20627a8d	adriana53	9557
399	399	9b5b46b8-9b6a-4e8e-a068-1ff353dc194e	roachsarah	7367
400	400	e2823ab4-588e-4a13-8e32-72801da3616e	diana02	8889
\.


--
-- Data for Name: players_in_match; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players_in_match (match_id, profile_id, team_id, hero_id) FROM stdin;
151	400	399	78
151	315	361	61
151	352	357	63
151	303	345	72
151	398	364	63
151	316	369	61
151	396	352	68
151	312	324	75
151	304	359	65
151	397	350	73
152	319	327	78
152	397	350	67
152	364	332	66
152	343	316	66
152	354	321	76
152	314	329	71
152	360	324	67
152	302	377	64
152	382	344	67
152	348	345	72
153	379	389	66
153	318	388	61
153	334	381	62
153	380	393	63
153	323	354	61
153	393	364	72
153	351	376	63
153	330	387	73
153	319	382	76
153	376	390	76
154	304	360	67
154	325	317	79
154	308	367	67
154	315	394	61
154	329	397	68
154	328	350	71
154	358	386	72
154	395	392	78
154	362	309	62
154	387	313	64
155	384	336	67
155	338	304	68
155	385	349	73
155	323	377	68
155	381	326	62
155	366	367	79
155	341	400	76
155	340	325	68
155	389	376	67
155	329	362	76
156	400	375	66
156	309	346	77
156	392	367	73
156	354	355	70
156	310	374	62
156	315	306	71
156	381	320	65
156	393	380	75
156	343	366	66
156	308	347	61
157	307	388	66
157	371	356	77
157	312	323	62
157	353	397	68
157	384	303	79
157	395	312	75
157	391	301	64
157	324	369	76
157	322	347	76
157	340	309	61
158	359	317	61
158	312	355	63
158	358	329	78
158	377	354	75
158	375	318	75
158	318	396	77
158	378	385	65
158	316	374	68
158	311	332	75
158	329	337	73
159	394	348	73
159	334	369	62
159	316	381	67
159	337	328	66
159	347	319	75
159	335	316	63
159	312	332	72
159	382	308	80
159	344	386	63
159	336	321	63
160	385	323	77
160	339	368	61
160	325	324	62
160	349	386	61
160	333	302	75
160	337	375	80
160	318	339	66
160	356	394	66
160	352	376	79
160	400	399	69
161	335	351	63
161	395	379	66
161	324	319	77
161	329	340	76
161	318	356	68
161	384	355	73
161	361	366	72
161	376	346	63
161	397	337	70
161	381	393	76
162	400	324	66
162	376	365	70
162	377	394	63
162	329	306	69
162	374	362	69
162	330	333	71
162	347	334	66
162	312	370	79
162	383	400	64
162	361	390	66
163	364	307	63
163	332	342	65
163	383	339	76
163	310	318	64
163	368	347	61
163	304	345	74
163	389	304	69
163	385	371	77
163	337	317	63
163	369	314	76
164	350	359	61
164	344	397	73
164	315	347	79
164	305	343	61
164	378	382	69
164	309	346	67
164	397	387	68
164	381	330	65
164	311	376	72
164	339	369	65
165	331	353	68
165	356	338	62
165	318	369	74
165	310	346	68
165	323	361	71
165	372	323	80
165	394	321	79
165	302	350	67
165	383	313	75
165	315	362	75
166	361	345	61
166	322	340	65
166	387	342	71
166	372	329	61
166	323	323	68
166	319	344	71
166	355	348	80
166	313	345	78
166	359	358	65
166	342	388	63
167	356	305	77
167	394	381	72
167	305	324	61
167	331	329	67
167	357	390	65
167	324	307	62
167	304	324	77
167	375	383	61
167	333	353	73
167	371	317	66
168	367	301	64
168	346	377	69
168	392	352	65
168	356	378	80
168	376	324	66
168	344	385	80
168	322	390	68
168	393	366	64
168	317	334	63
168	307	390	61
169	362	331	76
169	324	384	71
169	396	377	79
169	372	377	77
169	384	352	75
169	353	397	67
169	358	324	74
169	323	400	68
169	315	312	68
169	382	380	78
170	315	332	67
170	358	375	73
170	339	387	73
170	328	311	68
170	387	324	67
170	319	366	76
170	314	315	62
170	334	362	76
170	359	380	66
170	381	367	80
171	387	323	73
171	374	373	70
171	308	383	72
171	309	389	73
171	313	369	79
171	324	344	65
171	357	313	62
171	397	372	61
171	337	364	68
171	363	370	70
172	373	336	77
172	348	356	64
172	303	349	72
172	349	334	76
172	328	359	64
172	371	346	80
172	345	378	63
172	386	372	76
172	319	365	62
172	376	342	78
173	302	323	75
173	316	383	61
173	334	381	67
173	399	372	73
173	308	398	73
173	312	317	62
173	314	328	72
173	344	371	74
173	310	326	75
173	360	307	80
174	335	328	67
174	349	311	80
174	346	388	75
174	325	324	71
174	397	339	62
174	353	331	67
174	360	347	75
174	333	372	68
174	395	323	67
174	305	320	71
175	360	322	75
175	306	363	74
175	319	343	66
175	379	339	80
175	301	387	69
175	355	301	79
175	376	330	75
175	302	369	69
175	333	345	75
175	314	382	80
176	397	301	74
176	315	345	65
176	382	304	73
176	342	322	80
176	313	380	80
176	384	399	79
176	349	379	80
176	324	325	79
176	341	315	66
176	400	363	71
177	339	378	70
177	359	310	68
177	325	371	66
177	307	334	76
177	312	392	62
177	357	308	63
177	362	358	70
177	319	370	75
177	313	311	62
177	380	302	66
178	343	383	71
178	383	353	77
178	367	305	79
178	357	357	78
178	329	381	62
178	305	348	72
178	333	390	66
178	315	366	70
178	354	384	77
178	348	371	77
179	370	393	66
179	364	396	62
179	321	365	62
179	381	316	62
179	325	351	63
179	390	333	65
179	397	396	64
179	385	343	75
179	340	399	67
179	398	328	67
180	313	351	65
180	326	325	61
180	397	400	64
180	369	313	70
180	301	348	73
180	349	366	75
180	387	332	72
180	378	315	80
180	337	316	72
180	328	397	62
181	357	364	80
181	382	330	62
181	332	347	73
181	312	380	71
181	373	343	78
181	380	364	66
181	328	367	79
181	344	388	63
181	333	305	80
181	356	394	72
182	346	324	62
182	319	337	62
182	375	322	70
182	387	346	69
182	379	372	78
182	341	382	77
182	350	305	61
182	322	306	69
182	400	348	69
182	302	307	68
183	343	388	69
183	370	338	80
183	330	374	74
183	331	349	67
183	398	357	80
183	334	353	70
183	318	372	66
183	396	385	65
183	351	379	74
183	394	326	80
184	301	394	79
184	382	375	62
184	326	379	74
184	377	355	65
184	355	323	75
184	384	372	79
184	367	374	61
184	351	302	79
184	389	343	61
184	324	387	71
185	374	318	76
185	356	311	70
185	335	360	61
185	360	322	77
185	326	323	79
185	301	330	63
185	331	318	64
185	313	392	73
185	361	365	77
185	305	311	70
186	384	375	66
186	342	389	79
186	359	303	63
186	336	373	75
186	341	316	74
186	334	323	69
186	325	309	78
186	394	302	64
186	337	327	69
186	305	350	75
187	366	363	74
187	381	332	74
187	335	337	72
187	363	335	67
187	367	327	73
187	389	309	67
187	394	350	69
187	349	317	70
187	352	341	63
187	388	365	61
188	350	311	75
188	361	351	73
188	335	347	65
188	377	395	64
188	400	329	73
188	302	341	71
188	379	303	75
188	376	364	71
188	368	314	62
188	319	398	75
189	303	369	71
189	318	358	72
189	330	322	61
189	387	357	66
189	361	315	76
189	312	385	71
189	316	398	61
189	348	309	69
189	339	334	73
189	304	323	61
190	371	371	75
190	309	315	78
190	308	368	79
190	370	358	79
190	333	343	75
190	400	366	69
190	366	373	69
190	337	377	67
190	386	383	75
190	307	316	80
191	385	395	76
191	346	355	71
191	394	344	64
191	374	354	79
191	307	369	71
191	313	381	68
191	345	322	69
191	386	370	62
191	319	305	71
191	371	319	78
192	380	381	71
192	392	368	70
192	369	384	62
192	316	351	69
192	333	370	74
192	322	380	72
192	364	366	75
192	394	378	63
192	342	333	61
192	345	329	61
193	302	318	76
193	344	374	69
193	396	379	61
193	326	334	64
193	364	393	74
193	377	357	63
193	328	363	78
193	397	345	68
193	339	370	79
193	392	374	73
194	361	324	70
194	336	328	68
194	373	365	65
194	354	392	67
194	378	351	67
194	360	399	72
194	321	384	69
194	376	357	64
194	301	370	76
194	364	346	75
195	368	331	66
195	339	359	69
195	367	399	71
195	312	359	64
195	342	337	67
195	307	383	62
195	314	367	72
195	347	375	67
195	362	301	69
195	385	354	74
196	331	331	75
196	391	363	72
196	326	379	64
196	341	304	79
196	377	381	73
196	333	389	61
196	347	382	65
196	301	362	79
196	338	375	63
196	397	339	75
197	387	343	64
197	340	386	74
197	384	368	65
197	335	327	72
197	333	334	72
197	307	336	68
197	391	343	73
197	334	341	79
197	395	307	67
197	306	385	73
198	396	400	71
198	383	326	62
198	390	346	67
198	375	370	78
198	358	384	67
198	371	394	66
198	373	397	79
198	387	319	76
198	334	344	74
198	374	343	63
199	326	333	74
199	339	341	61
199	320	366	74
199	364	339	63
199	303	393	65
199	377	327	75
199	313	359	65
199	399	395	70
199	346	340	70
199	363	313	63
200	381	371	77
200	308	309	70
200	378	303	67
200	359	390	74
200	304	359	78
200	377	380	64
200	356	330	70
200	307	391	70
200	349	339	77
200	379	312	69
\.


--
-- Data for Name: roshan_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roshan_events (event_id, match_id, team_id, "timestamp") FROM stdin;
84	152	345	2025-06-23 22:04:38.641902
85	153	374	2025-06-23 21:16:06.860616
86	155	307	2025-06-23 21:12:04.850829
87	163	351	2025-06-23 21:07:20.705268
88	165	311	2025-06-23 22:37:01.847025
89	169	377	2025-06-23 20:38:10.620874
90	171	380	2025-06-23 22:52:06.302546
91	174	350	2025-06-23 22:22:59.446745
92	176	374	2025-06-23 21:46:35.50323
93	177	339	2025-06-23 21:54:14.644299
94	178	368	2025-06-23 22:48:31.387571
95	183	389	2025-06-23 20:42:11.080044
96	186	331	2025-06-23 21:47:12.015202
97	187	366	2025-06-23 22:26:32.494291
98	191	347	2025-06-23 21:20:44.190784
99	192	315	2025-06-23 22:38:51.240001
100	193	301	2025-06-23 20:34:55.629714
101	194	331	2025-06-23 21:34:25.338519
102	200	342	2025-06-23 22:08:56.827579
\.


--
-- Data for Name: rune_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rune_events (event_id, match_id, player_id, rune_type, "timestamp") FROM stdin;
439	151	310	Haste	2025-06-23 23:12:13.714857
440	151	383	Double Damage	2025-06-23 21:41:23.990695
441	152	303	Haste	2025-06-23 20:57:01.881543
442	153	389	Double Damage	2025-06-23 22:05:52.992723
443	153	334	Illusion	2025-06-23 21:17:28.786926
444	154	314	Illusion	2025-06-23 21:04:49.980058
445	154	307	Haste	2025-06-23 21:33:49.225382
446	154	324	Regeneration	2025-06-23 22:38:55.259838
447	154	323	Illusion	2025-06-23 22:32:20.350067
448	154	395	Haste	2025-06-23 21:11:46.098698
449	155	315	Illusion	2025-06-23 23:15:24.393417
450	155	354	Double Damage	2025-06-23 22:11:08.572741
451	155	367	Regeneration	2025-06-23 21:19:15.33853
452	155	364	Haste	2025-06-23 20:39:52.995807
453	156	348	Double Damage	2025-06-23 22:28:57.978177
454	156	317	Double Damage	2025-06-23 22:35:42.276719
455	156	349	Regeneration	2025-06-23 20:31:19.790461
456	157	302	Double Damage	2025-06-23 23:20:09.80078
457	158	353	Regeneration	2025-06-23 21:19:44.590708
458	158	339	Double Damage	2025-06-23 22:42:57.278632
459	159	365	Illusion	2025-06-23 22:20:54.077429
460	159	389	Haste	2025-06-23 23:10:04.471749
461	159	391	Regeneration	2025-06-23 22:47:12.918844
462	159	340	Haste	2025-06-23 23:07:10.757985
463	159	331	Illusion	2025-06-23 22:52:49.136321
464	160	310	Haste	2025-06-23 23:14:41.355129
465	160	369	Haste	2025-06-23 22:48:01.608117
466	160	391	Regeneration	2025-06-23 22:58:25.863903
467	160	319	Illusion	2025-06-23 23:06:08.399708
468	161	369	Illusion	2025-06-23 23:09:37.60075
469	162	317	Illusion	2025-06-23 20:30:37.48254
470	162	310	Double Damage	2025-06-23 21:51:58.189733
471	162	376	Double Damage	2025-06-23 23:22:39.28378
472	162	366	Haste	2025-06-23 23:00:46.15105
473	162	381	Regeneration	2025-06-23 21:29:54.281027
474	163	322	Haste	2025-06-23 21:53:04.111073
475	164	314	Haste	2025-06-23 23:19:02.746988
476	165	346	Haste	2025-06-23 20:57:59.401551
477	165	301	Double Damage	2025-06-23 23:08:07.909557
478	166	334	Illusion	2025-06-23 21:20:05.107183
479	166	392	Double Damage	2025-06-23 21:38:34.716822
480	166	314	Double Damage	2025-06-23 22:40:24.399122
481	166	381	Regeneration	2025-06-23 20:35:12.834164
482	166	370	Regeneration	2025-06-23 22:17:16.800451
483	167	380	Haste	2025-06-23 21:03:42.196312
484	167	304	Regeneration	2025-06-23 20:52:43.253824
485	167	324	Double Damage	2025-06-23 22:52:08.981803
486	168	362	Haste	2025-06-23 21:08:08.816448
487	168	390	Illusion	2025-06-23 22:08:00.347162
488	168	376	Haste	2025-06-23 21:09:25.983875
489	168	369	Illusion	2025-06-23 22:11:05.008672
490	169	383	Regeneration	2025-06-23 21:28:08.397494
491	169	333	Double Damage	2025-06-23 22:58:50.857913
492	169	363	Illusion	2025-06-23 22:11:29.133679
493	169	376	Regeneration	2025-06-23 20:26:08.770357
494	170	311	Illusion	2025-06-23 22:26:09.389521
495	170	322	Illusion	2025-06-23 21:24:34.361499
496	170	381	Regeneration	2025-06-23 22:01:41.836648
497	171	309	Haste	2025-06-23 21:36:04.44891
498	171	304	Double Damage	2025-06-23 20:23:53.917327
499	171	315	Illusion	2025-06-23 22:13:04.39139
500	172	318	Double Damage	2025-06-23 20:43:35.879572
501	172	334	Double Damage	2025-06-23 21:21:20.251674
502	172	393	Double Damage	2025-06-23 21:58:41.168495
503	173	317	Regeneration	2025-06-23 20:57:00.764723
504	173	355	Regeneration	2025-06-23 22:42:08.492714
505	173	379	Illusion	2025-06-23 21:33:42.300162
506	174	382	Regeneration	2025-06-23 23:02:14.626713
507	175	330	Haste	2025-06-23 22:57:24.981667
508	175	308	Regeneration	2025-06-23 22:58:19.482478
509	176	393	Regeneration	2025-06-23 21:30:42.421736
510	176	349	Illusion	2025-06-23 23:16:26.903208
511	176	321	Regeneration	2025-06-23 22:50:16.19942
512	176	320	Double Damage	2025-06-23 23:03:32.484644
513	177	353	Haste	2025-06-23 20:27:21.41136
514	178	325	Double Damage	2025-06-23 21:20:42.19589
515	178	390	Double Damage	2025-06-23 23:03:24.990496
516	178	339	Illusion	2025-06-23 20:33:21.233082
517	179	325	Haste	2025-06-23 20:30:33.427729
518	179	307	Regeneration	2025-06-23 22:46:27.812585
519	180	395	Haste	2025-06-23 21:29:52.616328
520	180	363	Haste	2025-06-23 21:16:57.460631
521	180	393	Illusion	2025-06-23 22:21:41.847159
522	181	364	Illusion	2025-06-23 21:25:24.977776
523	182	358	Double Damage	2025-06-23 21:28:40.223682
524	182	367	Illusion	2025-06-23 20:59:16.069848
525	182	350	Double Damage	2025-06-23 22:45:12.517692
526	182	399	Regeneration	2025-06-23 21:37:39.167267
527	183	336	Illusion	2025-06-23 22:31:25.546748
528	183	331	Haste	2025-06-23 22:24:13.038773
529	184	383	Haste	2025-06-23 20:25:06.322874
530	185	342	Regeneration	2025-06-23 21:15:15.784919
531	185	363	Illusion	2025-06-23 20:25:21.91396
532	186	359	Illusion	2025-06-23 21:34:15.848359
533	186	348	Illusion	2025-06-23 20:55:33.913311
534	186	364	Illusion	2025-06-23 21:15:54.34639
535	186	355	Double Damage	2025-06-23 21:31:11.11886
536	187	317	Regeneration	2025-06-23 20:56:00.691082
537	188	348	Double Damage	2025-06-23 22:38:33.361309
538	188	370	Haste	2025-06-23 23:17:21.543519
539	189	314	Regeneration	2025-06-23 22:27:44.981978
540	189	365	Regeneration	2025-06-23 21:16:59.057554
541	190	390	Regeneration	2025-06-23 21:19:35.505965
542	190	332	Regeneration	2025-06-23 21:52:46.988908
543	191	384	Illusion	2025-06-23 20:59:46.667702
544	191	333	Illusion	2025-06-23 21:30:48.491821
545	191	361	Regeneration	2025-06-23 23:23:32.746098
546	191	346	Double Damage	2025-06-23 23:09:04.629685
547	192	367	Regeneration	2025-06-23 21:08:53.466843
548	192	397	Haste	2025-06-23 20:35:21.626969
549	192	376	Haste	2025-06-23 22:17:21.937516
550	193	384	Illusion	2025-06-23 21:35:01.019134
551	193	371	Regeneration	2025-06-23 22:31:33.998457
552	193	314	Regeneration	2025-06-23 21:55:30.524106
553	194	399	Illusion	2025-06-23 20:52:27.800962
554	194	310	Illusion	2025-06-23 22:59:15.208646
555	194	376	Regeneration	2025-06-23 22:05:58.294187
556	195	364	Illusion	2025-06-23 23:01:15.264531
557	195	302	Illusion	2025-06-23 20:39:46.932365
558	195	343	Haste	2025-06-23 21:54:33.828082
559	196	351	Illusion	2025-06-23 22:36:16.927757
560	196	317	Double Damage	2025-06-23 20:57:35.957043
561	197	375	Illusion	2025-06-23 20:33:50.565095
562	197	395	Double Damage	2025-06-23 21:28:05.982879
563	197	388	Illusion	2025-06-23 21:02:16.668233
564	197	373	Illusion	2025-06-23 20:33:42.32598
565	198	387	Illusion	2025-06-23 22:40:39.197231
566	198	330	Regeneration	2025-06-23 22:28:01.05664
567	198	318	Illusion	2025-06-23 21:46:19.727781
568	199	306	Haste	2025-06-23 21:20:27.158588
569	199	364	Double Damage	2025-06-23 22:24:44.088949
570	199	383	Haste	2025-06-23 21:47:08.96181
571	199	314	Double Damage	2025-06-23 21:51:19.51403
572	200	318	Illusion	2025-06-23 20:40:12.328308
573	200	346	Regeneration	2025-06-23 21:16:16.280529
574	200	301	Double Damage	2025-06-23 22:53:11.358877
\.


--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_members (team_id, profile_id, start_date, end_date) FROM stdin;
301	314	2024-07-11	2025-01-05
301	395	2025-02-03	2025-04-03
301	332	2024-06-25	2024-11-01
301	362	2024-10-01	2024-11-14
301	399	2024-11-30	2025-02-24
302	317	2024-09-15	2025-03-12
302	339	2025-06-20	2025-09-02
302	350	2025-04-22	2025-08-25
302	330	2025-05-12	2025-07-31
302	390	2024-08-12	2025-01-19
303	345	2025-02-03	2025-07-20
303	382	2024-10-09	2024-11-19
303	377	2025-03-10	2025-08-10
303	388	2024-12-29	2025-02-16
303	342	2025-05-29	2025-09-06
304	388	2025-04-13	2025-06-22
304	323	2024-08-13	2024-11-29
304	352	2024-10-13	2025-03-12
304	332	2025-02-22	2025-06-15
304	354	2025-05-07	2025-08-20
305	387	2024-08-06	2025-01-27
305	376	2025-04-17	2025-08-16
305	337	2025-04-12	2025-07-20
305	394	2025-04-22	2025-08-24
305	370	2025-01-14	2025-05-17
306	371	2024-07-03	2024-10-08
306	317	2025-02-13	2025-07-22
306	310	2025-03-19	2025-08-07
306	359	2025-03-13	2025-06-03
306	381	2025-02-03	2025-04-09
307	308	2024-08-24	2025-01-31
307	316	2025-01-30	2025-06-25
307	368	2024-07-05	2024-12-19
307	355	2025-01-10	2025-05-26
307	330	2024-11-04	2025-03-06
308	382	2024-08-03	2025-01-04
308	355	2025-03-08	2025-05-16
308	327	2025-01-15	2025-04-11
308	379	2025-05-28	2025-07-30
308	373	2024-12-18	2025-03-22
309	344	2024-09-05	2025-02-21
309	343	2025-01-18	2025-06-14
309	364	2025-04-01	2025-07-08
309	377	2024-09-03	2025-01-27
309	350	2024-11-30	2025-04-11
310	369	2025-05-17	2025-07-14
310	329	2025-06-21	2025-09-08
310	382	2024-10-02	2025-01-18
310	351	2024-09-02	2024-10-26
310	368	2025-05-20	2025-06-22
311	369	2024-11-19	2024-12-25
311	349	2025-02-08	2025-03-21
311	399	2025-01-09	2025-04-15
311	326	2024-09-04	2025-01-04
311	346	2025-06-22	2025-08-08
312	375	2024-08-06	2024-09-21
312	325	2024-10-15	2024-12-15
312	317	2024-06-24	2024-09-05
312	341	2024-09-03	2025-01-29
312	373	2024-11-21	2025-04-03
313	325	2024-12-08	2025-03-19
313	366	2024-11-21	2025-04-29
313	317	2024-12-18	2025-04-30
313	383	2024-12-12	2025-06-10
313	394	2025-05-27	2025-09-18
314	365	2024-07-16	2024-11-22
314	396	2024-08-02	2024-09-29
314	305	2025-05-09	2025-07-09
314	385	2025-02-06	2025-05-20
314	364	2025-02-08	2025-04-28
315	353	2025-05-11	2025-08-29
315	310	2024-12-27	2025-03-01
315	367	2025-04-22	2025-06-29
315	359	2024-11-30	2024-12-30
315	301	2024-12-11	2025-05-05
316	378	2024-11-20	2025-01-05
316	324	2025-01-28	2025-03-23
316	307	2024-07-28	2024-12-23
316	393	2024-07-01	2024-09-13
316	321	2025-02-21	2025-03-24
317	361	2024-09-24	2024-11-13
317	369	2024-09-19	2024-12-02
317	375	2025-03-09	2025-08-22
317	339	2025-02-23	2025-06-11
317	389	2025-04-16	2025-06-12
318	355	2025-04-13	2025-06-25
318	389	2025-04-17	2025-05-30
318	385	2024-07-04	2024-08-12
318	334	2025-01-03	2025-04-12
318	352	2025-01-24	2025-06-03
319	328	2025-03-09	2025-05-27
319	370	2025-06-08	2025-11-29
319	359	2025-01-06	2025-03-20
319	364	2025-03-03	2025-05-04
319	399	2025-03-03	2025-05-19
320	361	2024-08-25	2024-11-10
320	307	2024-07-14	2024-11-08
320	357	2024-10-04	2025-03-12
320	320	2025-01-08	2025-04-28
320	376	2025-02-23	2025-06-05
321	372	2024-09-08	2025-02-22
321	305	2024-06-28	2024-10-16
321	347	2025-01-06	2025-06-23
321	399	2024-07-30	2024-12-21
321	367	2025-05-08	2025-09-21
322	337	2024-10-28	2024-11-29
322	392	2024-08-01	2024-12-23
322	313	2025-01-26	2025-05-03
322	386	2024-12-18	2025-04-06
322	382	2024-09-29	2025-02-12
323	339	2024-10-27	2025-01-20
323	353	2024-10-22	2025-03-10
323	314	2024-10-19	2025-03-28
323	306	2025-03-13	2025-06-29
323	355	2024-07-06	2024-12-01
324	400	2024-08-12	2024-10-18
324	336	2024-07-25	2024-10-04
324	373	2025-03-13	2025-06-08
324	383	2025-04-16	2025-05-27
324	344	2025-04-02	2025-06-04
325	320	2024-06-26	2024-11-05
325	371	2025-06-14	2025-08-27
325	352	2025-03-25	2025-04-28
325	323	2025-06-09	2025-08-26
325	324	2025-06-08	2025-08-05
326	309	2024-09-16	2024-11-13
326	347	2025-01-28	2025-04-10
326	370	2024-08-27	2024-12-27
326	358	2024-09-24	2025-03-16
326	395	2024-10-31	2024-12-30
327	334	2025-01-26	2025-04-05
327	338	2025-03-03	2025-08-14
327	364	2024-07-24	2024-12-30
327	301	2024-12-02	2025-05-02
327	347	2025-03-06	2025-06-11
328	370	2024-09-30	2024-11-07
328	398	2024-08-06	2024-12-25
328	309	2025-04-13	2025-08-01
328	337	2024-08-01	2025-01-13
328	311	2025-06-19	2025-08-29
329	376	2024-07-10	2024-10-21
329	328	2024-08-23	2024-10-02
329	343	2024-11-22	2025-05-05
329	313	2024-12-30	2025-03-19
329	379	2024-11-09	2025-04-01
330	321	2024-11-15	2025-01-28
330	380	2025-05-25	2025-09-07
330	305	2025-03-08	2025-08-16
330	378	2024-11-06	2025-03-12
330	332	2024-07-01	2024-11-27
331	396	2025-04-02	2025-09-22
331	311	2024-08-20	2024-12-21
331	394	2024-11-09	2025-01-12
331	381	2025-02-19	2025-04-20
331	347	2024-07-07	2024-10-16
332	317	2025-02-16	2025-08-15
332	370	2024-11-20	2025-03-31
332	301	2024-08-12	2025-01-02
332	375	2025-01-19	2025-06-30
332	398	2024-11-27	2025-04-21
333	394	2025-06-11	2025-07-12
333	355	2024-07-27	2024-12-19
333	343	2024-08-18	2024-12-07
333	371	2025-04-09	2025-05-17
333	323	2024-11-27	2025-04-04
334	383	2024-09-02	2024-11-14
334	359	2025-03-02	2025-05-30
334	342	2025-01-12	2025-03-28
334	306	2025-06-14	2025-08-12
334	375	2025-06-13	2025-10-16
335	341	2025-02-13	2025-07-03
335	382	2024-11-06	2025-01-25
335	395	2024-12-20	2025-03-24
335	399	2025-04-24	2025-05-30
335	397	2024-08-27	2024-11-29
336	346	2024-08-27	2025-01-03
336	316	2025-03-22	2025-07-28
336	304	2024-10-12	2025-03-29
336	344	2024-09-07	2024-10-28
336	328	2025-01-08	2025-04-26
337	354	2024-09-02	2025-02-11
337	341	2024-11-29	2025-02-06
337	343	2024-11-16	2025-04-21
337	318	2024-10-15	2025-04-09
337	351	2024-06-27	2024-11-15
338	384	2024-06-25	2024-08-22
338	378	2025-01-09	2025-06-14
338	374	2024-11-07	2025-03-23
338	310	2025-06-15	2025-08-08
338	356	2025-05-03	2025-10-18
339	383	2025-02-02	2025-06-28
339	382	2025-04-08	2025-09-12
339	388	2025-03-27	2025-09-20
339	328	2025-02-21	2025-08-11
339	391	2025-06-18	2025-10-23
340	322	2024-07-10	2024-10-27
340	371	2024-12-06	2025-05-14
340	316	2025-03-29	2025-09-08
340	338	2025-05-26	2025-07-29
340	352	2024-07-31	2024-09-06
341	390	2024-10-11	2025-02-13
341	355	2025-01-30	2025-06-19
341	340	2024-12-08	2025-02-15
341	311	2025-06-16	2025-10-09
341	338	2024-07-31	2024-10-09
342	391	2025-02-23	2025-06-06
342	346	2025-01-30	2025-03-20
342	394	2025-01-24	2025-03-20
342	376	2024-06-28	2024-10-20
342	345	2024-10-13	2025-03-13
343	373	2024-09-06	2024-12-05
343	325	2024-07-07	2024-11-14
343	301	2024-11-04	2024-12-30
343	305	2025-01-16	2025-03-18
343	395	2025-04-14	2025-09-18
344	331	2025-01-01	2025-05-23
344	334	2025-03-03	2025-05-15
344	341	2025-01-31	2025-04-27
344	363	2024-07-22	2024-10-26
344	315	2024-07-17	2024-12-18
345	314	2024-08-19	2025-02-03
345	394	2025-01-09	2025-05-31
345	318	2024-10-05	2025-01-14
345	311	2025-04-23	2025-06-06
345	305	2025-06-03	2025-10-07
346	391	2025-05-26	2025-09-03
346	310	2025-02-11	2025-03-31
346	388	2025-05-17	2025-08-29
346	348	2025-01-12	2025-04-09
346	347	2024-08-21	2024-11-04
347	327	2025-04-05	2025-08-13
347	395	2024-09-04	2024-11-27
347	364	2025-06-08	2025-07-18
347	392	2025-03-31	2025-08-16
347	318	2024-10-25	2025-02-28
348	318	2025-02-12	2025-05-01
348	350	2025-01-12	2025-04-09
348	345	2025-03-27	2025-07-19
348	301	2024-11-03	2025-01-08
348	356	2025-01-31	2025-03-03
349	370	2025-04-19	2025-08-19
349	381	2024-10-13	2024-12-23
349	372	2025-04-13	2025-05-22
349	357	2024-11-03	2025-01-19
349	363	2024-10-04	2024-12-11
350	308	2024-10-01	2024-12-20
350	338	2025-04-23	2025-06-24
350	331	2024-09-26	2025-03-16
350	394	2024-07-27	2024-09-04
350	340	2025-05-27	2025-08-26
351	325	2025-05-22	2025-09-26
351	358	2024-10-30	2025-03-26
351	345	2024-10-29	2025-02-14
351	378	2025-06-09	2025-10-29
351	379	2024-09-21	2025-02-27
352	398	2025-06-14	2025-11-15
352	337	2025-05-18	2025-07-01
352	376	2024-11-20	2025-01-18
352	378	2025-06-19	2025-08-11
352	375	2024-11-21	2025-01-25
353	315	2024-08-10	2024-09-14
353	394	2024-07-20	2024-11-28
353	350	2024-12-01	2025-03-16
353	312	2025-02-03	2025-06-12
353	358	2024-10-01	2025-02-04
354	329	2024-07-31	2024-12-11
354	368	2024-12-07	2025-02-18
354	315	2024-08-13	2024-10-26
354	336	2024-11-10	2025-04-12
354	350	2025-02-04	2025-06-12
355	385	2024-10-02	2024-12-13
355	348	2024-11-03	2025-01-26
355	316	2025-06-20	2025-08-14
355	358	2025-01-24	2025-04-22
355	387	2024-12-09	2025-01-12
356	354	2024-12-09	2025-01-31
356	394	2025-05-18	2025-07-28
356	390	2025-05-03	2025-06-12
356	339	2025-02-01	2025-05-14
356	372	2025-04-16	2025-08-24
357	307	2025-06-05	2025-09-14
357	357	2025-04-01	2025-06-15
357	367	2025-03-04	2025-08-11
357	386	2025-01-10	2025-03-27
357	396	2025-02-15	2025-08-04
358	388	2025-04-24	2025-06-14
358	321	2025-05-26	2025-07-06
358	337	2025-04-23	2025-06-04
358	360	2024-12-04	2025-04-17
358	343	2025-03-02	2025-07-27
359	309	2025-04-06	2025-05-21
359	395	2025-06-01	2025-10-10
359	317	2025-06-21	2025-10-16
359	396	2024-10-09	2025-01-27
359	326	2025-03-08	2025-05-05
360	330	2025-05-01	2025-07-30
360	327	2025-01-28	2025-05-17
360	369	2024-10-27	2025-01-04
360	394	2025-01-12	2025-06-08
360	309	2024-11-28	2025-05-24
361	380	2024-12-04	2025-04-27
361	357	2024-11-15	2025-03-25
361	353	2024-11-10	2025-03-27
361	381	2025-03-01	2025-06-02
361	379	2025-05-22	2025-11-17
362	369	2024-06-28	2024-12-03
362	389	2025-06-22	2025-11-06
362	353	2025-01-09	2025-05-10
362	330	2024-10-30	2025-01-14
362	334	2025-03-02	2025-04-19
363	353	2024-12-24	2025-02-20
363	371	2024-12-01	2025-02-20
363	389	2024-11-29	2025-05-11
363	383	2025-02-07	2025-05-23
363	395	2025-03-11	2025-07-06
364	324	2025-02-05	2025-04-15
364	322	2024-10-14	2025-01-29
364	351	2025-04-05	2025-08-12
364	400	2025-02-04	2025-05-07
364	350	2025-02-09	2025-04-27
365	322	2025-05-10	2025-09-06
365	344	2025-02-15	2025-07-31
365	397	2025-05-01	2025-08-01
365	358	2025-02-24	2025-07-15
365	324	2025-05-14	2025-08-29
366	368	2024-08-25	2024-12-17
366	333	2025-02-05	2025-06-10
366	336	2024-12-08	2025-01-23
366	360	2024-09-28	2024-11-15
366	382	2024-10-02	2024-11-27
367	383	2024-09-30	2025-01-27
367	316	2024-11-19	2025-04-11
367	375	2025-06-08	2025-10-26
367	304	2025-01-11	2025-06-16
367	339	2025-05-23	2025-10-28
368	355	2025-02-01	2025-07-25
368	382	2025-05-03	2025-07-18
368	390	2025-06-01	2025-09-06
368	322	2024-09-28	2024-12-05
368	306	2024-11-04	2025-01-18
369	357	2025-01-20	2025-03-27
369	356	2024-06-23	2024-08-04
369	337	2025-02-26	2025-05-16
369	385	2025-02-08	2025-07-05
369	365	2025-01-07	2025-03-14
370	378	2024-07-12	2024-10-08
370	375	2025-05-28	2025-06-30
370	379	2024-11-14	2024-12-23
370	332	2024-08-05	2024-12-18
370	313	2024-12-10	2025-06-03
371	392	2024-10-20	2024-11-20
371	377	2024-11-06	2025-01-02
371	340	2025-04-02	2025-06-19
371	329	2024-08-01	2024-11-13
371	355	2025-04-27	2025-07-08
372	372	2024-10-19	2025-02-11
372	327	2024-08-04	2024-11-03
372	376	2024-07-17	2024-10-13
372	397	2024-09-22	2024-11-26
372	312	2024-06-23	2024-10-24
373	389	2024-10-31	2025-03-24
373	354	2024-10-22	2025-01-17
373	366	2025-04-26	2025-07-29
373	313	2024-07-14	2024-08-26
373	310	2025-06-08	2025-11-26
374	383	2024-09-30	2024-11-11
374	385	2024-12-26	2025-05-25
374	326	2024-12-18	2025-02-09
374	339	2024-11-01	2025-01-06
374	336	2025-02-08	2025-04-12
375	369	2025-06-13	2025-08-15
375	381	2025-05-04	2025-08-09
375	332	2025-02-11	2025-06-03
375	334	2024-12-11	2025-06-04
375	399	2025-01-05	2025-03-03
376	372	2024-07-08	2024-12-27
376	323	2025-02-23	2025-04-20
376	362	2025-03-15	2025-06-25
376	373	2024-12-11	2025-01-13
376	375	2024-10-15	2024-12-12
377	341	2025-05-27	2025-07-22
377	323	2025-01-06	2025-03-08
377	338	2024-11-27	2025-05-10
377	348	2024-11-16	2025-04-02
377	398	2024-11-29	2025-05-10
378	343	2024-12-08	2025-02-13
378	399	2025-03-14	2025-06-30
378	348	2024-07-10	2024-11-14
378	360	2025-02-07	2025-04-12
378	345	2025-02-05	2025-06-24
379	372	2024-11-18	2025-04-23
379	382	2024-08-21	2025-01-25
379	320	2025-06-02	2025-09-28
379	318	2025-03-07	2025-04-23
379	301	2024-12-09	2025-03-16
380	334	2024-12-22	2025-03-23
380	338	2024-11-19	2025-01-28
380	359	2025-01-11	2025-05-10
380	329	2025-04-10	2025-09-10
380	366	2024-10-19	2025-01-26
381	334	2024-06-27	2024-12-02
381	339	2024-12-24	2025-01-27
381	328	2024-08-23	2024-12-27
381	354	2025-05-02	2025-08-10
381	344	2024-12-28	2025-05-24
382	352	2025-03-02	2025-08-26
382	396	2025-01-20	2025-05-01
382	310	2025-04-05	2025-08-29
382	358	2024-09-21	2025-01-31
382	340	2025-02-27	2025-07-26
383	333	2024-06-22	2024-11-04
383	311	2025-03-04	2025-07-04
383	339	2025-01-15	2025-07-03
383	388	2024-10-29	2025-01-08
383	376	2024-10-30	2025-02-27
384	340	2024-09-11	2024-10-17
384	352	2025-04-19	2025-08-18
384	337	2025-01-08	2025-04-04
384	326	2024-09-07	2025-02-12
384	339	2024-08-08	2024-11-10
385	378	2024-12-01	2025-02-22
385	350	2025-03-05	2025-08-25
385	358	2025-01-08	2025-02-09
385	391	2024-07-19	2024-11-15
385	326	2025-05-21	2025-10-23
386	350	2025-06-22	2025-11-24
386	398	2025-05-14	2025-08-04
386	319	2024-11-29	2025-04-28
386	335	2024-07-21	2024-08-28
386	371	2024-07-29	2024-11-13
387	361	2024-12-13	2025-04-01
387	389	2025-02-11	2025-06-14
387	387	2024-12-17	2025-01-19
387	354	2025-05-08	2025-07-16
387	333	2024-10-16	2024-12-17
388	317	2024-10-13	2025-01-26
388	370	2024-09-23	2024-11-22
388	366	2025-05-01	2025-06-24
388	306	2025-04-20	2025-06-30
388	385	2025-06-03	2025-10-30
389	330	2025-04-13	2025-06-14
389	385	2025-04-16	2025-09-08
389	388	2024-10-05	2025-04-03
389	383	2025-04-02	2025-05-20
389	364	2025-03-07	2025-08-08
390	354	2025-01-28	2025-05-17
390	312	2025-01-14	2025-07-12
390	329	2024-06-27	2024-09-27
390	313	2025-05-27	2025-07-22
390	344	2025-02-11	2025-07-06
391	317	2024-10-21	2025-01-21
391	324	2024-11-17	2025-01-09
391	318	2025-02-26	2025-03-30
391	358	2025-06-04	2025-10-15
391	394	2024-10-02	2025-02-10
392	392	2024-09-17	2025-02-10
392	387	2025-04-24	2025-09-25
392	327	2024-06-30	2024-11-14
392	301	2024-07-02	2024-09-22
392	321	2024-07-08	2024-11-21
393	320	2025-02-04	2025-05-21
393	396	2025-01-11	2025-04-16
393	310	2025-03-07	2025-06-21
393	345	2025-02-09	2025-04-04
393	303	2025-05-18	2025-08-16
394	306	2025-04-18	2025-09-03
394	318	2025-06-16	2025-08-27
394	395	2025-03-21	2025-07-17
394	328	2025-05-30	2025-08-16
394	353	2024-08-05	2024-12-04
395	400	2025-01-29	2025-06-10
395	322	2024-07-07	2024-08-11
395	326	2025-03-23	2025-07-06
395	370	2025-01-03	2025-03-21
395	362	2025-03-28	2025-05-24
396	332	2024-07-26	2024-11-26
396	336	2024-07-23	2024-11-06
396	314	2024-06-28	2024-09-23
396	306	2025-01-02	2025-06-15
396	352	2024-07-24	2024-11-16
397	318	2025-04-19	2025-07-02
397	323	2024-10-24	2025-02-04
397	383	2025-05-02	2025-10-23
397	315	2024-07-30	2024-12-20
397	346	2024-08-24	2025-01-14
398	390	2025-05-08	2025-10-31
398	324	2024-10-18	2025-01-31
398	395	2025-05-07	2025-09-06
398	343	2025-06-09	2025-11-29
398	350	2025-06-05	2025-09-28
399	318	2024-11-03	2025-03-28
399	363	2025-04-13	2025-09-20
399	382	2025-03-10	2025-04-21
399	350	2025-02-03	2025-04-25
399	349	2025-02-20	2025-06-23
400	379	2024-06-28	2024-08-28
400	339	2025-04-20	2025-08-17
400	349	2024-07-05	2024-11-04
400	366	2025-04-07	2025-09-23
400	386	2024-09-04	2024-11-23
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team_id, name, region) FROM stdin;
301	Team Green	Haiti
302	Team DeepSkyBlue	Antigua and Barbuda
303	Team FireBrick	Japan
304	Team DodgerBlue	Moldova
305	Team Orange	Tuvalu
306	Team MediumSlateBlue	Christmas Island
307	Team SpringGreen	Rwanda
308	Team MidnightBlue	Nepal
309	Team RosyBrown	British Indian Ocean Territory (Chagos Archipelago)
310	Team MediumSlateBlue	Montserrat
311	Team PaleGreen	Mayotte
312	Team MediumSpringGreen	Nauru
313	Team Pink	United States of America
314	Team LightCoral	Chile
315	Team Chocolate	Cuba
316	Team SandyBrown	Syrian Arab Republic
317	Team PaleGoldenRod	New Caledonia
318	Team MediumAquaMarine	Denmark
319	Team DeepSkyBlue	Uzbekistan
320	Team HotPink	Saint Barthelemy
321	Team Tomato	Reunion
322	Team LightSteelBlue	Timor-Leste
323	Team Black	Wallis and Futuna
324	Team Aqua	El Salvador
325	Team Gainsboro	Liechtenstein
326	Team Beige	United Arab Emirates
327	Team Chartreuse	Andorra
328	Team SaddleBrown	Korea
329	Team SlateGray	Saint Martin
330	Team LightGoldenRodYellow	Nigeria
331	Team LightSkyBlue	Canada
332	Team DarkViolet	Bahamas
333	Team Brown	Hong Kong
334	Team OldLace	Tajikistan
335	Team ForestGreen	Suriname
336	Team Teal	San Marino
337	Team PaleVioletRed	Malaysia
338	Team Indigo	New Zealand
339	Team LavenderBlush	Cape Verde
340	Team SeaGreen	Pakistan
341	Team FloralWhite	Monaco
342	Team LightSlateGray	Jersey
343	Team Blue	Zambia
344	Team Peru	Brunei Darussalam
345	Team MediumSeaGreen	Mayotte
346	Team DarkSlateGray	Grenada
347	Team SlateBlue	Guatemala
348	Team PeachPuff	Norfolk Island
349	Team SpringGreen	Nigeria
350	Team MintCream	Svalbard & Jan Mayen Islands
351	Team Tomato	Venezuela
352	Team LightSteelBlue	Falkland Islands (Malvinas)
353	Team MistyRose	Bahamas
354	Team DarkOliveGreen	Seychelles
355	Team DeepSkyBlue	Japan
356	Team DarkBlue	Northern Mariana Islands
357	Team Red	Moldova
358	Team SaddleBrown	Poland
359	Team GhostWhite	Benin
360	Team Gold	Montenegro
361	Team HoneyDew	Japan
362	Team SlateGray	Marshall Islands
363	Team Wheat	Philippines
364	Team Moccasin	Cote d'Ivoire
365	Team LightGoldenRodYellow	Dominica
366	Team Blue	France
367	Team DarkRed	Uruguay
368	Team DarkSalmon	Guernsey
369	Team Purple	Faroe Islands
370	Team IndianRed	Ukraine
371	Team Linen	Guam
372	Team SlateGray	Kenya
373	Team Thistle	China
374	Team Sienna	Yemen
375	Team LightGray	Heard Island and McDonald Islands
376	Team BurlyWood	Mauritius
377	Team SeaGreen	Malaysia
378	Team Azure	Nauru
379	Team WhiteSmoke	Uzbekistan
380	Team Green	Gabon
381	Team MediumBlue	Saint Helena
382	Team Lavender	Venezuela
383	Team LightBlue	Panama
384	Team DimGray	Central African Republic
385	Team LightCoral	Liberia
386	Team GoldenRod	Spain
387	Team DarkKhaki	Taiwan
388	Team SeaGreen	Morocco
389	Team MediumSpringGreen	Lebanon
390	Team HoneyDew	Rwanda
391	Team Gray	Netherlands Antilles
392	Team Chocolate	Austria
393	Team OldLace	Paraguay
394	Team SandyBrown	Seychelles
395	Team Navy	Guinea-Bissau
396	Team LightSteelBlue	Haiti
397	Team IndianRed	Australia
398	Team Pink	Moldova
399	Team Lavender	Jersey
400	Team Khaki	Saint Pierre and Miquelon
\.


--
-- Data for Name: tournaments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tournaments (tournament_id, name, league_id, start_date, end_date, prize_pool) FROM stdin;
31	Share Cup	16	2024-08-28	2024-10-21	480738.44
32	System Cup	16	2024-07-05	2024-09-03	107492.15
33	Rather Cup	17	2025-03-28	2025-04-11	989102.63
34	Model Cup	17	2024-10-22	2024-12-16	707373.49
35	Gas Cup	18	2025-03-18	2025-06-25	882277.71
36	Purpose Cup	18	2025-03-07	2025-06-01	866495.28
37	Tree Cup	19	2025-05-26	2025-08-01	596615.08
38	Ahead Cup	19	2024-07-10	2024-08-06	755662.28
39	Night Cup	20	2024-12-24	2024-12-27	798956.32
40	Provide Cup	20	2024-10-17	2024-12-26	150032.19
\.


--
-- Data for Name: tower_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tower_events (event_id, match_id, team_id, structure, "timestamp") FROM stdin;
470	151	379	Ancient	2025-06-23 21:11:57.220797
471	151	318	Tower	2025-06-23 21:36:15.623194
472	151	357	Tower	2025-06-23 21:01:54.891752
473	151	344	Ancient	2025-06-23 22:10:42.243253
474	151	387	Tower	2025-06-23 22:40:52.21843
475	152	341	Tower	2025-06-23 20:52:59.399214
476	152	387	Ancient	2025-06-23 21:43:36.368767
477	152	349	Tower	2025-06-23 20:41:04.641227
478	152	303	Tower	2025-06-23 22:18:01.151617
479	152	322	Ancient	2025-06-23 22:14:36.037805
480	153	356	Tower	2025-06-23 22:47:07.549387
481	153	305	Tower	2025-06-23 21:35:54.792102
482	154	323	Ancient	2025-06-23 22:12:54.316807
483	154	324	Barracks	2025-06-23 21:54:55.17739
484	155	313	Ancient	2025-06-23 22:04:25.092355
485	155	321	Tower	2025-06-23 20:39:12.962253
486	156	391	Ancient	2025-06-23 20:41:01.077192
487	156	369	Barracks	2025-06-23 20:52:58.439555
488	156	397	Ancient	2025-06-23 22:46:06.688882
489	156	343	Ancient	2025-06-23 22:55:08.661897
490	157	341	Ancient	2025-06-23 20:32:23.389214
491	157	363	Ancient	2025-06-23 23:04:43.523607
492	157	351	Tower	2025-06-23 20:52:00.63928
493	157	304	Tower	2025-06-23 22:50:49.356009
494	157	337	Ancient	2025-06-23 21:06:21.998371
495	158	348	Tower	2025-06-23 20:57:29.829176
496	158	310	Tower	2025-06-23 22:31:30.63537
497	158	355	Barracks	2025-06-23 21:51:32.815744
498	159	381	Barracks	2025-06-23 22:54:09.169454
499	159	303	Ancient	2025-06-23 21:24:23.877746
500	159	336	Tower	2025-06-23 21:12:39.20937
501	160	395	Ancient	2025-06-23 20:57:09.715523
502	161	317	Barracks	2025-06-23 20:43:02.573135
503	161	341	Barracks	2025-06-23 20:30:55.066023
504	161	309	Tower	2025-06-23 21:22:50.580348
505	161	344	Barracks	2025-06-23 21:30:02.588987
506	161	358	Tower	2025-06-23 20:48:16.058803
507	162	340	Ancient	2025-06-23 21:39:32.905522
508	162	304	Barracks	2025-06-23 20:26:20.879901
509	163	348	Ancient	2025-06-23 22:38:25.805434
510	163	324	Tower	2025-06-23 20:31:35.060833
511	163	361	Barracks	2025-06-23 22:00:33.534225
512	163	363	Barracks	2025-06-23 21:29:28.486768
513	163	328	Ancient	2025-06-23 21:38:45.348063
514	164	358	Tower	2025-06-23 22:52:51.410058
515	164	389	Tower	2025-06-23 21:08:55.387092
516	165	339	Tower	2025-06-23 22:50:08.333307
517	165	342	Barracks	2025-06-23 21:16:26.373177
518	165	378	Tower	2025-06-23 21:37:00.804326
519	166	333	Ancient	2025-06-23 21:36:20.034147
520	166	367	Tower	2025-06-23 21:30:46.786108
521	166	390	Barracks	2025-06-23 21:30:11.006182
522	167	331	Ancient	2025-06-23 21:48:14.114349
523	167	309	Tower	2025-06-23 21:10:56.960618
524	168	317	Tower	2025-06-23 20:48:12.939256
525	168	310	Barracks	2025-06-23 20:37:08.161926
526	169	397	Barracks	2025-06-23 21:26:24.288871
527	169	312	Ancient	2025-06-23 20:48:35.358608
528	170	337	Ancient	2025-06-23 23:08:55.243919
529	170	328	Ancient	2025-06-23 21:05:49.059724
530	170	342	Barracks	2025-06-23 21:38:49.884005
531	171	393	Ancient	2025-06-23 20:51:08.627604
532	171	323	Ancient	2025-06-23 21:24:47.146151
533	171	319	Barracks	2025-06-23 21:32:25.929595
534	171	320	Barracks	2025-06-23 22:36:28.447628
535	171	337	Ancient	2025-06-23 21:41:59.079513
536	172	347	Ancient	2025-06-23 22:31:13.359655
537	172	304	Ancient	2025-06-23 22:38:31.174557
538	172	373	Barracks	2025-06-23 20:51:15.318566
539	172	382	Tower	2025-06-23 21:06:48.497648
540	173	340	Tower	2025-06-23 21:35:39.390275
541	173	360	Ancient	2025-06-23 21:22:49.972148
542	173	387	Ancient	2025-06-23 23:11:28.875565
543	173	365	Barracks	2025-06-23 22:12:31.362986
544	174	361	Tower	2025-06-23 21:08:20.121273
545	174	344	Barracks	2025-06-23 21:04:49.012978
546	175	383	Barracks	2025-06-23 21:28:31.09648
547	175	387	Ancient	2025-06-23 22:21:01.217362
548	175	329	Ancient	2025-06-23 22:35:29.038518
549	175	379	Tower	2025-06-23 21:57:32.302522
550	176	336	Ancient	2025-06-23 20:53:38.644615
551	176	383	Barracks	2025-06-23 21:09:16.961645
552	177	347	Barracks	2025-06-23 20:45:29.645179
553	177	398	Tower	2025-06-23 21:07:53.859674
554	178	381	Barracks	2025-06-23 23:02:09.394096
555	178	303	Ancient	2025-06-23 22:14:32.086939
556	178	380	Barracks	2025-06-23 20:50:39.27856
557	178	327	Tower	2025-06-23 23:00:25.410619
558	178	356	Tower	2025-06-23 22:55:56.923122
559	179	345	Ancient	2025-06-23 21:05:47.61849
560	179	325	Ancient	2025-06-23 22:59:09.196524
561	180	301	Barracks	2025-06-23 22:12:41.481185
562	181	319	Ancient	2025-06-23 22:31:48.797853
563	182	336	Barracks	2025-06-23 22:57:00.810034
564	183	310	Ancient	2025-06-23 20:46:25.14376
565	183	371	Ancient	2025-06-23 22:10:34.679752
566	183	346	Tower	2025-06-23 21:06:35.58633
567	183	371	Tower	2025-06-23 21:22:08.253912
568	184	328	Tower	2025-06-23 23:06:30.802419
569	184	397	Ancient	2025-06-23 21:59:03.796944
570	184	395	Ancient	2025-06-23 21:23:12.130744
571	185	351	Barracks	2025-06-23 21:04:48.740512
572	185	396	Tower	2025-06-23 22:52:58.547461
573	185	342	Ancient	2025-06-23 22:26:44.382482
574	185	301	Barracks	2025-06-23 23:00:45.460538
575	186	307	Tower	2025-06-23 22:00:35.504973
576	186	350	Ancient	2025-06-23 21:24:09.039586
577	186	346	Barracks	2025-06-23 22:29:35.182048
578	186	345	Ancient	2025-06-23 21:06:56.807563
579	186	387	Tower	2025-06-23 21:53:02.66539
580	187	394	Barracks	2025-06-23 23:14:34.811494
581	188	345	Barracks	2025-06-23 22:17:31.320901
582	188	361	Ancient	2025-06-23 20:37:01.113351
583	188	389	Barracks	2025-06-23 20:48:47.535957
584	188	384	Ancient	2025-06-23 21:50:58.199695
585	188	331	Ancient	2025-06-23 23:19:03.045815
586	189	301	Tower	2025-06-23 21:43:37.287097
587	189	349	Tower	2025-06-23 20:27:26.020147
588	190	376	Tower	2025-06-23 21:39:57.271185
589	190	355	Tower	2025-06-23 22:14:27.473379
590	190	304	Ancient	2025-06-23 21:27:29.026141
591	191	356	Barracks	2025-06-23 22:33:15.295598
592	191	354	Ancient	2025-06-23 21:57:56.251727
593	191	357	Tower	2025-06-23 21:45:13.267153
594	192	342	Tower	2025-06-23 21:38:43.928112
595	193	351	Ancient	2025-06-23 21:29:59.291858
596	194	331	Tower	2025-06-23 21:42:57.609399
597	194	356	Tower	2025-06-23 23:18:33.780401
598	194	317	Barracks	2025-06-23 22:27:54.995216
599	195	383	Ancient	2025-06-23 21:26:48.192478
600	195	330	Ancient	2025-06-23 23:09:02.330874
601	196	311	Ancient	2025-06-23 23:03:07.322683
602	196	385	Ancient	2025-06-23 21:29:55.018615
603	196	343	Ancient	2025-06-23 21:01:49.021679
604	196	369	Ancient	2025-06-23 23:06:33.608801
605	196	366	Ancient	2025-06-23 20:56:48.743241
606	197	343	Barracks	2025-06-23 22:20:03.214452
607	197	314	Barracks	2025-06-23 22:57:35.986133
608	197	337	Ancient	2025-06-23 21:20:32.983187
609	197	378	Tower	2025-06-23 21:40:56.521946
610	197	322	Tower	2025-06-23 20:43:35.391028
611	198	364	Tower	2025-06-23 21:15:26.50626
612	198	384	Tower	2025-06-23 23:13:32.227314
613	198	378	Barracks	2025-06-23 21:37:19.09657
614	198	386	Barracks	2025-06-23 21:30:50.391697
615	199	313	Barracks	2025-06-23 22:34:31.129497
616	200	339	Ancient	2025-06-23 22:34:40.070228
617	200	304	Tower	2025-06-23 22:15:17.905447
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_settings (user_id, theme, language, date_format) FROM stdin;
301	theme_5	RUSSIAN	YYYY-MM-DD
302	theme_1	ENGLISH	MM/DD/YYYY
303	theme_1	GERMAN	DD/MM/YYYY
304	theme_1	GERMAN	DD/MM/YYYY
305	theme_5	GERMAN	DD/MM/YYYY
306	theme_3	ENGLISH	YYYY-MM-DD
307	theme_3	GERMAN	MM/DD/YYYY
308	theme_5	RUSSIAN	YYYY-MM-DD
309	theme_3	RUSSIAN	MM/DD/YYYY
310	theme_5	ENGLISH	MM/DD/YYYY
311	theme_3	RUSSIAN	YYYY-MM-DD
312	theme_5	GERMAN	MM/DD/YYYY
313	theme_2	RUSSIAN	DD/MM/YYYY
314	theme_2	RUSSIAN	YYYY-MM-DD
315	theme_3	ENGLISH	DD/MM/YYYY
316	theme_2	RUSSIAN	DD/MM/YYYY
317	theme_5	GERMAN	MM/DD/YYYY
318	theme_1	GERMAN	YYYY-MM-DD
319	theme_2	ENGLISH	MM/DD/YYYY
320	theme_2	RUSSIAN	MM/DD/YYYY
321	theme_3	RUSSIAN	YYYY-MM-DD
322	theme_4	GERMAN	DD/MM/YYYY
323	theme_3	RUSSIAN	YYYY-MM-DD
324	theme_3	GERMAN	YYYY-MM-DD
325	theme_5	GERMAN	DD/MM/YYYY
326	theme_4	ENGLISH	DD/MM/YYYY
327	theme_2	RUSSIAN	YYYY-MM-DD
328	theme_5	GERMAN	DD/MM/YYYY
329	theme_5	ENGLISH	MM/DD/YYYY
330	theme_3	RUSSIAN	DD/MM/YYYY
331	theme_1	RUSSIAN	MM/DD/YYYY
332	theme_4	GERMAN	DD/MM/YYYY
333	theme_2	RUSSIAN	YYYY-MM-DD
334	theme_3	GERMAN	DD/MM/YYYY
335	theme_2	GERMAN	YYYY-MM-DD
336	theme_4	ENGLISH	MM/DD/YYYY
337	theme_1	ENGLISH	DD/MM/YYYY
338	theme_4	ENGLISH	YYYY-MM-DD
339	theme_4	GERMAN	YYYY-MM-DD
340	theme_5	RUSSIAN	MM/DD/YYYY
341	theme_2	RUSSIAN	DD/MM/YYYY
342	theme_4	RUSSIAN	MM/DD/YYYY
343	theme_4	RUSSIAN	DD/MM/YYYY
344	theme_4	GERMAN	YYYY-MM-DD
345	theme_1	RUSSIAN	YYYY-MM-DD
346	theme_3	GERMAN	DD/MM/YYYY
347	theme_4	ENGLISH	DD/MM/YYYY
348	theme_3	ENGLISH	YYYY-MM-DD
349	theme_5	GERMAN	MM/DD/YYYY
350	theme_5	GERMAN	YYYY-MM-DD
351	theme_2	GERMAN	YYYY-MM-DD
352	theme_2	ENGLISH	YYYY-MM-DD
353	theme_3	GERMAN	MM/DD/YYYY
354	theme_1	RUSSIAN	DD/MM/YYYY
355	theme_3	RUSSIAN	MM/DD/YYYY
356	theme_5	ENGLISH	YYYY-MM-DD
357	theme_1	GERMAN	MM/DD/YYYY
358	theme_4	GERMAN	MM/DD/YYYY
359	theme_3	RUSSIAN	YYYY-MM-DD
360	theme_4	RUSSIAN	DD/MM/YYYY
361	theme_4	RUSSIAN	DD/MM/YYYY
362	theme_5	GERMAN	YYYY-MM-DD
363	theme_4	ENGLISH	DD/MM/YYYY
364	theme_3	RUSSIAN	YYYY-MM-DD
365	theme_2	ENGLISH	YYYY-MM-DD
366	theme_5	RUSSIAN	MM/DD/YYYY
367	theme_2	RUSSIAN	YYYY-MM-DD
368	theme_4	GERMAN	DD/MM/YYYY
369	theme_2	RUSSIAN	MM/DD/YYYY
370	theme_1	RUSSIAN	MM/DD/YYYY
371	theme_4	RUSSIAN	MM/DD/YYYY
372	theme_4	RUSSIAN	MM/DD/YYYY
373	theme_4	GERMAN	YYYY-MM-DD
374	theme_3	RUSSIAN	MM/DD/YYYY
375	theme_5	RUSSIAN	MM/DD/YYYY
376	theme_3	ENGLISH	DD/MM/YYYY
377	theme_4	ENGLISH	DD/MM/YYYY
378	theme_3	RUSSIAN	YYYY-MM-DD
379	theme_3	GERMAN	DD/MM/YYYY
380	theme_5	ENGLISH	YYYY-MM-DD
381	theme_1	ENGLISH	MM/DD/YYYY
382	theme_2	GERMAN	MM/DD/YYYY
383	theme_3	GERMAN	YYYY-MM-DD
384	theme_3	RUSSIAN	MM/DD/YYYY
385	theme_3	ENGLISH	MM/DD/YYYY
386	theme_2	GERMAN	YYYY-MM-DD
387	theme_3	ENGLISH	DD/MM/YYYY
388	theme_1	GERMAN	DD/MM/YYYY
389	theme_3	ENGLISH	MM/DD/YYYY
390	theme_2	GERMAN	MM/DD/YYYY
391	theme_2	GERMAN	YYYY-MM-DD
392	theme_2	GERMAN	YYYY-MM-DD
393	theme_5	ENGLISH	MM/DD/YYYY
394	theme_1	RUSSIAN	DD/MM/YYYY
395	theme_1	ENGLISH	DD/MM/YYYY
396	theme_2	ENGLISH	YYYY-MM-DD
397	theme_3	GERMAN	MM/DD/YYYY
398	theme_3	RUSSIAN	MM/DD/YYYY
399	theme_4	GERMAN	YYYY-MM-DD
400	theme_2	RUSSIAN	YYYY-MM-DD
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, email, password_hash, created_at) FROM stdin;
301	james15@example.com	((U8r%6nt5	2025-06-23 23:23:38.303807
302	ricky03@example.org	z97f!UlqU&	2025-06-23 23:23:38.303807
303	rebeccakane@example.com	yjPp7DIuh+	2025-06-23 23:23:38.303807
304	mary05@example.com	_t6Yi98nG8	2025-06-23 23:23:38.303807
305	rickymeadows@example.org	%KdZleP9R2	2025-06-23 23:23:38.303807
306	nwilson@example.com	+L8ZgjqKT$	2025-06-23 23:23:38.303807
307	robert83@example.net	$71)xTau7U	2025-06-23 23:23:38.303807
308	gregory29@example.net	&5Hob^o&46	2025-06-23 23:23:38.303807
309	vtorres@example.com	*4mVChcUNe	2025-06-23 23:23:38.303807
310	coreybrock@example.com	6nXfaDIT#Y	2025-06-23 23:23:38.303807
311	sharon38@example.com	CmaeYvBr)7	2025-06-23 23:23:38.303807
312	kimcraig@example.net	^s*)4Qfgnl	2025-06-23 23:23:38.303807
313	shepherdkaren@example.com	35PJSksm_7	2025-06-23 23:23:38.303807
314	sburnett@example.com	N(+94SzqLQ	2025-06-23 23:23:38.303807
315	bassnicole@example.net	5RFwct9Y^Q	2025-06-23 23:23:38.303807
316	jacobpage@example.org	!!3cCgiFg5	2025-06-23 23:23:38.303807
317	aaronterrell@example.net	y+u6iFtj^z	2025-06-23 23:23:38.303807
318	lauren35@example.org	Eul*4+vo%0	2025-06-23 23:23:38.303807
319	davidtorres@example.com	$Qh$Pyas9K	2025-06-23 23:23:38.303807
320	vrobbins@example.com	8HYVDeit$*	2025-06-23 23:23:38.303807
321	sreyes@example.org	8v4Y$Kj)3!	2025-06-23 23:23:38.303807
322	christine21@example.net	d)Z7p!FOPh	2025-06-23 23:23:38.303807
323	ufoster@example.org	U0Eox*Jj)o	2025-06-23 23:23:38.303807
324	mark79@example.com	(CfS34aTf9	2025-06-23 23:23:38.303807
325	ballardadam@example.net	#um(8Cd#yo	2025-06-23 23:23:38.303807
326	calebgilmore@example.org	1ZFv$Gti)n	2025-06-23 23:23:38.303807
327	steve59@example.net	rG#9Ikws)g	2025-06-23 23:23:38.303807
328	qriggs@example.net	&76&*_Xp(u	2025-06-23 23:23:38.303807
329	annetteperez@example.com	$7mDZ1qUjY	2025-06-23 23:23:38.303807
330	stevenpearson@example.net	mG7KV&l+o$	2025-06-23 23:23:38.303807
331	jaclynedwards@example.com	u0EDp0xG_v	2025-06-23 23:23:38.303807
332	qwhite@example.com	b+9ZcGilDK	2025-06-23 23:23:38.303807
333	martinezcynthia@example.net	E$0REhz7#z	2025-06-23 23:23:38.303807
334	mclaughlinmelissa@example.com	*n3Xfm^9sZ	2025-06-23 23:23:38.303807
335	ibishop@example.net	rr8HDFO^V$	2025-06-23 23:23:38.303807
336	alisonhenderson@example.net	*32k%T4m&*	2025-06-23 23:23:38.303807
337	rfranco@example.net	R0XfC)XM!x	2025-06-23 23:23:38.303807
338	dholmes@example.com	8#i6Hz_f(a	2025-06-23 23:23:38.303807
339	jennifer35@example.org	iV0Ld1GQt^	2025-06-23 23:23:38.303807
340	michellemccoy@example.org	u6t*kjYg)5	2025-06-23 23:23:38.303807
341	jamesweber@example.net	5)0K8BFzSU	2025-06-23 23:23:38.303807
342	kimberlyhoward@example.com	^*FNzyAEc1	2025-06-23 23:23:38.303807
343	wrightcynthia@example.com	P8dhLa)h%y	2025-06-23 23:23:38.303807
344	dustinrussell@example.org	Q40Bk^mS^%	2025-06-23 23:23:38.303807
345	jaclyn59@example.net	)8@E^JLrn0	2025-06-23 23:23:38.303807
346	sweeneylisa@example.org	qZZpFD7u)1	2025-06-23 23:23:38.303807
347	susanclayton@example.net	*4ZPygoD6S	2025-06-23 23:23:38.303807
348	eshaffer@example.com	I2Ae!Ddz_U	2025-06-23 23:23:38.303807
349	karen77@example.net	T^g2O5Ys&2	2025-06-23 23:23:38.303807
350	benjamin23@example.org	%y0EtNNgX2	2025-06-23 23:23:38.303807
351	schneiderleslie@example.org	3!2OMj_ADp	2025-06-23 23:23:38.303807
352	vyates@example.org	i18rLensF&	2025-06-23 23:23:38.303807
353	garzatimothy@example.org	P^6J69dH*I	2025-06-23 23:23:38.303807
354	michellearroyo@example.com	zXh%1M@u^z	2025-06-23 23:23:38.303807
355	danny81@example.org	Y%FkjZ8^!2	2025-06-23 23:23:38.303807
356	ocortez@example.net	&8IG$9Yx8s	2025-06-23 23:23:38.303807
357	abigail82@example.net	_2o2mJbE!T	2025-06-23 23:23:38.303807
358	ambersimon@example.org	#1(SV^m&(T	2025-06-23 23:23:38.303807
359	nancybenjamin@example.com	KK9IHyzWm*	2025-06-23 23:23:38.303807
360	dodsondennis@example.com	6aKKoqqt+2	2025-06-23 23:23:38.303807
361	jenniferhickman@example.net	l2fViFVG#Z	2025-06-23 23:23:38.303807
362	robertsbrandy@example.com	#_+0RRcuRX	2025-06-23 23:23:38.303807
363	jenny20@example.org	96Ho97**_h	2025-06-23 23:23:38.303807
364	rward@example.net	n*R2E)t9Y*	2025-06-23 23:23:38.303807
365	smithcarolyn@example.com	(o#3E60fY8	2025-06-23 23:23:38.303807
366	andrewcarr@example.com	*1M^V0v6xL	2025-06-23 23:23:38.303807
367	torressophia@example.com	_wWZh@nQc5	2025-06-23 23:23:38.303807
368	fsmall@example.com	@M6YvM#H)(	2025-06-23 23:23:38.303807
369	kingamanda@example.net	@hX(8EhwGx	2025-06-23 23:23:38.303807
370	cindyenglish@example.org	vi91KLZg(Q	2025-06-23 23:23:38.303807
371	eswanson@example.net	^F^CCg73e2	2025-06-23 23:23:38.303807
372	spatterson@example.com	T9ZeqFwU+j	2025-06-23 23:23:38.303807
373	cantupaul@example.net	7#!$3@Oji5	2025-06-23 23:23:38.303807
374	allenbecky@example.com	+w)CCql650	2025-06-23 23:23:38.303807
375	vallen@example.org	Z+3*Dr5*wM	2025-06-23 23:23:38.303807
376	lwhite@example.com	MMV6lYZq%#	2025-06-23 23:23:38.303807
377	hmanning@example.net	9+11YNu$@e	2025-06-23 23:23:38.303807
378	kimberlyvega@example.com	W^4WCPge+X	2025-06-23 23:23:38.303807
379	david54@example.net	*7o64@NmN#	2025-06-23 23:23:38.303807
380	lhill@example.net	@0O2934sGc	2025-06-23 23:23:38.303807
381	kschneider@example.org	Pm7^LfZOo&	2025-06-23 23:23:38.303807
382	emilybruce@example.org	*J!dWvt!R3	2025-06-23 23:23:38.303807
383	inguyen@example.net	^4fME8@i#q	2025-06-23 23:23:38.303807
384	burnsjacob@example.org	wz8zAi)Mx^	2025-06-23 23:23:38.303807
385	jason53@example.net	$w(4$Igf77	2025-06-23 23:23:38.303807
386	brookemoore@example.net	HS2FQN$kz)	2025-06-23 23:23:38.303807
387	gbarrera@example.org	c!26t&pnqO	2025-06-23 23:23:38.303807
388	robert47@example.com	_kGNgRz*s3	2025-06-23 23:23:38.303807
389	taylorkent@example.org	4_0G^)oi#^	2025-06-23 23:23:38.303807
390	xsmith@example.com	$@PlWOVT7w	2025-06-23 23:23:38.303807
391	garrettjames@example.net	*Bc4JyGqA4	2025-06-23 23:23:38.303807
392	lorinunez@example.net	@YkRXf1d3R	2025-06-23 23:23:38.303807
393	claypatricia@example.org	4e4CwhHKv#	2025-06-23 23:23:38.303807
394	sarah66@example.com	!J47FJhu6M	2025-06-23 23:23:38.303807
395	charlesjohns@example.net	8C70#6Ue^u	2025-06-23 23:23:38.303807
396	uhill@example.net	L6j5ET+c#y	2025-06-23 23:23:38.303807
397	wolfdennis@example.org	R0_V8(Dv_&	2025-06-23 23:23:38.303807
398	mikemurray@example.org	Jl7(XHBu*Q	2025-06-23 23:23:38.303807
399	yjones@example.org	&k8Olat&1)	2025-06-23 23:23:38.303807
400	alisonflores@example.net	7Ppf6Bdp(3	2025-06-23 23:23:38.303807
\.


--
-- Name: achievements_achievement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievements_achievement_id_seq', 400, true);


--
-- Name: hero_builds_build_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hero_builds_build_id_seq', 80, true);


--
-- Name: hero_stats_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hero_stats_stat_id_seq', 80, true);


--
-- Name: heroes_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.heroes_hero_id_seq', 80, true);


--
-- Name: items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_item_id_seq', 120, true);


--
-- Name: kill_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kill_events_event_id_seq', 2451, true);


--
-- Name: leagues_league_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leagues_league_id_seq', 20, true);


--
-- Name: match_item_purchase_purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.match_item_purchase_purchase_id_seq', 3000, true);


--
-- Name: match_player_stats_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.match_player_stats_stat_id_seq', 2000, true);


--
-- Name: matches_match_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matches_match_id_seq', 200, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 1, false);


--
-- Name: player_achievements_pa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_achievements_pa_id_seq', 200, true);


--
-- Name: player_profiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_profiles_profile_id_seq', 400, true);


--
-- Name: roshan_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roshan_events_event_id_seq', 102, true);


--
-- Name: rune_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rune_events_event_id_seq', 574, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 400, true);


--
-- Name: tournaments_tournament_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tournaments_tournament_id_seq', 40, true);


--
-- Name: tower_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tower_events_event_id_seq', 617, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 400, true);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (achievement_id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: friendships friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (user_id1, user_id2);


--
-- Name: hero_builds hero_builds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_builds
    ADD CONSTRAINT hero_builds_pkey PRIMARY KEY (build_id);


--
-- Name: hero_stats hero_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_stats
    ADD CONSTRAINT hero_stats_pkey PRIMARY KEY (stat_id);


--
-- Name: heroes heroes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT heroes_pkey PRIMARY KEY (hero_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (item_id);


--
-- Name: kill_events kill_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kill_events
    ADD CONSTRAINT kill_events_pkey PRIMARY KEY (event_id);


--
-- Name: leagues leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (league_id);


--
-- Name: match_item_purchase match_item_purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_item_purchase
    ADD CONSTRAINT match_item_purchase_pkey PRIMARY KEY (purchase_id);


--
-- Name: match_player_stats match_player_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_player_stats
    ADD CONSTRAINT match_player_stats_pkey PRIMARY KEY (stat_id);


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (match_id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: player_achievements player_achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_achievements
    ADD CONSTRAINT player_achievements_pkey PRIMARY KEY (pa_id);


--
-- Name: player_profiles player_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_profiles
    ADD CONSTRAINT player_profiles_pkey PRIMARY KEY (profile_id);


--
-- Name: player_profiles player_profiles_steam_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_profiles
    ADD CONSTRAINT player_profiles_steam_id_key UNIQUE (steam_id);


--
-- Name: players_in_match players_in_match_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_in_match
    ADD CONSTRAINT players_in_match_pkey PRIMARY KEY (match_id, profile_id);


--
-- Name: roshan_events roshan_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roshan_events
    ADD CONSTRAINT roshan_events_pkey PRIMARY KEY (event_id);


--
-- Name: rune_events rune_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rune_events
    ADD CONSTRAINT rune_events_pkey PRIMARY KEY (event_id);


--
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (team_id, profile_id, start_date);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: tournaments tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_pkey PRIMARY KEY (tournament_id);


--
-- Name: tower_events tower_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tower_events
    ADD CONSTRAINT tower_events_pkey PRIMARY KEY (event_id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: idx_items_rarity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_items_rarity ON public.items USING btree (rarity);


--
-- Name: idx_kill_events_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_kill_events_timestamp ON public.kill_events USING btree ("timestamp");


--
-- Name: idx_match_player_stats_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_match_player_stats_profile_id ON public.match_player_stats USING btree (profile_id);


--
-- Name: idx_matches_duration; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_matches_duration ON public.matches USING btree (duration);


--
-- Name: idx_player_profiles_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_player_profiles_user_id ON public.player_profiles USING btree (user_id);


--
-- Name: idx_players_in_match_match_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_players_in_match_match_id ON public.players_in_match USING btree (match_id);


--
-- Name: idx_players_in_match_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_players_in_match_profile_id ON public.players_in_match USING btree (profile_id);


--
-- Name: friendships friendships_user_id1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_user_id1_fkey FOREIGN KEY (user_id1) REFERENCES public.users(user_id);


--
-- Name: friendships friendships_user_id2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_user_id2_fkey FOREIGN KEY (user_id2) REFERENCES public.users(user_id);


--
-- Name: hero_builds hero_builds_hero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_builds
    ADD CONSTRAINT hero_builds_hero_id_fkey FOREIGN KEY (hero_id) REFERENCES public.heroes(hero_id);


--
-- Name: hero_stats hero_stats_hero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_stats
    ADD CONSTRAINT hero_stats_hero_id_fkey FOREIGN KEY (hero_id) REFERENCES public.heroes(hero_id);


--
-- Name: kill_events kill_events_killer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kill_events
    ADD CONSTRAINT kill_events_killer_id_fkey FOREIGN KEY (killer_id) REFERENCES public.player_profiles(profile_id);


--
-- Name: kill_events kill_events_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kill_events
    ADD CONSTRAINT kill_events_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- Name: kill_events kill_events_victim_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kill_events
    ADD CONSTRAINT kill_events_victim_id_fkey FOREIGN KEY (victim_id) REFERENCES public.player_profiles(profile_id);


--
-- Name: match_item_purchase match_item_purchase_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_item_purchase
    ADD CONSTRAINT match_item_purchase_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(item_id);


--
-- Name: match_item_purchase match_item_purchase_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_item_purchase
    ADD CONSTRAINT match_item_purchase_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- Name: match_item_purchase match_item_purchase_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_item_purchase
    ADD CONSTRAINT match_item_purchase_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.player_profiles(profile_id);


--
-- Name: match_player_stats match_player_stats_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_player_stats
    ADD CONSTRAINT match_player_stats_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- Name: match_player_stats match_player_stats_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_player_stats
    ADD CONSTRAINT match_player_stats_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.player_profiles(profile_id);


--
-- Name: matches matches_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES public.tournaments(tournament_id);


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: player_achievements player_achievements_achievement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_achievements
    ADD CONSTRAINT player_achievements_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievements(achievement_id);


--
-- Name: player_achievements player_achievements_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_achievements
    ADD CONSTRAINT player_achievements_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.player_profiles(profile_id);


--
-- Name: player_profiles player_profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_profiles
    ADD CONSTRAINT player_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: players_in_match players_in_match_hero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_in_match
    ADD CONSTRAINT players_in_match_hero_id_fkey FOREIGN KEY (hero_id) REFERENCES public.heroes(hero_id);


--
-- Name: players_in_match players_in_match_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_in_match
    ADD CONSTRAINT players_in_match_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- Name: players_in_match players_in_match_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_in_match
    ADD CONSTRAINT players_in_match_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.player_profiles(profile_id);


--
-- Name: players_in_match players_in_match_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_in_match
    ADD CONSTRAINT players_in_match_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: roshan_events roshan_events_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roshan_events
    ADD CONSTRAINT roshan_events_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- Name: roshan_events roshan_events_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roshan_events
    ADD CONSTRAINT roshan_events_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: rune_events rune_events_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rune_events
    ADD CONSTRAINT rune_events_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- Name: rune_events rune_events_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rune_events
    ADD CONSTRAINT rune_events_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player_profiles(profile_id);


--
-- Name: team_members team_members_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.player_profiles(profile_id);


--
-- Name: team_members team_members_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: tournaments tournaments_league_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_league_id_fkey FOREIGN KEY (league_id) REFERENCES public.leagues(league_id);


--
-- Name: tower_events tower_events_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tower_events
    ADD CONSTRAINT tower_events_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- Name: tower_events tower_events_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tower_events
    ADD CONSTRAINT tower_events_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: user_settings user_settings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

