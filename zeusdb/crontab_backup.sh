#!/bin/bash

folders="main.tcb.8888"

export SCRIPTDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for folder in $folders
do
    $SCRIPTDIR/db backup $folder
    cd $folder/backup && find . -type f -mtime +5 -exec rm {} \;
done
