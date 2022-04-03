#!/bin/bash
ANIMAL=${1}

docker run -d -v $(pwd):/home --rm ubuntu cat not_a_file.txt > $ANIMAL-log.txt > $ANIMAL-error-log.txt
