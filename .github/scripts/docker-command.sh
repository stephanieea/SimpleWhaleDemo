#!/bin/bash
# ANIMAL=${1}
SCOPE_NAME=${1}
SITE_PATH=${2}

docker run --name $SITE_NAME -v $(pwd):/home --rm ubuntu cat doesnotexist.txt > $SITE_NAME-log.txt 2> $SITE_NAME-error-log.txt

# if [ -s $SITE_NAME-error-log.txt ]; then
#     echo "THERE IS AN ERROR LOG FOR $SITE_NAME"
#     echo $SITE_NAME, >> site-errors.txt
# fi

BUILD_ERRORS=$(grep -i such $SCOPE_NAME-error-log.txt) 
if [[ ! $BUILD_ERRORS ]]; then
    echo -n $SCOPE_NAME, >> site-errors.txt
fi

