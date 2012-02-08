<?php
error_log(
    "[".date('Y-m-d H:i:s')."][".$_SERVER['REMOTE_ADDR']."] ".json_encode($_REQUEST)."\n",3,__DIR__."/access.log");
if($_REQUEST['restart']==1){
    unlink(__DIR__.'/restart');
    echo "restarted";
}else{
    $filename = __DIR__."/restart";
    if(file_exists($filename)){
        echo "restart";
    }else{
        echo "nothing";
    }
}
