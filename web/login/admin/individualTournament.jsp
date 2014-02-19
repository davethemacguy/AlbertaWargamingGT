<%-- 
    Document   : individualTournament
    Created on : Feb 13, 2014, 4:24:09 PM
    Author     : localadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/header.jsp" %>
        <!-- CSS goes in the document HEAD or added to your external stylesheet -->
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
    </head>
    <body>
<div id="container">
            <div class='title'>Manage Tournament</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Manage an individual tournament.
            </div>
            
            <form action="/AlbertaWargaming/login/TO/UpdateTournament" method="post">
             <table class="hovertable" style="width:800px" align="center">
                <tr>
                    <th>Date</th>
                    <th>Name</th>
                    <th>System</th>
                    <th>Best General</th>
                    <th>Best Overall</th>
                    <th>Best Painted</th>
                    <th>Best Sport</th>
                    <th>Entry Fee</th>
                    <th>Max. Players</th>
                    <th>Min. Players</th>
                    <th>Actual Participants</th>
                </tr>
                <tr></tr>
                <tr></tr>
                
                       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="item" items="${tournamentInfo}">
                                <tr>
                                    <td><input type="text" name="tournamentDate" value="${item.tournamentDate}"></td>
                                    <td><input type="text" name="tournamentName" value="${item.tournamentName}"></td>
                                    <td><input type="text" name="system" value="${item.system}"></td>
                                    <td><input type="text" name="bestGeneral" value="${item.bestGeneral}"></td>
                                    <td><input type="text" name="bestOverall" value="${item.bestOverall}"></td>
                                    <td><input type="text" name="bestPainted" value="${item.bestPainted}"></td>
                                    <td><input type="text" name="bestSport" value="${item.bestSport}"></td>
                                    <td><input type="number" name="tournamentCost" value="${item.tournamentCost}"></td>
                                    <td><input type="number" name="maxPlayers" value="${item.maxPlayers}"></td>
                                    <td><input type="number" name="minPlayers" value="${item.minPlayers}"></td>
                                    <td><input type="number" name="playersPerTeam" value="${item.playersPerTeam}"></td>
                                    <td><input type="number" name="tournamentParticipants" value="${item.tournamentParticipants}"></td>
                                </tr>
                                </c:forEach>
                                </form>
                                </table>    
                            <center><input type="submit" value="Update"></center>
        
</body>
</html>
