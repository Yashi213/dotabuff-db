#!/usr/bin/env python3
import os
import sys
import random
from datetime import datetime, timedelta
from enum import Enum

import analytic
from dotenv import load_dotenv
from faker import Faker
import psycopg2


# Загрузка конфигов
load_dotenv()
DB_HOST = os.getenv("DB_HOST", "haproxy")
DB_PORT = int(os.getenv("DB_PORT", "5000"))
DB_USER = os.getenv("DB_ADMIN_USER")
DB_PASS = os.getenv("DB_ADMIN_PASSWORD")
DB_NAME = os.getenv("DB_NAME")
COUNT = int(os.getenv("SEED_COUNT", "1000"))

fake = Faker()


def connect():
    try:
        return psycopg2.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASS,
            dbname=DB_NAME,
            port=DB_PORT
        )
    except Exception as e:
        print("ERROR: cannot connect to DB:", e)
        sys.exit(1)


def seed_users(cur):
    print("Seeding users...")
    for _ in range(COUNT):
        cur.execute(
            "INSERT INTO users(email, password_hash, created_at) "
            "VALUES (%s, %s, NOW()) ON CONFLICT DO NOTHING",
            (fake.email(), fake.password())
        )


def seed_profiles(cur):
    print("Seeding player_profiles...")
    cur.execute("SELECT user_id FROM users LIMIT %s", (COUNT,))
    user_ids = [r[0] for r in cur.fetchall()]
    profile_ids = []
    for uid in user_ids:
        cur.execute(
            "INSERT INTO player_profiles(user_id, steam_id, nickname, mmr) "
            "VALUES (%s, %s, %s, %s) RETURNING profile_id",
            (uid, fake.uuid4(), fake.user_name(), fake.random_int(5000, 10000))
        )
        profile_ids.append(cur.fetchone()[0])
    return user_ids, profile_ids


class Language(Enum):
    ENGLISH = "ENGLISH"
    RUSSIAN = "RUSSIAN"
    GERMAN = "GERMAN"

    @classmethod
    def random(cls):
        return random.choice(list(cls))

def seed_user_settings(cur, user_ids):
    print("Seeding user settings...")

    cur.execute("""
    DO $$
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'language_enum') THEN
            CREATE TYPE language_enum AS ENUM (
                'ENGLISH', 'RUSSIAN', 'GERMAN'
            );
        END IF;
    END$$;
    """)

    for user_id in user_ids:
        lang = Language.random().value
        theme = f"theme_{random.randint(1, 5)}"
        date_format = random.choice(['DD/MM/YYYY', 'MM/DD/YYYY', 'YYYY-MM-DD'])

        cur.execute(
            """INSERT INTO user_settings 
               (user_id, theme, language, date_format) 
               VALUES (%s, %s, %s::language_enum, %s)""",
            (user_id, theme, lang, date_format)
        )

