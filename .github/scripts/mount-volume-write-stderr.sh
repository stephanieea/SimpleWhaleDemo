#!/bin/bash
docker run -v $(pwd):/home ubuntu cat noexist.txt > log.txt 2> error-log.txt