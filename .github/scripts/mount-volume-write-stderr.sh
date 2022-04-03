#!/bin/bash
docker pull ubuntu:latest
docker run --name my_container -v $(pwd):/home --rm ubuntu bash
docker exec -d my_container touch hello.txt
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt