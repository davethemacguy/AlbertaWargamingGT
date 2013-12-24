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
                
            </div>


            <table>       
                <tr>
                    <td>
                        <p>Username: ${userName}</p>
                    </td>
                </tr>  
                <tr>
                    <td>
                        <p>Full Name: ${fullName}</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Player Name Value: ${playerName}</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Results: ${results}</p>
                    </td>
                </tr>
            </table>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <table class="hovertable" style="width:600px">
                            <tr>
                                <th>Tournament Date</th>
                                <th>Tournament Name</th>
                                <th>System</th>
                                <th>Army</th>
                                <th>Points</th>
                            </tr>
                           
                            
                            <c:forEach var="player" items="${results}">
                                <tr onmouseover="this.style.backgroundColor='#BFBFBF';" onmouseout="this.style.backgroundColor='#A1A1A1';">
                                    <td><p>${player.tournamentDate}</p></td>
                                    <td><p>${player.tournamentName}</p></td>
                                    <td><p>${player.system}</p></td>
                                    <td><p>${player.army}</p></td>
                                    <td><p>${player.score}</p></td>
                                </tr>
                                
                            </c:forEach>
                                
                                
                        </table>
                        
                    <table class="hovertable" style="width:600px">
                            
                            <th>User Name</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>UserID</th>
                            <tr onmouseover="this.style.backgroundColor='#BFBFBF';" onmouseout="this.style.backgroundColor='#A1A1A1';">
                                <td><p>${user.userName}</td></p>
                                <td><p>${user.firstName}</td></p>
                                <td><p>${user.lastName}</td></p>
                                <td><p>${user.emailAddress}</td></p>
                                <td><p>${user.userID}</td></p>
                            </tr>
                        </table>
        </div>
    </body>
</html>
