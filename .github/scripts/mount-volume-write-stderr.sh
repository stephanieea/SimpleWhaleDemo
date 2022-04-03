#!/bin/bash
docker pull ubuntu:latest
docker run --name my_volume -v $(pwd):/home ubuntu echo "YO"
docker ps -aqf "name=my_volume"
CONTAINER_ID=$(docker ps -aqf "name=my_volume")
echo $CONTAINER_ID
docker exec -d $CONTAINER_ID sh "touch hello.txt"
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt