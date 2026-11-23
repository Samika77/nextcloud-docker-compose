#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="${BACKUP_DIR:-./backups}"
VOLUME_NAME="${NEXTCLOUD_DATA_VOLUME:-nextcloud-docker-compose_nextcloud_data}"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
FILE="${BACKUP_DIR}/nextcloud_data_${TIMESTAMP}.tar.gz"

mkdir -p "${BACKUP_DIR}"

if ! docker volume inspect "${VOLUME_NAME}" > /dev/null 2>&1; then
  echo "Error: Docker volume '${VOLUME_NAME}' not found."
  exit 1
fi

docker run --rm \
  -v nextcloud-docker-compose_nextcloud_data:/data:ro \
  -v "$(pwd)/${BACKUP_DIR}":/backup \
  alpine \
  tar czf "/backup/$(basename "${FILE}")" -C /data .

echo "Backup created (nextcloud): ${FILE}"
