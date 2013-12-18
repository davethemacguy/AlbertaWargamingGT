<%-- 
    Document   : header
    Created on : 18-Apr-2012, 2:20:44 PM
    Author     : Stephen
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>AWGT</title>
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
    </head>   

    <body>
        <ul id="menu">
            <li><img src=<%request.getContextPath();%>"/AlbertaWargaming/images/menuLogo.png"></li>
            <li><a href="/AlbertaWargaming/login/events.jsp">Event Calendar</a></li>
            <li><a href="/AlbertaWargaming/login/tournaments.jsp">Participating Tournaments</a></li>          
            <li>
                <a href="/AlbertaWargaming/login/rankings">Results</a>
                <ul>
                    <li><a href="/AlbertaWargaming/login/rankings">Season Standings</a></li>
                    <li><a href="/AlbertaWargaming/login/populateTournaments">Tournament Results</a></li>
                    <li><a href="/AlbertaWargaming/login/populateArmyRankings">Army Rankings</a></li>
                    <li><a href="/AlbertaWargaming/login/individualResults">Individual Results</a></li>
                    <li><a href="/AlbertaWargaming/login/populateTopPlayers">Top Players</a></li>
                </ul>
            </li>
            <li><a href="/AlbertaWargaming/login/indexProtected.jsp">Social Hub</a></li>             
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
                    <li><a href="/AlbertaWargaming/login/TO/uploadGTResults.jsp">Upload GT Results</a></li>
                    <%-- <li><a href="/AlbertaWargaming/login/TO/populateAutocomplete">Test Upload</a></li> --%>
                    <%}%>
                    <%if (request.isUserInRole("admin")) {%> 
                    <li><a href="/AlbertaWargaming/login/admin/displayUsers">Manage Users</a></li>
                   <%-- <li><a href="/AlbertaWargaming/login/populateTestPage">Test Page</a></li> --%>
                    <%}%>
                </ul>
            </li>
        </ul>
    </body>
</html>
