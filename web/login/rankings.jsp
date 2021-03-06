<%-- 
    Document   : rankings
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
        <%
            String userName = request.getRemoteUser();
            session.setAttribute("userName", userName);
        %>
    </head>

    <body>
        <div id="container">
            <div class='title'>Season Standings</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Here you can view the AWGT current season's standings, as well as all past AWGT season's final results.
            </div>
            <script type="text/javascript">var colNum40K = 1;</script>
            <script type="text/javascript">var colNumFantasy = 1;</script>
            <script type="text/javascript">var colNumWarmaHordes = 1;</script>
            <script type="text/javascript">var colNumInfinity = 1;</script>
            <script type="text/javascript">var colNumXwing = 1;</script>
            <table id="tableParams">
                <tr>
                    <td></td>
                    <td>
                        <form action="rankings" method="post">
                            <select name="fk_tournamentSeason">
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <option value="fk_tournamentSeason = '${currentSeason}'">${currentSeason}</option>
                                <c:forEach var="season" items="${seasons}">
                                    <c:if test="${season.tournamentSeason != currentSeason}">
                                        <option value="fk_tournamentSeason = '${season.tournamentSeason}'">${season.tournamentSeason}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <input type="submit" value="Go!">
                        </form>
                    </td>
                    <td></td>
                </tr>
                <tr id="spacer"><td colspan="3"></td></tr>
                <tr>
                    <th>Warhammer 40,000</th>
                    <th>Warhammer Fantasy</th>
                    <th>Warmachine/Hordes</th>
                </tr>
                <tr>
                    <td>
                        <table class="hovertable">
                            <tr>
                                <th></th>
                                <th>Player</th>
                                <th>Score</th>
                                <th>Auto-Invite</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="player40K" items="${results40K}">
                                <tr>
                                    <td><p><script type="text/javascript">document.write(colNum40K++);</script></p></td>
                                    <td><p>
                                            <c:choose>
                                                <c:when test="${player40K.playerName=='Classified'}">
                                                    <i>Excommunicate Traitoris</i>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="<c:url value="/login/individualResults">
                                                           <c:param name="playerName" value="playerName = '${player40K.playerName}'"/>
                                                       </c:url>"><c:out value="${player40K.playerName}"></c:out>
                                                       </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </p></td>
                                    <td><p>${player40K.score}</p></td>
                                    <td><p>${player40K.invite}</p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table class="hovertable">
                            <tr>
                                <th></th>
                                <th>Player</th>
                                <th>Score</th>
                                <th>Auto-Invite</th>
                            </tr>

                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="playerFantasy" items="${resultsFantasy}">
                                <tr>
                                    <td><p><script type="text/javascript">document.write(colNumFantasy++);</script></p></td>
                                    <td><p>
                                            <c:choose>
                                                <c:when test="${playerFantasy.playerName=='Classified'}">
                                                    <i>Excommunicate Traitoris</i>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="<c:url value="/login/individualResults">
                                                           <c:param name="playerName" value="playerName = '${playerFantasy.playerName}'"/>
                                                       </c:url>"><c:out value="${playerFantasy.playerName}"></c:out>
                                                       </a>                                                
                                                </c:otherwise>
                                            </c:choose>
                                        </p></td>
                                    <td><p>${playerFantasy.score}</p></td>
                                    <td><p>${playerFantasy.invite}</p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table class="hovertable">
                            <tr>
                                <th></th>
                                <th>Player</th>
                                <th>Score</th>
                                <th>Auto-Invite</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="playerWarmaHordes" items="${resultsWarmaHordes}">
                                <tr>
                                    <td><p><script type="text/javascript">document.write(colNumWarmaHordes++);</script></p></td>
                                    <td><p>
                                            <c:choose>
                                                <c:when test="${playerWarmaHordes.playerName=='Classified'}">
                                                    <i>Excommunicate Traitoris</i>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="<c:url value="/login/individualResults">
                                                           <c:param name="playerName" value="playerName = '${playerWarmaHordes.playerName}'"/>
                                                       </c:url>"><c:out value="${playerWarmaHordes.playerName}"></c:out>
                                                    </a>                                            </c:otherwise>
                                            </c:choose>
                                        </p></td>
                                    <td><p>${playerWarmaHordes.score}</p></td>
                                    <td><p>${playerWarmaHordes.invite}</p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th>Infinity</th>
                    <th>Xwing</th>
                </tr>
                <tr>
                    <td>
                        <table class="hovertable">
                            <tr>
                                <th></th>
                                <th>Player</th>
                                <th>Score</th>
                                <th>Auto-Invite</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="playerInfinity" items="${resultsInfinity}">
                                <tr>
                                    <td><p><script type="text/javascript">document.write(colNumInfinity++);</script></p></td>
                                    <td><p>
                                            <c:choose>
                                                <c:when test="${playerInfinity.playerName=='Classified'}">
                                                    <i>Excommunicate Traitoris</i>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="<c:url value="/login/individualResults">
                                                           <c:param name="playerName" value="playerName = '${playerInfinity.playerName}'"/>
                                                       </c:url>"><c:out value="${playerInfinity.playerName}"></c:out>
                                                       </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </p></td>
                                    <td><p>${playerInfinity.score}</p></td>
                                    <td><p>${playerInfinity.invite}</p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table class="hovertable">
                            <tr>
                                <th></th>
                                <th>Player</th>
                                <th>Score</th>
                                <th>Auto-Invite</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="playerXwing" items="${resultsXwing}">
                                <tr>
                                    <td><p><script type="text/javascript">document.write(colNumXwing++);</script></p></td>
                                    <td><p>
                                            <c:choose>
                                                <c:when test="${playerXwing.playerName=='Classified'}">
                                                    <i>Excommunicate Traitoris</i>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="<c:url value="/login/individualResults">
                                                           <c:param name="playerName" value="playerName = '${playerXwing.playerName}'"/>
                                                       </c:url>"><c:out value="${playerXwing.playerName}"></c:out>
                                                    </a>                                            </c:otherwise>
                                            </c:choose>
                                        </p></td>
                                    <td><p>${playerXwing.score}</p></td>
                                    <td><p>${playerXwing.invite}</p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
                            
            <br>
                            
                            
        </div>
    </body>
</html>
