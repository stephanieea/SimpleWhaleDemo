#!/bin/bash
docker run -v $(pwd):/home ubuntu echo "yo" > log.txt 2> error-log.txt