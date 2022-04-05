#!/bin/bash
# ANIMAL=${1}
SITE_NAME=${1}
SITE_PATH=${2}

docker run --name $SITE_NAME -v $(pwd):/home --rm ubuntu cat doesnotexist.txt > $SITE_NAME-log.txt 2> $SITE_NAME-error-log.txt

if [ -s $SITE_NAME-error-log.txt ]; then
    echo "THERE IS AN ERROR LOG FOR $SITE_NAME"
    echo -n $SITE_NAME, >> site-errors.txt
fi

# BUILD_ERRORS=$(grep -i such $SCOPE_NAME-error-log.txt) 
# if [ ! -z $BUILD_ERRORS ]; then
#     echo -n $SCOPE_NAME, >> site-errors.txt
# fi

docker rm $SITE_NAME