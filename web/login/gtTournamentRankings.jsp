<%-- 
    Document   : gtTournamentRankings
    Created on : 4-Jan-2013, 11:21:58 AM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AWGT</title>
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
            <div class='title'>GT Tournament Results</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Here you can view all past GT Tournament results!
            </div>
            <script type="text/javascript">var colNum40K = 1;</script>

            <table id="tableParams">
                <tr>
                    <td>
                        <form action="gtTournamentRankings" method="post">
                            <select name="tournamentSeason">
                                <option value="tournamentSeason = '${currentSeason}'" selected>${currentSeason}</option>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="season" items="${seasons}">
                                    <c:if test="${season.tournamentSeason != currentSeason}">
                                        <option value="tournamentSeason = '${season.tournamentSeason}'">${season.tournamentSeason}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <select name="system">
                                <option selected="selected"></option>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="system" items="${systems}">
                                    <option value="system = '${system.system}'">${system.system}</option>
                                </c:forEach>
                            </select>
                            <input type="submit" value="Go!">
                        </form>
                    </td>
                </tr>
                <tr id="spacer"><td></td></tr>
                <tr>
                    <td>
                        <h3>${tournamentInfo}</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Final Standings:</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="hovertable" style="width:600px">
                            <tr>
                                <th>Place</th>
                                <th>Player</th>
                                <th>Army</th>
                                <th>Awards</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="player" items="${gtTournamentResults}">
                                <tr>
                                    <td><p><script type="text/javascript">document.write(colNum40K++);</script></p></td>
                                    <c:choose>
                                        <c:when test="${player.optOut=='0'}">
                                            <td><p><i>Excommunicate Traitoris</i></p></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><p>${player.playerName}</p></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td><p>${player.army}</p></td>
                                    <td><p>${player.awards}</p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
