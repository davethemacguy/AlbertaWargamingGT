<%-- 
    Document   : tournamentRankings
    Created on : 4-Jan-2013, 11:21:58 AM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/header.jsp" %>
        <!-- CSS goes in the document HEAD or added to your external stylesheet -->
        <style type="text/css">
            table.hovertable {
                font-family: verdana,arial,sans-serif;
                font-size:11px;
                color:#333333;
                border-width: 1px;
                border-color: #999999;
                border-collapse: collapse;
            }
            table.hovertable th {
                background-color:#c3dde0;
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                border-color: #a9c6c9;
            }
            table.hovertable tr {
                background-color:#d4e3e5;
            }
            table.hovertable td {
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                border-color: #a9c6c9;
            }
        </style>

        
            
    </head>

    <body>
        <div id="mainBody" style="text-align: center">

            <script type="text/javascript">var colNum40K = 1;</script>
            <center>
                <table>
                    <tr>
                        <td>
                            <h1>Tournament Results</h1>
                        </td>
                        <td>
                            <%@include file="/includes/logo.jsp" %>
                        </td>
                    </tr>
                   
                </table>
            </center>

            <center>
                <form action="tournamentRankings" method="post">
                    
                    <select name="tournamentSeason">
                        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <c:forEach var="season" items="${seasons}">
                            <option value="tournamentSeason = '${season.tournamentSeason}'">${season.tournamentSeason}</option>
                        </c:forEach>
                    </select>
                    
                    <select name="tournament">
                        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <c:forEach var="tournament" items="${tournaments}">
                            <option value= "tournamentName = '${tournament.tournamentName}' AND tournamentDate = '${tournament.tournamentDate}' AND system = '${tournament.system}'">${tournament.tournamentName} ${tournament.system} ${tournament.tournamentDate}</option>
                        </c:forEach>
                    </select>

                    <input type="submit" value="Go!">
                </form>
                <br>
                <br>
                <table style="text-align:center;">
                    <tr>
                        <td>
                            <h3>${currentSeason}</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Final Standings:</b>
                        </td>
                    </tr>
                    <tr valign="top" >
                        <td>
                            <table cellpadding="1" cellspacing="0" border=1 class="hovertable">
                                <tr>
                                    <th>Place</th>
                                    <th>Player</th>
                                    <th>Army</th>
                                    <th>Awards</th>
                                </tr>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="player" items="${tournamentResults}">
                                    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                        <td><script type="text/javascript">document.write(colNum40K++);</script></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${player.optOut=='0'}">
                                                    <i><strike>Excommunicate Traitoris</strike></i>
                                                </c:when>
                                                <c:otherwise>
                                                    ${player.playerName}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><p>${player.army}</td>
                                        <td><p>${player.awards}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </body>
</html>
