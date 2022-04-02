#!/bin/bash
docker pull ubuntu:latest
docker run --name=my_container -v $(pwd):/home --rm -i -t ubuntu bash
docker exec -d my_container echo "yo" > log.txt 2> error-log.txt
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt