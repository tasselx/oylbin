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

        ,'blogger.com'
        ,'blogspot.com'
        ,'bit.ly'

        ,'caobian.info'

        ,'fc2.com'
        ,'ff.im'
        ,'flickr.com'
        ,'friendfeed.com'
        ,'facebook.com'
        ,'facebook.net'
        ,'fbcdn.net'

        ,'ggpht.com'
        ,'goo.gl'
        ,'googleusercontent.com'

        ,'hecaitou.net'

        ,'ihompy.com'
        ,'img.ly'
        ,'imageurlhost.com'

        ,'metweek.com'
        ,'mail-archive.com'

        ,'pixnet.net'

        ,'sexinsex.net'

        ,'twitgoo.com'
        ,'twitter.com'
        ,'twitpic.com'
        ,'tweetphoto.com'
        ,'teamdouche.net'

        ,'wordpress.com'

        ,'xuite.net'

        ,'youhot.com'
        ,'youtube.com'
        ,'ytimg.com'
    ];
    
    var exp_list = [
     'https://(encrypted|spreadsheets)\.google\.com/.*',
     'http://(spreadsheets|groups|picasaweb|feedproxy)\.google\.com/.*',
     'http://www\.google\.com/(((search|url)\?)|analytics|calendar|profile).*',
     'http://[^/]*/search\\?q=cache.*'
    ];

    for(var index = 0;index<site_list.length;index++){
         if(host==site_list[index] ||
             shExpMatch(host, "*." + site_list[index])){
            return "SOCKS5 localhost:8527; DIRECT";
         }
    }
    for(var index = 0;index<exp_list.length;index++){
        var re = new RegExp(exp_list[index]);
        if(url.match(re)){
            return "SOCKS5 localhost:8527; DIRECT";
        }
    }
    return "DIRECT";
}
