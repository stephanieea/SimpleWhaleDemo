#!/bin/bash
docker pull ubuntu:latest
docker run -d --name my_volume -v $(pwd):/home ubuntu echo "YO $NOT_A_VAR" > log.txt > error-log.txt
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt