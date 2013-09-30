<%-- 
    Document   : header
    Created on : 18-Apr-2012, 2:20:44 PM
    Author     : Stephen
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>Alberta Wargaming GT</title>
        <LINK href="/AlbertaWargaming/css/style.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src=<%request.getContextPath();%>"/AlbertaWargaming/includes/jquery-1.8.1.min.js"></script>
        <script>
            $(document).ready(function() {
                if ($.browser.msie && $.browser.version.substr(0,1)<7)
                {
                    $('li').has('ul').mouseover(function(){
                        $(this).children('ul').css('visibility','visible');
                    }).mouseout(function(){
                        $(this).children('ul').css('visibility','hidden');
                    })
                }
            });
        </script>
        
        <script type="text/javascript" src=<%request.getContextPath();%>"/AlbertaWargaming/includes/instafeed.min.js"></script>
        <script type="text/javascript">
            var feed = new Instafeed({
                /*get: 'user',
                userId: '581985169',
                accessToken: '581985169.467ede5.606f67a73cf0461b88541f13243a209b',*/
                get: 'tagged',
                tagName: 'awgt',
                clientId: '8546acafc51e435083ffd6b1eb17de55',
                sortBy: 'random',
                template: '<div style="padding-bottom: 20px; padding-left: 10px; padding-right: 10px; float: left"><a href="{{link}}"><img src="{{image}}" /></a></div>',
                limit: '60'
            });
            feed.run();
        </script>
    </head>   

    <body>
        <ul id="menu">
            <li><img src=<%request.getContextPath();%>"/AlbertaWargaming/images/menuLogo.png"></li>
            <li><a href="/AlbertaWargaming/login/indexProtected.jsp">Social Hub</a></li>           
            <li>
                <a href="/AlbertaWargaming/login/rankings">Current Standings</a>
                <ul>
                    <li><a href="/AlbertaWargaming/login/rankings">2013-2014 Standings</a></li>
                    <li><a href="/AlbertaWargaming/login/populateTournaments">Tournament Results</a></li>
                    <li><a href="/AlbertaWargaming/login/armyRankings.jsp">Army Rankings</a></li>
                    <li><a href="#">Past Circuit Seasons</a></li>
                </ul>
            </li>
            <li><a href="/AlbertaWargaming/login/events.jsp">Circuit Event Schedule</a></li>
            <li><a href="/AlbertaWargaming/login/tournaments.jsp">Tournaments</a></li>
            <li>
                <a href="#">Players Pack/Scenarios</a>
                <ul>
                    <li><a href="https://dl.dropbox.com/s/e8ifjm2cv15oyr2/AWGTPlayersPackage.pdf" onclick="return !window.open(this.href,'Players Pack');">2013 Players Pack</a></li>
                </ul>
            </li>
            <li id="finalBar">
                <a href="#">User Control Panel</a>
                <ul>
                    <li><a href="/AlbertaWargaming/logout">Logout</a></li>
                    <li><a href="/AlbertaWargaming/login/updateSelf">Update My Information</a></li>
                    <%if (request.isUserInRole("TO") || request.isUserInRole("admin")) {%> 
                    <li><a href="/AlbertaWargaming/login/TO/uploadTournamentResults.jsp">Upload Tournament Results</a></li>
                    <%}%>
                    <%if (request.isUserInRole("admin")) {%> 
                    <li><a href="/AlbertaWargaming/login/admin/displayUsers">Manage Users</a></li>
                    <%}%>
                </ul>
            </li>
        </ul>
    </body>
</html>
