<%-- 
    Document   : topPlayers
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
                vertical-align: middle;
            }
        </style>
    </head>

    <body>
        <div id="container">
            <div class='title'>Top Players</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Here you can view the top players from all past tournaments that have participated in the GT circuit!
            </div>
            <script type="text/javascript">var colNum40K = 1;</script>

            <table id="tableParams">
                <tr>
                    <td>
                        <p>Select Tournament Season</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action="topPlayers" method="post">
                            <select name="tournamentSeason">
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <option value="tournamentSeason = '${currentSeason}'" selected>${currentSeason}</option>

                                <c:forEach var="season" items="${seasons}">
                                    <c:if test="${season.tournamentSeason != currentSeason}">
                                        <option value="tournamentSeason = '${season.tournamentSeason}'">${season.tournamentSeason}</option>
                                    </c:if>
                                </c:forEach>
                            </select>

                            <select name="system">
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
                        <table class="hovertable" style="width:800px">
                            <tr>
                                <th>Tournament Date</th>
                                <th>Tournament Name</th>
                                <th>Best Overall</th>
                                <th>Best General</th>
                                <th>Best Presentation</th>
                                <th>Best Sport</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="item" items="${results}">
                                <tr>
                                    <td><p>${item.tournamentDate}</p></td>
                                    <%-- <td><p>${item.tournamentName}</p></td> --%>
                                    <td>
                                        <a href="<c:url value="/login/tournamentRankings">
                                               <c:param name="tournament" value="tournamentName ='${item.tournamentName}'"/>
                                               <c:param name="tournamentSeason" value="tournamentSeason ='${item.tournamentSeason}'"/>
                                               <c:param name="system" value="system ='${item.system}'"/>
                                           </c:url>"><c:out value="${item.tournamentName}"></c:out>
                                           </a>
                                        </td>
                                        <td><p><a href="<c:url value="/login/individualResults">
                                                  <c:param name="playerName" value="playerName = '${item.bestOverall}'"/>
                                              </c:url>"><c:out value="${item.bestOverall}"></c:out>
                                              </a></p>
                                        </td>
                                        <td><p><p><a href="<c:url value="/login/individualResults">
                                                     <c:param name="playerName" value="playerName = '${item.bestGeneral}'"/>
                                                 </c:url>"><c:out value="${item.bestGeneral}"></c:out>
                                                 </a></p>
                                        </td>
                                        <td><p><p><a href="<c:url value="/login/individualResults">
                                                     <c:param name="playerName" value="playerName = '${item.bestPainted}'"/>
                                                 </c:url>"><c:out value="${item.bestPainted}"></c:out>
                                                 </a></p>
                                        </td>
                                        <td><p><p><a href="<c:url value="/login/individualResults">
                                                     <c:param name="playerName" value="playerName = '${item.bestSport}'"/>
                                                 </c:url>"><c:out value="${item.bestSport}"></c:out>
                                                 </a></p>
                                        </td>
                                    </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
