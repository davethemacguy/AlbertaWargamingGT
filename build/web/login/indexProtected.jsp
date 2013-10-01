<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title></title>
        <jsp:include page="getString?stringId=eventInfo"/>
        <%@include file="/includes/header.jsp" %>
        <style type="text/css">
            h1{
                font: Klavika;
                text-align: center;
                font-size: 200%;
            }
        </style> 
    </head>

    <body>
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=324891624285941";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
        <div id="mainBody">
            <table>
                <tr valign="top">
                    <td>
                <center><u>The next event is:</u><br></center>
                        <%@include file="/includes/countdown.jsp"%>
                        <div style="width: 530px; text-align:center; height: 100% auto;">
                            <div id="changeEventRoster">${text}</div>
                            <%if (request.isUserInRole("TO") || request.isUserInRole("admin")) {%>
                            <script>var html = document.getElementById("changeEventRoster").innerHTML </script>
                            <form id="adminInput" action="TO/updateString" method="post">
                                <textarea style="width:500px; height:400px; overflow-y: hidden" id="changes" name="text" form="adminInput"></textarea>
                                <script> document.getElementById("changes").innerHTML = html; </script>
                                <br />
                                <input type="hidden" value="eventInfo" name="stringId">
                                <input type="submit" value="Submit" >
                            </form>
                            <%}%>
                        </div>

                        <div id="instafeedStyling">
                            <img style="float:left" src=<%request.getContextPath();%>"/AlbertaWargaming/images/instagram-logo.png"/> 
                            <div style="color: lightgray; float: right; padding-top: 10px">#awgt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            <div style="float: right; padding-top: 10px">@albertawargaminggt&nbsp;</div>
                            <div style="height: 380px; float: left; overflow-y: scroll;" id="instafeed"></div>
                        </div>
                        <br>
                        <!-- BEGIN: Twitter website widget (http://twitterforweb.com) -->
                        <div style="width:515px;font-size:8px;text-align:right;"><script type="text/javascript">
                        document.write(unescape("%3Cscript src='http://twitterforweb.com/twitterbox.js?username=webgadget&settings=1,1,1,515,300,f4f4f4,0,c4c4c4,101010,1,1,336699' type='text/javascript'%3E%3C/script%3E"));</script>Created by: <a href="http://twitterforweb.com" target="_blank">twitter website widget</a></div>
                        <!-- END: Twitter website widget (http://twitterforweb.com) -->
                    </td>
                    <td>
                        <div style="width: 530px; text-align:center; height: 100% auto; text-align:justify;">
                            <br>
                            <center><div class="fb-like-box" data-href="https://www.facebook.com/AlbertaGrandTournamentCircuit"  data-width="530" data-height="830" data-show-faces="false" data-header="false" data-stream="true" data-show-border="false"></div></center>
                            <!--Facebook script-->
                            <script>(function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=324891624285941";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>

                            <!--Facebook button-->
                            <center>
                                <div class="social-button" style="width: 530px;">
                                    <div class="fb-like" data-href="http://www.facebook.com/AlbertaGrandTournamentCircuit" data-send="true" data-width="530" data-show-faces="true"></div>
                                </div>
                            </center>
                            <br>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>