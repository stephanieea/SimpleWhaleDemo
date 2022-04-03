#!/bin/bash
# ANIMAL=${1}
SITE_NAME=${1}
SITE_PATH=${2}

docker run -d -v $(pwd):/home --rm ubuntu cat not_a_file.txt > $SITE_NAME-log.txt > $SITE_NAME-error-log.txt

if [ -s $SITE_NAME-error-log.txt ]; then
    echo $SITE_NAME >> site-errors.txt
fi

