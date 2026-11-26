.PHONY: up down ps logs logs-app logs-db shell backup-db backup-files

up:
	docker compose up -d

down:
	docker compose down

ps:
	docker compose ps

logs:
	docker compose logs -f

logs-app:
	docker compose logs -f app

logs-db:
	docker compose logs -f db

shell:
	docker compose exec app bash

backup-db:
	./scripts/backup-db.sh

backup-files:
	./scripts/backup-nextcloud-data.sh
