CREATE TABLE IF NOT EXISTS players_in_match (
  match_id INT REFERENCES matches(match_id),
  profile_id INT REFERENCES player_profiles(profile_id),
  team_id INT REFERENCES teams(team_id),
  hero_id INT REFERENCES heroes(hero_id),
  PRIMARY KEY(match_id, profile_id)
);

CREATE TABLE IF NOT EXISTS match_player_stats (
  stat_id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(match_id),
  profile_id INT REFERENCES player_profiles(profile_id),
  kills INT,
  deaths INT,
  assists INT,
  gpm INT,
  xpm INT,
  dmg_physical INT,
  dmg_magical INT,
  dmg_pure INT,
  healing INT
);

CREATE TABLE IF NOT EXISTS items (
  item_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  cost INT,
  rarity VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS match_item_purchase (
  purchase_id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(match_id),
  profile_id INT REFERENCES player_profiles(profile_id),
  item_id INT REFERENCES items(item_id),
  purchase_time TIMESTAMP
);