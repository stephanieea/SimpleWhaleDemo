#!/bin/bash
docker pull ubuntu:latest
docker run --name my_volume -v $(pwd):/home --rm ubuntu bash
CONTAINER_ID=$(docker ps -aqf "name=my_volume")
docker exec -d $CONTAINER_ID touch hello.txt
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt