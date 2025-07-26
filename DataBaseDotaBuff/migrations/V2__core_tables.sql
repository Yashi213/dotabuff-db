CREATE TYPE language_enum AS ENUM ('ENGLISH', 'RUSSIAN', 'GERMAN');

CREATE TABLE IF NOT EXISTS users (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS user_settings (
  user_id INT PRIMARY KEY REFERENCES users(user_id),
  theme VARCHAR(50),
  language language_enum,
  date_format VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS friendships (
  user_id1 INT REFERENCES users(user_id),
  user_id2 INT REFERENCES users(user_id),
  status VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY(user_id1, user_id2)
);

CREATE TABLE IF NOT EXISTS notifications (
  notification_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  type VARCHAR(50) NOT NULL,
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS player_profiles (
  profile_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  steam_id VARCHAR(50) UNIQUE,
  nickname VARCHAR(100),
  mmr INT
);
