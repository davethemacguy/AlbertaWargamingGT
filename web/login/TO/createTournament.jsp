<%-- 
    Document   : createTournament
    Created on : Feb 12, 2014, 9:43:27 AM
    Author     : localadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Tournament</title>
          <style type="text/css">
            #tableParams {
                margin-left:50px;
                width:1030px;
                text-align:center;
            }
            #tableParams td{
                vertical-align: top;
            }
        </style>
        <%@include file="/includes/header.jsp" %>
        <script src=<%request.getContextPath();%>"/AlbertaWargaming/includes/jquery-1.8.1.min.js"></script>
       
    </head>
       
                                
    <body>
        <div id="container">
            <div class='title'>New Tournament</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Create a new tournament.
            </div>
            <form action="/AlbertaWargaming/login/TO/createTournament" method="post">
                <table class="hovertable" style="width:1000px" align="center">
                    <tr>
                        <th>Tournament Date</th>
                        <th>Tournament Name</th>
                        <th>System</th>
                        <th>Ticket Cost</th>
                        <th>Max. Players</th>
                        <th>Min. Players</th>
                        <th>Players Per Team</th>
                    </tr>
                    <tr>
                    <td><input type="text" name="tournamentDate"></td>
                    <td><input type="text" name="tournamentName"></td>
                    <td><input type="text" name="system"></td>
                    <td><input type="number" name="tournamentCost"></td>
                    <td><input type="number" name="maxPlayers"></td>
                    <td><input type="number" name="minPlayers"></td>
                    <td><input type="number" name="playersPerTeam"></td>
                    </tr>
                    <tr></tr>
                    <tr>
                        
                        <td><td><center><input type="submit" value="Create"></center></td>
                    </tr>
            </form>
   </body>
</html>
