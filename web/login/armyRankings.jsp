<%-- 
    Document   : armyRankings
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
            <div class='title'>Army Rankings</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                <p>We store all of the historical army data for every tournament. This allows us to uniquely track current and past army trends and performance! Get a jump on the competition with the data here.</p>
                <p><b>Popularity</b>- The score column is the count of how many times this army has been played.</p>
                <p><b>Total Performance</b>- The score column on this view is the sum total of all points earned by this army to date.</p>
                <p><b>Average Performance</b>- The score column here is the total number of points earned by this army divided by the count of how many times it has been played.</p>
            </div>
            <script type="text/javascript">var colNum40K = 1;</script>
            <script type="text/javascript">var colNumFantasy = 1;</script>
            <script type="text/javascript">var colNumWarmaHordes = 1;</script>
            <table id="tableParams">
                <tr>
                    <td>
                    </td>
                    <td>
                        <form action="armyRankings" method="post">               
                            <select name="fk_tournamentSeason">
                                <option value="fk_tournamentSeason" selected>${currentSeason}</option>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="season" items="${seasons}">
                                    <c:if test="${season.tournamentSeason != currentSeason}">
                                        <option value="fk_tournamentSeason = '${season.tournamentSeason}'">${season.tournamentSeason}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <select name="dataSelection">
                                <option selected="selected"></option>
                                <option value="Popularity">Popularity</option>
                                <option value="Total Performance">Total Performance</option>
                                <option value="Average Performance">Average Performance</option>
                            </select>

                            <input type="submit" value="Go!">
                        </form>
                    </td>
                    <td></td>
                </tr>
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
                <tr>
                    <td>
                        <table class="hovertable">
                            <tr>
                                <th></th>
                                <th>Army</th>
                                <th>Score</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="army40K" items="${armyData40K}">
                                <tr>
                                    <c:if test = "${army40K.armyName!='Unknown'}">
                                        <td><p><script type="text/javascript">document.write(colNum40K++);</script></p></td>
                                        <td><p>${army40K.armyName}</p></td>
                                        <td><p>${army40K.score}</p></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table class="hovertable">
                            <tr>
                                <th></th>
                                <th>Army</th>
                                <th>Score</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="armyFantasy" items="${armyDataFantasy}">
                                <tr>
                                    <c:if test = "${armyFantasy.armyName!='Unknown'}">
                                        <td><p><script type="text/javascript">document.write(colNumFantasy++);</script></p></td>
                                        <td><p>${armyFantasy.armyName}</p></td>
                                        <td><p>${armyFantasy.score}</p></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table class="hovertable">
                            <tr>
                                <th></th>
                                <th>Army</th>
                                <th>Score</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="armyWarmaHordes" items="${armyDataWarmaHordes}">
                                <tr>
                                    <c:if test = "${armyWarmaHordes.armyName!='Unknown'}">
                                        <td><p><script type="text/javascript">document.write(colNumWarmaHordes++);</script></p></td>
                                        <td><p>${armyWarmaHordes.armyName}</p></td>
                                        <td><p>${armyWarmaHordes.score}</p></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
