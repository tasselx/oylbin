#!/bin/bash
php_bin="/home/hotel/work/sys/php/bin/php"
worker="/home/hotel/qidian/web/qidian/worker.php"

process_info=`ps -f -u hotel | grep $worker | grep -v grep`

if [[ $process_info == "" ]]
then
    $php_bin $worker < /dev/null >/dev/null 2>&1 &
    process_info=`ps -f -u hotel | grep $worker | grep -v grep`
    echo -e "122.11.61.28 feed worker process is not running, try to restart\n $process_info"
    echo -e "122.11.61.28 feed worker process is not running, try to restart\n $process_info"| mutt -s "[Warning] try to restart worker" oylbin@gmail.com
fi
