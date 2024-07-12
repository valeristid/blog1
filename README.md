# README
Скачиваем
git clone https://github.com/valeristid/blog1
cd blog1

Собираем докер образ
docker-compose up --build

Производим миграцию баз данных
docker-compose exec web rails db:create db:migrate

Открываем приложение в бразуере
http://localhost:3001
