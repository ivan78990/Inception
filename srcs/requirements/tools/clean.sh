#!/bin/sh

docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker rmi -f $(docker images -qa)
sudo docker volume rm $(docker volume ls -q)
sudo docker network rm $(docker network ls -q) 2>/dev/null
docker system prune -a --force
