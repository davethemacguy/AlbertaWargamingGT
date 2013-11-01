<%-- 
    Document   : footer
    Created on : 1-Jan-2013, 1:54:25 PM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Footer</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script type='text/javascript'>
            var minwidth=225, maxwidth=500, finished=false, last_was_good=null;
            var likediv, likeframe, targwidth, boundlow, boundhigh;
            function loadcode(d, s, id)
            {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {return;}
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                fjs.parentNode.insertBefore(js, fjs);
            }
            function init()
            {
                loadcode(document, 'script', 'facebook-jssdk');
                likediv=document.getElementById('d2');
                setTimeout(initx, 10);
            }
            function initx()
            {
                likeframe=likediv.getElementsByTagName('iframe')[0];
                if (!likeframe) { setTimeout(initx, 10); return; }
                likeframe.style.width=minwidth+'px';
                setTimeout(trynewwidth, 1);
            }
            function trynewwidth()
            {
                if (last_was_good==null) { boundlow=minwidth; boundhigh=maxwidth; }
                else if (last_was_good) boundhigh=targwidth;
                else boundlow=targwidth;
                finished=((boundhigh-boundlow)<2);
                if (finished && last_was_good) { done(); return; }
                if (finished && !last_was_good) targwidth=boundhigh;
                else targwidth=parseInt((boundlow+boundhigh)/2);
                setTimeout(setwidth, 1);
            }
            function done()
            {
                //All finished, if we were hiding the div make it visible now
            }
            function setwidth()
            {
                likeframe=likediv.getElementsByTagName('iframe')[0];
                likeframe.style.width='10px';
                likeframe.style.height='0';
                setTimeout(checkframe, 10);
            }
            function checkframe()
            {
                var h=parseInt(likeframe.offsetHeight);
                if (h==0) { setTimeout(checkframe, 10); return; }
                likeframe.style.width=targwidth+'px';
                likeframe.style.height='0';
                setTimeout(checkframe2, 10);
            }
            function checkframe2()
            {
                var h=parseInt(likeframe.offsetHeight);
                if (h==0) { setTimeout(checkframe2, 10); return; }
                if (finished) { done(); return; }
                last_was_good=(h<26);
                setTimeout(trynewwidth, 1);
            }
        </script>

        <!--Style sheet for widgets-->
        <style type="text/css">
            .social-button {
                width: 0%;
                margin: 0 auto;
            }
        </style>
    </head>
    <body onload='init()' style='margin:10px 50px'>
        <!--Facebook script-->
        <script>(function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=324891624285941";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>

        <!--Facebook button-->
        <div class="social-button" style="width: 250px">
            <div id="fb-root"></div>
            <div class="fb-like" data-href="http://www.facebook.com/AlbertaGrandTournamentCircuit" data-send="true" data-width="225" data-show-faces="true"></div>
        </div>
        <br>

        <!--Twitter button-->
        <div class="social-button" style="width: 80px">
            <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.albertawargaminggt.com" data-text="Follow my progress toward the Alberta Wargaming GT!">Tweet</a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];
            if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        </div>
        <br>

        <!--<div class="social-button" style="width: 150px">
            <!-- Place this tag where you want the +1 button to render. -->
            <!--<div class="g-plusone" data-size="medium" data-annotation="inline" data-width="150" data-href="http://www.albertawargaminggt.com"></div>
            <!-- Place this tag after the last +1 button tag. -->
            <!--<script type="text/javascript">
        (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/plusone.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
            </script>
        </div>-->
    </body>
</html>
