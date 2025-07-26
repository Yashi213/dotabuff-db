CREATE TABLE IF NOT EXISTS leagues (
  league_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS tournaments (
  tournament_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  league_id INT REFERENCES leagues(league_id),
  start_date DATE,
  end_date DATE,
  prize_pool DECIMAL
);