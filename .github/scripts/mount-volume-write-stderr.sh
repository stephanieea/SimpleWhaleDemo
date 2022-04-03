#!/bin/bash
docker pull ubuntu:latest
docker run -d --name my_volume -v $(pwd):/home ubuntu cat not_a_file.txt > log.txt > error-log.txt
tree -a
echo "LOG"
cat log.txt
echo "ERROR LOG"
cat error-log.txt