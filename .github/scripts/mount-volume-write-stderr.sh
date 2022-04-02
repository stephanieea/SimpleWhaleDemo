#!/bin/bash
docker pull ubuntu:latest
docker run --name=my_container -v $(pwd):/home ubuntu echo "yo yo"
docker exec my_container sh -c "echo yo" > log.txt 2> error-log.txt
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt