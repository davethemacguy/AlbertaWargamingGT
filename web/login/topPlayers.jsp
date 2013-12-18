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
                vertical-align: top;
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
                    <td><form action="populateTopPlayers" method="post">
                            
                            <select name="tournamentSeason">
                                <option selected="tournamentSeason"></option>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="season" items="${seasons}">
                                    <option value="tournamentSeason = '${season.tournamentSeason}'">${season.tournamentSeason}</option>
                                </c:forEach>
                            </select>
                            
                            <input type="submit" value="Go!">
                        </form>
                    </td>
                </tr>
                <tr>
                    
                </tr>
               
               
                <tr>
                    <td>
                        <table class="hovertable" style="width:800px">
                            <tr>
                                <th>Tournament Date</th>
                                <th>Tournament Name</th>
                                <th>System</th>
                                <th>Best Overall</th>
                                <th>Best General</th>
                                <th>Best Presentation</th>
                                <th>Best Sport</th>
                            </tr>

                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                               <c:forEach var="item" items="${results}">
                                <tr onmouseover="this.style.backgroundColor='#BFBFBF';" onmouseout="this.style.backgroundColor='#A1A1A1';">
                                    <td><p>${item.tournamentDate}</p></td>
                                    <td><p>${item.tournamentName}</p></td>
                                    <td><p>${item.system}</p></td>
                                    <td><p>${item.bestOverall}</p></td>
                                    <td><p>${item.bestGeneral}</p></td>
                                    <td><p>${item.bestPainted}</p></td>
                                    <td><p>${item.bestSport}</p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
                
            </table>
        </div>
    </body>
</html>
