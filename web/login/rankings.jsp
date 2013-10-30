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
            <script type="text/javascript">var colNumFantasy = 1;</script>
            <script type="text/javascript">var colNumWarmaHordes = 1;</script>
            <center>
                <table>
                    <tr>
                        <td>
                            <h1>Current Rankings</h1>
                        </td>
                        <td>
                            <%@include file="/includes/logo.jsp" %>
                        </td>
                    </tr>
                </table>
            </center>

            <center>
                <table>
                    <tr>
                        <td><h2><b>Warhammer 40,000</b></h2>
                        <td><h2><b>Warhammer Fantasy</b></h2>
                        <td><h2><b>Warmachine/Hordes</b></h2>
                    </tr>
                    <tr valign="top">
                        <td>
                            <table cellpadding="1" cellspacing="0" border=1 class="hovertable">
                                <tr>
                                    <th></th>
                                    <th>Player</th>
                                    <th>Score</th>
                                    <th>Auto-Invite</th>
                                </tr>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="player40K" items="${results40K}">
                                    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                        <td><script type="text/javascript">document.write(colNum40K++);</script></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${player40K.playerName=='Classified'}">
                                                    <i><strike>Excommunicate Traitoris</strike></i>
                                                </c:when>
                                                <c:otherwise>
                                                    ${player40K.playerName}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><p>${player40K.score}</td>
                                        <td><p>${player40K.invite}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            <table cellpadding="1" cellspacing="0" border=1 class="hovertable">
                                <tr>
                                    <th></th>
                                    <th>Player</th>
                                    <th>Score</th>
                                    <th>Auto-Invite</th>
                                </tr>

                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="playerFantasy" items="${resultsFantasy}">
                                    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                        <td><script type="text/javascript">document.write(colNumFantasy++);</script></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${playerFantasy.playerName=='Classified'}">
                                                    <i><strike>Excommunicate Traitoris</strike></i>
                                                </c:when>
                                                <c:otherwise>
                                                    ${playerFantasy.playerName}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><p>${playerFantasy.score}</td>
                                        <td><p>${playerFantasy.invite}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            <table cellpadding="1" cellspacing="0" border=1 class="hovertable">
                                <tr>
                                    <th></th>
                                    <th>Player</th>
                                    <th>Score</th>
                                    <th>Auto-Invite</th>
                                </tr>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="playerWarmaHordes" items="${resultsWarmaHordes}">
                                    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                        <td><script type="text/javascript">document.write(colNumWarmaHordes++);</script></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${playerWarmaHordes.playerName=='Classified'}">
                                                    <i><strike>Excommunicate Traitoris</strike></i>
                                                </c:when>
                                                <c:otherwise>
                                                    ${playerWarmaHordes.playerName}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><p>${playerWarmaHordes.score}</td>
                                        <td><p>${playerWarmaHordes.invite}</td>
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
