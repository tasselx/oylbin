#!/bin/bash
SCRIPTDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

local_tunnel_port=8527

# 作为桥接的机器上运行的脚本

check_tunnel() {
    if test -n "$(netstat -nltp 2>/dev/null | grep '127.0.0.1:8080')" ;then
        return 0
    else
        return 1
    fi
}

stop_local_tunnel() {

    local_tunnel_port=$1

    local_tunnel_pid=$(ps aux | grep "$local_tunnel_port:127.0.0.1:8080" | grep -v grep | awk '{print $2}')

    if test -z "$local_tunnel_pid"; then
        return 0
    fi

    kill $local_tunnel_pid

    wait_time=0
    while test "$wait_time" -lt 5 ;do
        let "wait_time=wait_time+1"
        echo "stop local tunnel[$local_tunnel_port], waiting [$wait_time]"
        local_tunnel_pid=$(ps aux | grep "$local_tunnel_port:127.0.0.1:8080" | grep -v grep | awk '{print $2}')
        if test -z "$local_tunnel_pid"; then
            return 0
        fi
        sleep 1
    done
    echo "failed to stop local tunnel [$local_tunnel_port]"
    return 1
}

start_local_tunnel() {

    local_tunnel_port=$1

    log_file=$SCRIPTDIR/bridge.log

    ssh -4NvgL $local_tunnel_port:127.0.0.1:8080 -o "StrictHostKeyChecking no" localhost > $log_file 2>&1 &

    wait_time=0
    session_started=0
    while test "$wait_time" -lt 5 ;do
        let "wait_time=wait_time+1"
        echo "start local tunnel, waiting[$wait_time]"
        sleep 1
        if test -n "$(grep "debug1: Entering interactive session." $log_file )";then
            session_started=1
            break
        fi
    done

    if test "$session_started" = "0";then
        echo "failed to start local tunnel[$local_tunnel_port]"
        return 1
    fi
    
    if test -n "$(grep 'bind: Address already in use' $log_file)";then
        echo "failed to start local tunnel[$local_tunnel_port], [$local_tunnel_port] already in use"
        stop_local_tunnel $local_tunnel_port
        return 1
    fi

    # check tunnel

}

if ! check_tunnel ;then
    echo "ssh tunnel not exist"
    exit 1
fi
if ! stop_local_tunnel $local_tunnel_port ;then
    exit 1
fi

if ! start_local_tunnel $local_tunnel_port ;then
    exit 1
fi

# wait
echo "try to connect with local tunnel"
ssh -o "StrictHostKeyChecking no" -p $local_tunnel_port work@127.0.0.1 "$1"

stop_local_tunnel $local_tunnel_port
