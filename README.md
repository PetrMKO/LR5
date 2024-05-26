## Описание
В [docker-compose.yaml](./docker-compose.yaml) описаны 4 сервиса:
- Master кластер postgresql
- Сервис реплики postgresql
- Два зомби хоста на примере которых демонстрируются пользовательские сессии

## Сборка
В терминале запрускаем 
```
sudo docker-compose up -d
```
Чтобы завершить compose
```
sudo docker-compose down
```

## Подклюсение к зомби зостам и кластерам
Чтобы подключится к зомби хосту и сразу к postgresql
```
docker exec -it lr4-second-zombie-1 psql -h <gateway сети> -p <порт узла> -U <имя пользователя> -d postgres

```

Адрес gateway можно посмотреть на вкладке inspect котейнера postgresql  
По умолчанию порты:
- 5432 – Master postgres
- 5433 – Replica postgres

Для зомби хостов есть два пользователя:
- login: first-zombie password: pass
- login: second-zombie password: pass



