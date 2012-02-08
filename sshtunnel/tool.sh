#!/bin/bash
SCRIPTDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

case "$1" in
    update_svn)
        $SCRIPTDIR/bridge.sh "cd ~/local/src/ && ./sync_svn2.sh && ./sync_svn_chocolate.sh"
        ;;
    commit_file)
        $SCRIPTDIR/bridge.sh "cd ~/local/src/ && ./commit_file.sh $2 && ./sync_svn2.sh && ./sync_svn_chocolate.sh"
        ;;
esac

