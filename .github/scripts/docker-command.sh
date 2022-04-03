#!/bin/bash
# ANIMAL=${1}
SITE_NAME=${1}
SITE_PATH=${2}

docker run -v $(pwd):/home --rm ubuntu echo "yo"

if [ -s $SITE_NAME-error-log.txt ]; then
    echo -n $SITE_NAME, >> site-errors.txt
fi

