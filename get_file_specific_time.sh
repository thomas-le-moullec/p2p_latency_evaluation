#!/bin/bash

NB_ARGS="$#"
AT=`which at`
IPFS=`which ipfs`
TIME=`which time`

RESULT_FOLDER="latency_result"

check_arguments()
{
        if [ "$NB_ARGS" -ne 2 ]; then
            echo "Illegal number of parameters"
            exit
        fi
        # Check if arguments format are valids
        FILE=$1
        DATE=$2
}

schedule_task()
{
        RESULT_FILE="$FILE$DATE$USER"
        mkdir -p $RESULT_FOLDER
        echo "($TIME -f \"\t%E real,\t%U user,\t%S sys\" $IPFS get $FILE) >> $RESULT_FOLDER/$RESULT_FILE 2>&1" | $AT $DATE >/dev/null 2>&1
}

check_arguments $1 $2
schedule_task