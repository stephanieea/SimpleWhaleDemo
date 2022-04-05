#!/bin/bash
# ANIMAL=${1}
SCOPE_NAME=${1}
SITE_PATH=${2}

docker run --name $SCOPE_NAME -v $(pwd):/home --rm ubuntu sleep 30 && cat doesnotexist.txt > $SCOPE_NAME-log.txt 2> $SCOPE_NAME-error-log.txt

# if [ -s $SCOPE_NAME-error-log.txt ]; then
#     echo "THERE IS AN ERROR LOG FOR $SCOPE_NAME"
#     echo $SCOPE_NAME, >> site-errors.txt
# fi

echo "can you see this"

BUILD_ERRORS=$(grep -i such $SCOPE_NAME-error-log.txt) 
if [[ $BUILD_ERRORS ]]; then
    echo "ERROR FOR $SCOPE_NAME:" >> site-errors.txt
    echo $BUILD_ERRORS >> site-errors.txt
fi

