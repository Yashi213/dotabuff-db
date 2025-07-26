CREATE INDEX IF NOT EXISTS idx_player_profiles_user_id ON player_profiles(user_id);

CREATE INDEX IF NOT EXISTS idx_players_in_match_profile_id ON players_in_match(profile_id);
CREATE INDEX IF NOT EXISTS idx_match_player_stats_profile_id ON match_player_stats(profile_id);

CREATE INDEX IF NOT EXISTS idx_players_in_match_match_id ON players_in_match(match_id);
CREATE INDEX IF NOT EXISTS idx_matches_duration ON matches(duration);

CREATE INDEX IF NOT EXISTS idx_items_rarity ON items(rarity);

CREATE INDEX IF NOT EXISTS idx_kill_events_timestamp ON kill_events(timestamp);