def seed_leagues(cur):
    print("Seeding leagues...")
    leagues = []
    for _ in range(max(5, COUNT // 100)):
        name = fake.company()
        cur.execute(
            "INSERT INTO leagues(name) VALUES (%s) RETURNING league_id",
            (name,)
        )
        leagues.append(cur.fetchone()[0])
    return leagues


def seed_tournaments(cur, leagues):
    print("Seeding tournaments...")
    tours = []
    for lid in leagues:
        for _ in range(2):
            name = f"{fake.word().title()} Cup"
            start = fake.date_between(start_date='-1y', end_date='today')
            end = start + timedelta(days=random.randint(1, 100))
            prize = round(random.uniform(100000, 1000000), 2)
            cur.execute(
                "INSERT INTO tournaments(name, league_id, start_date, end_date, prize_pool) "
                "VALUES (%s,%s,%s,%s,%s) RETURNING tournament_id",
                (name, lid, start, end, prize)
            )
            tours.append(cur.fetchone()[0])
    return tours


def seed_teams(cur):
    print("Seeding teams...")
    teams = []
    for _ in range(max(100, COUNT // 5)):
        name = f"Team {fake.color_name()}"
        region = fake.country()
        cur.execute(
            "INSERT INTO teams(name, region) VALUES (%s,%s) RETURNING team_id",
            (name, region)
        )
        teams.append(cur.fetchone()[0])
    return teams


def seed_team_members(cur, teams, profiles):
    print("Seeding team_members...")
    for team in teams:
        members = random.sample(profiles, k=min(5, len(profiles)))
        for pid in members:
            start = fake.date_between(start_date='-1y', end_date='today')
            end = start + timedelta(days=random.randint(30, 180))
            cur.execute(
                "INSERT INTO team_members(team_id,profile_id,start_date,end_date) "
                "VALUES (%s,%s,%s,%s) ON CONFLICT DO NOTHING",
                (team, pid, start, end)
            )

class Mode(Enum):
    ENGLISH = "RANKED"
    RUSSIAN = "UNRANKED"
    GERMAN = "CUSTOM"

    @classmethod
    def random(cls):
        return random.choice(list(cls))

def seed_matches(cur, tournaments):
    print("Seeding matches...")

    matches = []
    for tid in tournaments:
        for _ in range(5):
            date = fake.date_time_between(start_date='-6mo', end_date='now')
            duration = timedelta(minutes=random.randint(20, 60))
            map_ = fake.word()
            mode = Mode.random().value
            result = random.choice(['Radiant', 'Dire'])
            replay = fake.uri()
            cur.execute(
                "INSERT INTO matches(tournament_id, date, duration, map, mode, result, replay_url) "
                "VALUES (%s,%s,%s,%s,%s,%s,%s) RETURNING match_id",
                (tid, date, duration, map_, mode, result, replay)
            )
            matches.append(cur.fetchone()[0])
    return matches


def seed_heroes(cur):
    print("Seeding heroes...")
    hero_ids = []
    for _ in range(20):
        name = fake.first_name() + "ius"
        attr = random.choice(['Strength', 'Agility', 'Intelligence'])
        cur.execute(
            "INSERT INTO heroes(name, primary_attr) VALUES (%s,%s) RETURNING hero_id",
            (name, attr)
        )
        hero_ids.append(cur.fetchone()[0])
    return hero_ids


def seed_items(cur):
    print("Seeding items...")
    item_ids = []
    for _ in range(30):
        name = fake.word().title()
        cost = random.randint(1000, 5000)
        rarity = random.choice(['Common', 'Uncommon', 'Rare', 'Epic'])
        cur.execute(
            "INSERT INTO items(name,cost,rarity) VALUES(%s,%s,%s) RETURNING item_id",
            (name, cost, rarity)
        )
        item_ids.append(cur.fetchone()[0])
    return item_ids


def seed_players_in_match(cur, matches, profiles, teams, heroes):
    print("Seeding players_in_match and match_player_stats...")
    for mid in matches:
        chosen = random.sample(profiles, k=10)
        for pid in chosen:
            team = random.choice(teams)
            hero = random.choice(heroes)
            cur.execute(
                "INSERT INTO players_in_match(match_id,profile_id,team_id,hero_id) "
                "VALUES(%s,%s,%s,%s)",
                (mid, pid, team, hero)
            )
            # stats
            cur.execute(
                "INSERT INTO match_player_stats(match_id,profile_id,kills,deaths,assists,gpm,xpm,dmg_physical,dmg_magical,dmg_pure,healing) "
                "VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",
                (mid, pid, random.randint(0, 20), random.randint(0, 20), random.randint(0, 30),
                 random.randint(200, 800), random.randint(200, 800),
                 random.randint(1000, 5000), random.randint(1000, 5000), random.randint(1000, 10000),
                 random.randint(0, 500))
            )


def seed_events(cur, matches, profiles, teams):
    print("Seeding events...")
    for mid in matches:
        # kill_events
        for _ in range(random.randint(5, 20)):
            killer = random.choice(profiles)
            victim = random.choice([p for p in profiles if p != killer])
            ts = fake.date_time_between(start_date='-3h', end_date='now')
            cur.execute(
                "INSERT INTO kill_events(match_id,killer_id,victim_id,timestamp) VALUES(%s,%s,%s,%s)",
                (mid, killer, victim, ts)
            )
        # tower_events
        for _ in range(random.randint(1, 5)):
            team = random.choice(teams)
            struct = random.choice(['Tower', 'Barracks', 'Ancient'])
            ts = fake.date_time_between(start_date='-3h', end_date='now')
            cur.execute(
                "INSERT INTO tower_events(match_id,team_id,structure,timestamp) VALUES(%s,%s,%s,%s)",
                (mid, team, struct, ts)
            )
        # rune_events
        for _ in range(random.randint(1, 5)):
            pid = random.choice(profiles)
            rune = random.choice(['Double Damage', 'Haste', 'Illusion', 'Regeneration'])
            ts = fake.date_time_between(start_date='-3h', end_date='now')
            cur.execute(
                "INSERT INTO rune_events(match_id,player_id,rune_type,timestamp) VALUES(%s,%s,%s,%s)",
                (mid, pid, rune, ts)
            )
        # roshan_events
        if random.random() < 0.5:
            team = random.choice(teams)
            ts = fake.date_time_between(start_date='-3h', end_date='now')
            cur.execute(
                "INSERT INTO roshan_events(match_id,team_id,timestamp) VALUES(%s,%s,%s)",
                (mid, team, ts)
            )


def seed_item_purchases(cur, matches, profiles, items):
    print("Seeding item purchases...")
    for mid in matches:
        for pid in random.sample(profiles, k=5):
            bought = random.sample(items, k=3)
            for item in bought:
                ts = fake.date_time_between(start_date='-3h', end_date='now')
                cur.execute(
                    "INSERT INTO match_item_purchase(match_id,profile_id,item_id,purchase_time) VALUES(%s,%s,%s,%s)",
                    (mid, pid, item, ts)
                )


def seed_hero_builds(cur, heroes, items):
    print("Seeding hero_builds...")
    for hid in heroes:
        seq = ",".join(str(item) for item in random.sample(items, k=5))
        talents = ",".join(str(random.randint(1, 8)) for _ in range(6))
        wr = round(random.uniform(0, 1), 2)
        cur.execute(
            "INSERT INTO hero_builds(hero_id,items_seq,talents_seq,win_rate) VALUES(%s,%s,%s,%s)",
            (hid, seq, talents, wr)
        )


def seed_hero_stats(cur, heroes):
    print("Seeding hero_stats...")
    for hid in heroes:
        start = fake.date_between(start_date='-1y', end_date='today')
        end = start + timedelta(days=30)
        mp = random.randint(50, 500)
        w = random.randint(0, mp)
        cur.execute(
            "INSERT INTO hero_stats(hero_id,period_start,period_end,matches_played,wins,avg_gpm,avg_xpm) "
            "VALUES(%s,%s,%s,%s,%s,%s,%s)",
            (hid, start, end, mp, w, round(random.uniform(200, 800), 2), round(random.uniform(200, 800), 2))
        )


def seed_achievements(cur):
    print("Seeding achievements...")
    ach = []
    for _ in range(100):
        name = fake.sentence(nb_words=3)
        desc = fake.text(max_nb_chars=50)
        cur.execute(
            "INSERT INTO achievements(name,description) VALUES(%s,%s) RETURNING achievement_id",
            (name, desc)
        )
        ach.append(cur.fetchone()[0])
    return ach


def seed_player_achievements(cur, profiles, achievements):
    print("Seeding player_achievements...")
    for pid in random.sample(profiles, k=min(len(profiles), COUNT // 2)):
        ach_id = random.choice(achievements)
        ts = fake.date_time_between(start_date='-6mo', end_date='now')
        cur.execute(
            "INSERT INTO player_achievements(profile_id,achievement_id,unlocked_at) VALUES(%s,%s,%s)",
            (pid, ach_id, ts)
        )

def clear_all_data(cur):
    print("Clearing all tables...")
    cur.execute("""
        TRUNCATE TABLE 
            user_settings,
            player_achievements,
            achievements,
            match_item_purchase,
            rune_events,
            tower_events,
            kill_events,
            roshan_events,
            match_player_stats,
            players_in_match,
            matches,
            team_members,
            teams,
            tournaments,
            leagues,
            hero_stats,
            hero_builds,
            heroes,
            items,
            player_profiles,
            users
        CASCADE;
    """)

def main():
    conn = connect()
    cur = conn.cursor()

    clear_all_data(cur)
    conn.commit()

    seed_users(cur)
    user_ids, profile_ids = seed_profiles(cur)

    seed_user_settings(cur, user_ids)

    leagues = seed_leagues(cur)
    tournaments = seed_tournaments(cur, leagues)
    teams = seed_teams(cur)
    seed_team_members(cur, teams, profile_ids)
    matches = seed_matches(cur, tournaments)
    heroes = seed_heroes(cur)
    items = seed_items(cur)
    seed_players_in_match(cur, matches, profile_ids, teams, heroes)
    seed_events(cur, matches, profile_ids, teams)
    seed_item_purchases(cur, matches, profile_ids, items)
    seed_hero_builds(cur, heroes, items)
    seed_hero_stats(cur, heroes)
    achievements = seed_achievements(cur)
    seed_player_achievements(cur, profile_ids, achievements)

    conn.commit()
    cur.close()
    conn.close()



if __name__ == "__main__":
    main()
    analytic.setup_analytics_roles()
