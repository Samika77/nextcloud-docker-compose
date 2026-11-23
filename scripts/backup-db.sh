#!/usr/bin/env bash
set -euo pipefail

set -a
source .env
set +a

BACKUP_DIR="${BACKUP_DIR:-./backups}"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
FILE="${BACKUP_DIR}/nextcloud_db_${TIMESTAMP}.sql"

mkdir -p "${BACKUP_DIR}"

docker compose exec -T db \
  pg_dump -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" \
  > "${FILE}"

echo "Backup created: ${FILE}"
