<?php
error_log(
    "[".date('Y-m-d H:i:s')."][".$_SERVER['REMOTE_ADDR']."] ".json_encode($_REQUEST)."\n",3,__DIR__."/access.log");
function savelog($msg){
    $t = date('Y-m-d H:i:s');
    error_log("[$t][$msg]\n",3,__DIR__."/access.log");
}

if($_REQUEST['restart']==1){
    unlink(__DIR__.'/restart');
    echo "restarted";
    savelog("ssh tunnel restarted");
}else{
    $filename = __DIR__."/restart";
    if(file_exists($filename)){
        echo "restart";
        savelog("set restart command , ssh tunnel should be restart in 1 minute");
    }else{
        echo "nothing";
        savelog($_SERVER['REMOTE_ADDR']." alive");
    }
}
