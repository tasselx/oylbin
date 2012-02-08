#!/bin/bash

function commit_file(){
    filename=$1
    rsync -avz $filename hotel@122.11.61.28:~/oylbin/sshtunnel/tmp/
    basename=$(basename $filename)
    ssh hotel@122.11.61.28 "/home/hotel/oylbin/sshtunnel/tool.sh commit_file $basename"
}

function update_svn(){
    ssh hotel@122.11.61.28 "/home/hotel/oylbin/sshtunnel/tool.sh update_svn"
}

case "$1" in
    update|up)
        update_svn
    ;;
    commit|ci)
        shift 1
        commit_file $@
    ;;
    restart)
        ssh hotel@122.11.61.28 "cd /home/hotel/oylbin/sshtunnel && touch restart && tail access.log"
        ;;
    log)
        ssh hotel@122.11.61.28 "cd /home/hotel/oylbin/sshtunnel && tail access.log"
        ;;
    tunnel)
        ssh -t hotel@122.11.61.28 "cd /home/hotel/oylbin/sshtunnel && ./bridge.sh"
        ;;
	*)
		echo "Usage: $0 {update|up|commit|ci|restart|log|tunnel}"
		exit 1
	;;
esac
