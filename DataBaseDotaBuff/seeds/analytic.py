#!/usr/bin/env python3
import os
import sys
import psycopg2

from dotenv import load_dotenv

load_dotenv()

# Параметры подключения
DB_HOST     = os.getenv('DB_HOST', 'postgres')
DB_PORT     = os.getenv('DB_PORT', '5432')
DB_NAME     = os.getenv('DB_NAME')
DB_USER     = os.getenv('DB_ADMIN_USER')
DB_PASSWORD = os.getenv('DB_ADMIN_PASSWORD')
ANALYST_NAMES = os.getenv('ANALYST_NAMES', '')

def setup_analytics_roles():
    names = [n.strip() for n in ANALYST_NAMES.split(',') if n.strip()]
    if not names:
        print("Не указаны имена аналитиков в ANALYST_NAMES, выходим.")
        return

    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        conn.autocommit = True
        cur = conn.cursor()

        # 1) Групповая роль analytic (NOLOGIN)
        print("Создаём группу 'analytic'…")
        cur.execute("""
            DO $$
            BEGIN
              IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname='analytic') THEN
                CREATE ROLE analytic NOLOGIN;
                COMMENT ON ROLE analytic IS 'Групповая роль для аналитиков (read-only)';
              END IF;
            END
            $$;
        """)

        # 2) Права чтения
        print("Выдаём роли 'analytic' права USAGE и SELECT…")
        cur.execute("GRANT USAGE ON SCHEMA public TO analytic;")
        cur.execute("GRANT SELECT ON ALL TABLES IN SCHEMA public TO analytic;")
        cur.execute("""
            ALTER DEFAULT PRIVILEGES IN SCHEMA public
              GRANT SELECT ON TABLES TO analytic;
        """)

        # 3) Пользователи-аналитики
        for name in names:
            pwd = f"{name}_123"
            print(f"Обрабатываем аналитика '{name}'…")

            # Создаём роль-пользователя с LOGIN
            cur.execute(f"""
                DO $$
                BEGIN
                  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = '{name}') THEN
                    CREATE ROLE {name} WITH LOGIN PASSWORD '{pwd}';
                    COMMENT ON ROLE {name} IS 'Аналитик (read-only)';
                  ELSE
                    ALTER ROLE {name} WITH LOGIN PASSWORD '{pwd}';
                  END IF;
                END
                $$;
            """)

            # Даем ему групповую роль analytic
            cur.execute(f"GRANT analytic TO {name};")
            print(f"  → пользователь '{name}' готов, пароль: '{pwd}'")

        print("Все роли и пользователи-аналитики настроены.")

    except Exception as e:
        print("Ошибка при настройке ролей:", e, file=sys.stderr)
        sys.exit(1)
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    setup_analytics_roles()
