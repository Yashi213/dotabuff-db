import os
import subprocess
from datetime import datetime
from pathlib import Path

# Конфиги из env
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_ADMIN_USER")
DB_PASS = os.getenv("DB_ADMIN_PASSWORD")
DB_HOST = os.getenv("DB_HOST", "haproxy")
DB_PORT = int(os.getenv("DB_PORT", "5000"))
BACKUP_DIR = "/backups"
RETENTION = int(os.getenv("BACKUP_RETENTION_COUNT", 5))

Path(BACKUP_DIR).mkdir(parents=True, exist_ok=True)
timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
backup_file = f"{BACKUP_DIR}/{DB_NAME}-{timestamp}.sql"

os.environ["PGPASSWORD"] = DB_PASS

# pg_dump
cmd = [
    "pg_dump",
    "-h", DB_HOST,
    "-U", DB_USER,
    "-d", DB_NAME,
    "-p", str(DB_PORT),
    "-f", backup_file
]

subprocess.run(cmd, check=True)
print(f"✅ Backup created: {backup_file}")

# Удаляем старые
backups = sorted(Path(BACKUP_DIR).glob(f"{DB_NAME}-*.sql"), reverse=True)
for old in backups[RETENTION:]:
    old.unlink()
    print(f"🗑️ Removed old backup: {old}")
