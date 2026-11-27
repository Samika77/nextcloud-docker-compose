# Развертывание Nextcloud и PostgreSQL с помощью Docker Compose.

## Состав проекта
- Nextcloud в контейнере
- PostgreSQL в контейнере
- Docker Compose
- Переменные окружения через .env
- Docker volumes для сохранения данных
- Healthcheck для PostgreSQL
- Зависимость Nextcloud от готовности PostgreSQL
- Nginx как reverse proxy
- Скрипты резервного копирования PostgreSQL и данных Nextcloud
- Лимиты оперативной памяти для контейнеров
- Ротация логов Docker
- Makefile для управления сервисами и резервным копированием

## Требования
- Docker
- Docker Compose
- Make
- WSL2 + Ubuntu или Linux

## Запуск
1. Скопировать шаблон переменных окружения:
```bash
cp .env.example .env
```
2. Задать пароль PostgreSQL в файле .env.
3. Запустить сервисы:
```bash
docker compose up -d
```
4. Проверить состояние контейнеров:
```bash
docker compose ps
```
5. Открыть Nextcloud:
http://localhost:8080

## Остановка
- docker compose down

## Логи
- Просмотр логов Nextcloud:
```bash
docker compose logs -f app
```
- Просмотр логов PostgreSQL
```bash
docker compose logs -f db
```

## Выход из просмотра логов 
- Ctrl + C.

## Сохранение данных
После остановки и повторного запуска контейнеров данные Nextcloud и базы данных сохраняются благодаря Docker volumes.

## Reverse proxy
Nginx работает как reverse proxy. Внешний доступ к Nextcloud осуществляется через порт `8080`; порт Nextcloud напрямую не публикуется.

## Резервное копирование
- Бэкап базы PostgreSQL:
```bash
make backup-db
```
- Бэкап данных Nextcloud:
```bash
make backup-files
```
Файлы бэкапов сохраняются в папку `backups/` и не попадают в Git.

## Переменные окружения
- Файл .env содержит локальные параметры и не попадает в Git. В репозиторий коммитится только .env.example.

## PostgreSQL
- PostgreSQL разворачивается как отдельный сервис в Docker Compose и используется Nextcloud в качестве базы данных.

## Лимиты ресурсов и ротация логов
- Контейнерам заданы лимиты оперативной памяти через `deploy.resources.limits.memory`. 
- Логи Docker используют драйвер `json-file` с ротацией: до 10 MB на файл и до 3 файлов на контейнер.

## Управление через Makefile
Makefile содержит сокращённые команды для основных операций с проектом.
```bash
make up
make down
make ps
make logs
make logs-app
make logs-db
make shell
make backup-db
make backup-files
```
