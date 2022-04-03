#!/bin/bash
docker pull ubuntu:latest
docker run -d --name my_volume -v $(pwd):/home ubuntu echo "YO"
CONTAINER_ID=$(docker ps -aqf "name=my_volume")
docker exec $CONTAINER_ID sh "touch hello.txt"
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt