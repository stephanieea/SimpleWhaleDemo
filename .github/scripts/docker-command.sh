#!/bin/bash
# ANIMAL=${1}
SITE_NAME=${1}
SITE_PATH=${2}

docker run -d -v $(pwd):/home --rm ubuntu cat not_a_file.txt > $SITE_NAME-log.txt > $SITE_NAME-error-log.txt

if [ -s $SITE_NAME-error-log.txt ]; then
    SITE_ERRORS+=$SITE_NAME
fi

echo "SCRIP SITE ERRORS"
echo $SITE_ERRORS