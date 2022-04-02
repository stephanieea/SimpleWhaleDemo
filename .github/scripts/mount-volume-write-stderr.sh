#!/bin/bash
docker pull ubuntu:latest
docker run -v $(pwd):/home ubuntu echo "yo" > log.txt 2> error-log.txt
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt