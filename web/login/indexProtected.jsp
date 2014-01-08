<!DOCTYPE html>
<html>
    <head>
        <title>AWGT</title>
        <jsp:include page="getString?stringId=eventInfo"/>
        <%@include file="/includes/header.jsp" %>

        <style type="text/css">

            #changeEventRoster{
                margin-left:50px;
                margin-right: 50px;
                margin-bottom: 25px;
            }
            #tableParams {
                width:1130px;
                text-align:center;
            }
            #instafeedStyling
            {
                height: 740px;
                width: 515px;
                overflow-y: hidden;
                background: #f4f4f4;
                z-index: 1;
                margin-left:auto;
            }
        </style> 
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.8.21/jquery-ui.min.js"></script>
        
        <script>
            var eventName = '';
            var eventDate = '';
            var events = new Array();
            var gclaData = 'https://www.google.com/calendar/feeds/awgtcircuit%40gmail.com/public/full?orderby=starttime&sortorder=ascending&max-results=3&futureevents=true&alt=json';
            $.getJSON(gclaData, callbackFunction);

            function callbackFunction(data)
            {
                for (var i = 0; i < data.feed.entry.length; i++) {
                    eventName = data.feed.entry[i].title.$t;
                    eventDate = data.feed.entry[i].gd$when[0].startTime;
                    var event = new Array();
                    event[0] = eventName;
                    event[1] = eventDate;
                    window.events[i] = event;
                }
                $('#nextEvent').append(events[0][0]);
            }
            </script>
            <script type="text/javascript" src=<%request.getContextPath();%>"/AlbertaWargaming/includes/instafeed.min.js" ></script>
            <script>
            var feed = new Instafeed({
                /*clientId: 'a51bca432d644a518280ffae5045cd95',
                 accessToken: '538640816.a51bca4.995ad8d2a8f641a18fc75cba333efc97',
                 template: '<div style="padding-left:15px; padding-right:15px; padding-bottom:30px; float: left;"><div onclick="window.open(\'{{link}}\',\'instagram\');" style="cursor:hand; cursor:pointer; border: 2px solid black; border-radius: 20px; -moz-border-radius: 20px; -khtml-border-radius: 20px; -webkit-border-radius: 20px; width: 130px; height: 130px; background-position:center; background-image: url(\'{{image}}\');"></div></div>',
                 get: 'user',
                 userId: '538640816',
                 sortBy: 'most-recent',
                 limit: '60'*/
                get: 'tagged',
                tagName: 'awgt',
                clientId: '8546acafc51e435083ffd6b1eb17de55',
                sortBy: 'random',
                limit: '60',
                template: '<div style="padding-left:15px; padding-right:15px; padding-bottom:30px; float: left;"><div onclick="window.open(\'{{link}}\',\'instagram\');" style="cursor:hand; cursor:pointer; border: 2px solid black; border-radius: 20px; -moz-border-radius: 20px; -khtml-border-radius: 20px; -webkit-border-radius: 20px; width: 130px; height: 130px; background-position:center; background-image: url(\'{{image}}\');"></div></div>'
            });
            feed.run();
        </script>
    </head>

    <body>
        <div id="container">
            <div id="fb-root"></div>
            <script>
                (function(d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id))
                        return;
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=324891624285941";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));
            </script>
            <div class='title'>Stay Connected</div>
            <div class="hr"><hr /></div>
            <table id="tableParams">
                <tr>
                    <td style="vertical-align:text-top;">
                        <div style="text-decoration:underline">The next event is:</div><br>
                        <div style="font-size: 20px" id ="nextEvent"></div>
                        <div id="instafeedStyling">
                            <img style="float:left" src=<%request.getContextPath();%>"/AlbertaWargaming/images/instagram-logo.png"/> 
                            <div style="color: lightgray; float: right; padding-top: 10px">#awgt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            <div style="float: right; padding-top: 10px">@albertawargaminggt&nbsp;</div>
                            <div style="height: 700px; float: left; overflow-y: scroll;" id="instafeed"></div>
                        </div>
                    </td>
                    <td>
                        <div class="fb-like-box" data-href="https://www.facebook.com/AlbertaGrandTournamentCircuit"  data-width="530" data-height="740" data-show-faces="false" data-header="false" data-stream="true" data-show-border="false"></div>
                        <!--Facebook script-->
                        <script>
                            (function(d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id))
                                    return;
                                js = d.createElement(s);
                                js.id = id;
                                js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=324891624285941";
                                fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));
                        </script>
                        <!--Facebook button-->                      
                        <div class="social-button" style="width: 530px;">
                            <div class="fb-like" data-href="http://www.facebook.com/AlbertaGrandTournamentCircuit" data-send="true" data-width="530" data-show-faces="true"></div>
                        </div>
                        <br>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>