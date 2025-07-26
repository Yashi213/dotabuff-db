CREATE TYPE matchType AS ENUM ('RANKED', 'UNRANKED', 'CUSTOM');

CREATE TABLE IF NOT EXISTS matches (
  match_id SERIAL PRIMARY KEY,
  tournament_id INT REFERENCES tournaments(tournament_id),
  date TIMESTAMP,
  duration INTERVAL,
  map VARCHAR(100),
  mode MatchType,
  result VARCHAR(50),
  replay_url VARCHAR
);

CREATE TABLE IF NOT EXISTS kill_events (
  event_id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(match_id),
  killer_id INT REFERENCES player_profiles(profile_id),
  victim_id INT REFERENCES player_profiles(profile_id),
  timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tower_events (
  event_id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(match_id),
  team_id INT REFERENCES teams(team_id),
  structure VARCHAR(50),
  timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS rune_events (
  event_id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(match_id),
  player_id INT REFERENCES player_profiles(profile_id),
  rune_type VARCHAR(50),
  timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS roshan_events (
  event_id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(match_id),
  team_id INT REFERENCES teams(team_id),
  timestamp TIMESTAMP
);