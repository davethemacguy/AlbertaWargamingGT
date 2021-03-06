<%-- 
    Document   : individualResults
    Created on : Nov 12, 2013, 12:53:44 PM
    Author     : localadmin
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
        <script type="text/javascript">var col = 1;</script>
        <script type="text/javascript">var userName = ${pageContext.request.remoteUser}</script>
        <div id="container">
            <div class='title'>Tournament Results</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Here you can view all past tournaments that you have participated in the GT circuit!
            </div>
            <table id="tableParams">
                <tr>
                    <td>
                        <form action="individualResults" method="post">
                            <select name="playerName">
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <option value="playerName = '${selectedUser}'" selected>${selectedUser}</option>
                                <c:forEach var="name" items="${activeUsers}">
                                    <c:if test="${name.fullName != selectedUser}">
                                        <option value="playerName = '${name.fullName}'">${name.fullName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <input type="submit" value="Go!">
                        </form>
                    </td>
                </tr>
                <tr id="spacer"><td></td></tr>
                <tr>
                    <td>
                        <table class="hovertable" style="width:600px">
                            <tr>
                                <th>Tournament Date</th>
                                <th>Tournament Name</th>
                                <th>System</th>
                                <th>Army</th>
                                <th>Points</th>
                            </tr>
                            <c:forEach var="player" items="${userResults}">
                                <tr>
                                    <td><p>${player.tournamentDate}</p></td>
                                    <td><p>${player.tournamentName}</p></td>
                                    <td><p>${player.system}</p></td>
                                    <td><p>${player.army}</p></td>
                                    <td><p>${player.score}</p></td>
                                </tr>
                                
                            </c:forEach>

                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
