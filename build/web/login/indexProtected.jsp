<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
    <head>        
        <%@include file="/includes/header.jsp" %>
        <style type="text/css">
            h1{
                font: Klavika;
                text-align: center;
                font-size: 200%;
            }
        </style> 
        <jsp:include page="getString?stringId=eventInfo"/>
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
            <center>
                <table>
                    <tr>
                        <td>
                            <h1>Alberta Wargaming</h1>
                        </td>
                        <td>
                            <%@include file="/includes/logo.jsp" %>
                        </td>
                        <td>
                            <h1>Home</h1>
                        </td>
                    </tr>
                </table>
            </center>
            <br>
            <br>
            <table>
                <tr valign="top">
                    <td>
                        <div style="width: 530px; text-align:center; height: 100% auto;">
                            <div id="changeEventRoster">${text}</div>
                            <%if (request.isUserInRole("TO") || request.isUserInRole("admin")) {%>
                            <script>var html = document.getElementById("changeEventRoster").innerHTML </script>
                            <form id="adminInput" action="TO/updateString" method="post">
                                <textarea style="width:500px; height:400px" id="changes" name="text" form="adminInput"></textarea>
                                <script> document.getElementById("changes").innerHTML = html; </script>
                                <br />
                                <input type="hidden" value="eventInfo" name="stringId">
                                <input type="submit" value="Submit" >
                            </form>
                            <%}%>
                            
                            <p>
                                The top 20 players from the Warhammer 40,000 and Warhammer Fantasy standings will be invited to the GT in August. <br><br>
                                Warmachine/Hordes player standings are here for informational purposes only. Warmachine/Hordes will not be included
                                in the 2012-2013 invitational circuit. We are however hoping to include Warmachine/Hordes for the 2013-2014 season.<br>
                            </p>
                            <p>
                                If you have any questions or concerns please contact us at:
                                <a href="http://www.facebook.com/AlbertaGrandTournamentCircuit" target="_blank">Alberta Warhammer GT Facebook Page</a>
                            </p>
                        </div>
                    </td>
                    <td>
                        <div style="width: 530px; text-align:center; height: 100% auto; text-align:justify;">

                            <center>Click on the results tab to view the current standings!</center>
                            <br>
                            <center><img src="../images/AlbertaGTPoster.jpg" width="510" height="600" alt="logo"/></center>
                            <center><div class="fb-like" data-href="http://www.facebook.com/AlbertaGrandTournamentCircuit" data-send="true" data-width="450" data-show-faces="true" data-font="arial"></div></center>
                            <br>
                            <br>
                            The inaugural Alberta Wargaming GT will be held in August 2013, in Calgary, Alberta. The GT is an invitational event open to the top 20 finishers as ranked in the 2012-2013 Warhammer and Warhammer 40,000 tournament circuit.
                            Players earn points towards their GT standings by competing in sanctioned Tournaments in Alberta. Each event gives away points proportional to the number of players in the event.
                            The first place player earns points equal to the number of players in the event, with each successive player earning one point less.
                            The Best Overall player will gain +10 points, while the Best Painted, Best Sport and Best General will earn +5 points.<br><br>
                            <center>Click on the ABOUT tab for more information!</center>
                            <br>
                            <br>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>