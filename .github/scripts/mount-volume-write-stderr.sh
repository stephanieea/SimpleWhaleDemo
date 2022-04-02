#!/bin/bash

docker run -v $(pwd):/home ushamandya/whale-example cat noexist.txt > log.txt 2> error-log.txt