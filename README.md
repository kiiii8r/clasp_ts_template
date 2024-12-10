docker exec -it project_x-spreadsheet-1 bash
docker exec -it project_x-standalone-1

docker compose down
docker compose up -d --build  