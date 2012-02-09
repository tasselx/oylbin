#!/bin/bash

case "$1" in
    sync)
        ssh hotel@122.11.61.28 "touch /home/hotel/oylbin/sshtunnel/need_commit/sync"
        echo "svn should be synced in 2 minutes"
    ;;
    commit|ci)
        filename=$2
        scp $filename hotel@122.11.61.28:/home/hotel/oylbin/sshtunnel/need_commit/
        echo "$filename should be committed in 2 minutes"
        ssh hotel@122.11.61.28 "touch /home/hotel/oylbin/sshtunnel/need_commit/sync"
        echo "svn should be synced in 2 minutes"
    ;;
    restart)
        ssh hotel@122.11.61.28 "cd /home/hotel/oylbin/sshtunnel && touch restart && tail access.log && date +'%Y-%m-%d %H:%M:%S'"
        echo "ssh tunnel should be restart in 1 minitue"
        ;;
    log)
        ssh hotel@122.11.61.28 "cd /home/hotel/oylbin/sshtunnel && tail access.log && date +'%Y-%m-%d %H:%M:%S'"
        ;;
    tunnel)
        ssh -t hotel@122.11.61.28 "cd /home/hotel/oylbin/sshtunnel && ./bridge.sh"
        ;;
	*)
		echo "Usage: $0 {sync|commit|ci|restart|log|tunnel}"
		exit 1
	;;
esac
