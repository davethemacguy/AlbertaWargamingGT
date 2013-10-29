<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title></title>
        <jsp:include page="getString?stringId=eventInfo"/>
        <%@include file="/includes/header.jsp" %>
        <style type="text/css">
            div.hr {
                background: #FF0000  no-repeat scroll center;
                margin-left: 50px;
                width:40%;
                height:5px;
            }
            div.hr hr {
                display: none;
            }
            .title{
                font-size: 25px;
                margin-left:50px;
            }
            #changeEventRoster{
                margin-left:50px;
                margin-right: 50px;
                margin-bottom: 25px;
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
            <div class='title'>Stay Connected</div>
            <div class="hr"><hr /></div>
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
            <table>
                <tr valign="top">
                    <td>
                <center><u>The next event is:</u><br></center>
                    <%@include file="/includes/countdown.jsp"%>

                <div id="instafeedStyling">
                    <img style="float:left" src=<%request.getContextPath();%>"/AlbertaWargaming/images/instagram-logo.png"/> 
                    <div style="color: lightgray; float: right; padding-top: 10px">#awgt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div style="float: right; padding-top: 10px">@albertawargaminggt&nbsp;</div>
                    <div style="height: 700px; float: left; overflow-y: scroll;" id="instafeed"></div>
                </div>
                <br>
                </td>
                <td>
                    <div style="width: 530px; text-align:center; height: 100% auto; text-align:justify;">
                        <br>
                        <center><div class="fb-like-box" data-href="https://www.facebook.com/AlbertaGrandTournamentCircuit"  data-width="530" data-height="730" data-show-faces="false" data-header="false" data-stream="true" data-show-border="false"></div></center>
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