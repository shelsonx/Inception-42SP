#!/bin/sh

docker rm -f $(docker ps -aq) 2>/dev/null 
docker rmi -f $(docker images -aq) 2>/dev/null 
docker volume rm -f $(docker volume ls -q) 2>/dev/null 
