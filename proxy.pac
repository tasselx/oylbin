function regExpMatch(url, pattern) {
	try { return new RegExp(pattern).test(url); } catch(ex) { return false; }
}

function FindProxyForURL(url, host)
{
    url = url.toLowerCase();
    host = host.toLowerCase();
    
    // whole site
    var site_list = [
        '21mybbs.com'
        ,'appspot.com'
        ,'avno1.com'
        ,'android.com'

        ,'bitsnoop.com'
        ,'blogger.com'
        ,'blogspot.com'
        ,'bit.ly'

        ,'caobian.info'

        ,'fc2.com'
        ,'feedburner.com'
        ,'ff.im'
        ,'flickr.com'
        ,'friendfeed.com'
        ,'facebook.com'
        ,'facebook.net'
        ,'fbcdn.net'

        ,'gawker.com'
        ,'ggpht.com'
        ,'goo.gl'
        ,'google.com'
        ,'google.com.hk'
        ,'google.com.tw'
        ,'googleusercontent.com'

        ,'hecaitou.net'

        ,'ihompy.com'
        ,'img.ly'
        ,'imageurlhost.com'
        ,'is.gd'

        ,'launchpad.net'

        ,'metweek.com'
        ,'mail-archive.com'

        ,'payhk.boyaa.us'
        ,'pixnet.net'
        ,'plurk.com'
        ,'posterous.com'

        ,'sexinsex.net'
        ,'scribd.com'
        ,'scribdassets.com'

        ,'t.co'
        ,'twitgoo.com'
        ,'twitter.com'
        ,'twitpic.com'
        ,'twimg.com'
        ,'tweetphoto.com'
        ,'teamdouche.net'

        ,'w3schools.com'
        ,'wordpress.com'

        ,'xuite.net'

        ,'youhot.com'
        ,'youtube.com'
        ,'ytimg.com'
    ];
    
    var exp_list = [ ];

    for(var index = 0;index<site_list.length;index++){
         if(host==site_list[index] ||
             shExpMatch(host, "*." + site_list[index])){
            return "SOCKS5 127.0.0.1:8527";
         }
    }
    for(var index = 0;index<exp_list.length;index++){
        var re = new RegExp(exp_list[index]);
        if(url.match(re)){
            return "SOCKS5 127.0.0.1:8527";
        }
    }
    return "DIRECT";
}
