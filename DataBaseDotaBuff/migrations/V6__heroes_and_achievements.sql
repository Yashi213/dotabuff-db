CREATE TABLE IF NOT EXISTS heroes (
  hero_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  primary_attr VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS hero_builds (
  build_id SERIAL PRIMARY KEY,
  hero_id INT REFERENCES heroes(hero_id),
  items_seq TEXT,
  talents_seq TEXT,
  win_rate FLOAT
);

CREATE TABLE IF NOT EXISTS hero_stats (
  stat_id SERIAL PRIMARY KEY,
  hero_id INT REFERENCES heroes(hero_id),
  period_start DATE,
  period_end DATE,
  matches_played INT,
  wins INT,
  avg_gpm FLOAT,
  avg_xpm FLOAT
);

CREATE TABLE IF NOT EXISTS achievements (
  achievement_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
);

CREATE TABLE IF NOT EXISTS player_achievements (
  pa_id SERIAL PRIMARY KEY,
  profile_id INT REFERENCES player_profiles(profile_id),
  achievement_id INT REFERENCES achievements(achievement_id),
  unlocked_at TIMESTAMP
);