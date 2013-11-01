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
            <script type="text/javascript">var colNumFantasy = 1;</script>
            <script type="text/javascript">var colNumWarmaHordes = 1;</script>
            <center>
                <table>
                    <tr>
                        <td>
                            <h1>Army Rankings</h1>
                        </td>
                        <td>
                            <%@include file="/includes/logo.jsp" %>
                        </td>
                    </tr>
                </table>
            </center>

            <center>
                <form action="armyRankingData" method="post">
                    <select name="dataSelection">
                        <option value="Popularity">Popularity</option>
                        <option value="Average Performance">Average Performance</option>
                        <option value="Total Performance">Total Performance</option>
                    </select>

                    <input type="submit" value="Go!">
                </form>
                <br>
                <br>
                <table cellspacing ="10" style="text-align:center;">
                    <tr>
                        <td colspan ="3">
                            <h3>${dataSelectionType}</h3>
                        </td>
                    </tr>
                    <tr>
                        <td><h3><b>Warhammer 40,000</b></h3>
                        <td><h3><b>Warhammer Fantasy</b></h3>
                        <td><h3><b>Warmachine/Hordes</b></h3>
                    </tr>
                    <tr valign="top">
                        <td>
                            <table cellpadding="1" cellspacing="0" border=1 class="hovertable">
                                <tr>
                                    <th></th>
                                    <th>Army</th>
                                    <th>Score</th>
                                </tr>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="army40K" items="${armyData40K}">
                                    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                        <c:if test = "${army40K.armyName!='Unknown'}">
                                            <td><script type="text/javascript">document.write(colNum40K++);</script></td>
                                            <td>${army40K.armyName}</td>
                                            <td>${army40K.score}</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            <table cellpadding="1" cellspacing="0" border=1 class="hovertable">
                                <tr>
                                    <th></th>
                                    <th>Army</th>
                                    <th>Score</th>
                                </tr>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="armyFantasy" items="${armyDataFantasy}">
                                    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                        <c:if test = "${armyFantasy.armyName!='Unknown'}">
                                            <td><script type="text/javascript">document.write(colNumFantasy++);</script></td>
                                            <td>${armyFantasy.armyName}</td>
                                            <td>${armyFantasy.score}</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            <table cellpadding="1" cellspacing="0" border=1 class="hovertable">
                                <tr>
                                    <th></th>
                                    <th>Army</th>
                                    <th>Score</th>
                                </tr>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="armyWarmaHordes" items="${armyDataWarmaHordes}">
                                    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                                        <c:if test = "${armyWarmaHordes.armyName!='Unknown'}">
                                            <td><script type="text/javascript">document.write(colNumWarmaHordes++);</script></td>
                                            <td>${armyWarmaHordes.armyName}</td>
                                            <td>${armyWarmaHordes.score}</td>
                                        </c:if>
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
