# Развертывание Nextcloud и PostgreSQL с помощью Docker Compose.

## Состав проекта
- Nextcloud в контейнере
- PostgreSQL в контейнере
- Docker Compose
- Переменные окружения через .env
- Docker volumes для сохранения данных
- Healthcheck для PostgreSQL
- Зависимость Nextcloud от готовности PostgreSQL

## Требования
- Docker
- Docker Compose
- WSL2 + Ubuntu или Linux

## Запуск
1. Скопировать шаблон переменных окружения:
cp .env.example .env

2. Задать пароль PostgreSQL в файле .env.

3. Запустить сервисы:
docker compose up -d

4. Проверить состояние контейнеров:
docker compose ps

5. Открыть Nextcloud:
http://localhost:8080

## Остановка
docker compose down

## Логи
- Просмотр логов Nextcloud:
docker compose logs -f app
- Просмотр логов PostgreSQL
docker compose logs -f db

## Выход из просмотра логов: Ctrl + C.

## Сохранение данных
После остановки и повторного запуска контейнеров данные Nextcloud и базы данных сохраняются благодаря Docker volumes.

## Основные команды
Показать запущенные контейнеры:
docker compose ps

Посмотреть логи Nextcloud:
docker compose logs -f app

Зайти в контейнер Nextcloud:
docker compose exec app bash

## Переменные окружения
- Файл .env содержит локальные параметры и не попадает в Git. В репозиторий коммитится только .env.example.

## PostgreSQL
- PostgreSQL разворачивается как отдельный сервис в Docker Compose и используется Nextcloud в качестве базы данных.
