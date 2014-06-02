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
        ,'amazon.com'

        ,'bitsnoop.com'
        ,'blogger.com'
        ,'blogspot.com'
        ,'blogspot.tw'
        ,'bit.ly'

        ,'caobian.info'

        ,'edgekey.net'

        ,'fc2.com'
        ,'feedburner.com'
        ,'feedly.com'
        ,'ff.im'
        ,'flickr.com'
        ,'friendfeed.com'
        ,'facebook.com'
        ,'facebook.net'
        ,'fbcdn.net'
        ,'github.global.ssl.fastly.net'
        ,'fastly.net'

        ,'gawker.com'
        ,'ggpht.com'
        ,'github.com'
        ,'goo.gl'
        ,'google.com'
        ,'google.com.hk'
        ,'google.com.tw'
        ,'googleapis.com'
        ,'googleusercontent.com'
        ,'gstatic.com'
        ,'googleapis.com'

        ,'hecaitou.net'

        ,'ihompy.com'
        ,'img.ly'
        ,'imageurlhost.com'
        ,'is.gd'

        ,'launchpad.net'

        ,'metweek.com'
        ,'mail-archive.com'
        ,'mediafire.com'

        ,'name.com'

        ,'payhk.boyaa.us'
        ,'pixnet.net'
        ,'plurk.com'
        ,'posterous.com'

        ,'sex.com'
        ,'sexinsex.net'
        ,'scribd.com'
        ,'scribdassets.com'
        ,'slideshare.net'
        ,'sstatic.net'


        ,'t.co'
        ,'twitgoo.com'
        ,'twitter.com'
        ,'twitpic.com'
        ,'twimg.com'
        ,'tweetphoto.com'
        ,'teamdouche.net'

        ,'vimeo.com'
        ,'w3schools.com'
        ,'wordpress.com'
        ,'witopia.net'
        ,'zopim.com'

        ,'xuite.net'
        ,'x-art.com'

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
