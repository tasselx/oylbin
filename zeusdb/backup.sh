#!/bin/bash

db_fullpath=$1
timestamp=$2

db_dirname="$( cd -P "$( dirname "$db_fullpath" )" && pwd )"
db_basename=$(basename "$db_fullpath")

mkdir -p $db_dirname/backup

cp $db_fullpath $db_dirname/backup/$db_basename.$timestamp  && \
    echo $(date +"%Y-%m-%d %H:%M:%S") $db_basename.$timestamp >> $db_dirname/backup/backup.log
