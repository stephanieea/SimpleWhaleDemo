#!/bin/bash
ANIMAL=${1}

docker run -d --name my_volume -v $(pwd):/home ubuntu cat not_a_file.txt > $ANIMAL-log.txt > $ANIMAL-error-log.txt
