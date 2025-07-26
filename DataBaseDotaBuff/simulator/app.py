import os
import signal
import time
import psycopg2
from prometheus_client import Gauge, start_http_server

QUERY_DURATION = Gauge('query_duration_seconds_live', 'Query duration in seconds (raw)', ['query_name'])

conn = psycopg2.connect(
    host=os.getenv("DB_HOST", "haproxy"),
    database=os.getenv("DB_NAME"),
    user=os.getenv("DB_ADMIN_USER"),
    password=os.getenv("DB_ADMIN_PASSWORD"),
    port=os.getenv("POSTGRES_PORT")
)

QUERIES = {
    "heavy_join": """
        SELECT u.user_id, COUNT(m.match_id)
        FROM users u
        JOIN player_profiles pp ON u.user_id = pp.user_id
        JOIN players_in_match pim ON pp.profile_id = pim.profile_id
        JOIN matches m ON pim.match_id = m.match_id
        GROUP BY u.user_id
        ORDER BY COUNT(m.match_id) DESC
        LIMIT 10;
    """,
    "selective_filter": """
        SELECT m.match_id
        FROM matches m
        WHERE m.duration > INTERVAL '1 hour'
        LIMIT 10;
    """,
    "aggregate_count": """
        SELECT i.rarity, COUNT(*) FROM items i GROUP BY i.rarity;
    """
}

def execute_queries():
    with conn.cursor() as cur:
        for name, sql in QUERIES.items():
            start = time.time()
            cur.execute(sql)
            cur.fetchall()
            duration = time.time() - start
            QUERY_DURATION.labels(query_name=name).set(duration)
            print(f"[{name}] {duration:.4f}s")

if __name__ == "__main__":
    start_http_server(8000)
    print("📡 Exporting metrics at :8000")

    time.sleep(5)  # Ждём Prometheus

    while True:
        execute_queries()
        time.sleep(1)