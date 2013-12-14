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
            <div class='title'>Test Page</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                <p>We store all of the historical army data for every tournament. This allows us to uniquely track current and past army trends and performance! Get a jump on the competition with the data here.</p>
                <p><b>Popularity</b>- The score column is the count of how many times this army has been played.</p>
                <p><b>Total Performance</b>- The score column on this view is the sum total of all points earned by this army to date.</p>
                <p><b>Average Performance</b>- The score column here is the total number of points earned by this army divided by the count of how many times it has been played.</p>
            </div>


            <table>       
                <tr>
                    <td>
                        <select name="tournamentSeason">
                            <option selected="selected"></option>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="season" items="${seasons}">
                                <option value="tournamentSeason = '${season.tournamentSeason}'">${season.tournamentSeason}</option>
                            </c:forEach>
                        </select>  
                    </td>
                </tr>  
            </table>
        </div>
    </body>
</html>
