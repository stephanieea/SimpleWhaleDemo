#!/bin/bash

docker run -v $(pwd):/home $DOCKER_IMAGE_TAG cat noexist.txt > log.txt 2> error-log.txt