CREATE TABLE IF NOT EXISTS teams (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  region VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS team_members (
  team_id INT REFERENCES teams(team_id),
  profile_id INT REFERENCES player_profiles(profile_id),
  start_date DATE,
  end_date DATE,
  PRIMARY KEY(team_id, profile_id, start_date)
);