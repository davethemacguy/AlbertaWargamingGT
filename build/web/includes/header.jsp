<%-- 
    Document   : header
    Created on : 18-Apr-2012, 2:20:44 PM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Alberta Wargaming GT</title>

        <script src=<%request.getContextPath();%>"/AlbertaWargaming/includes/jquery-1.8.1.min.js"></script>
        <script>
            $(function() {
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
        <LINK href="/AlbertaWargaming/css/style.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>

    </head>   

    <body>
        <ul id="menu">
            <li><a href="/AlbertaWargaming/login/indexProtected.jsp">Home</a></li>
            <li>
                <a href="#">Players Pack/Scenarios</a>
                <ul>
                    <li><a href="https://dl.dropbox.com/s/e8ifjm2cv15oyr2/AWGTPlayersPackage.pdf" onclick="return !window.open(this.href,'Players Pack');">Players Pack</a></li>
                    <!--<li><a href="" onclick="return !window.open(this.href,'40K Scenarios');">>40K Scenarios</a></li>
                    <li><a href="" onclick="return !window.open(this.href,'Fantasy Scenarios');">>Fantasy Scenarios</a></li>-->
                </ul>
            </li>
            
            <li>
                <a href="#">Results</a>
                <ul>
                    <li><a href="/AlbertaWargaming/login/rankings">Current Standings</a></li>
                    <li><a href="/AlbertaWargaming/login/populateTournaments">Tournament Results</a></li>
                    <li><a href="/AlbertaWargaming/login/armyRankings.jsp">Army Rankings</a></li>
                </ul>
            </li>
            <li><a href="/AlbertaWargaming/login/about.jsp">About</a></li>
            <li><a href="/AlbertaWargaming/login/contact.jsp">Contact</a></li>
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
