<%-- 
    Document   : myTournaments
    Created on : Feb 12, 2014, 1:56:52 PM
    Author     : localadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Tournaments</title>
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
        <%@include file="/includes/header.jsp" %>
    </head>
    <body>
    <div id="container">
            <div class='title'>My Tournaments</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Here you can manage your tournaments.
            </div>
            <form>    
        <table id="tableParams">
                
                <tr id="spacer"></tr>
                <tr>
                    <td>
                        <table class="hovertable" align="center" style="width:800px">
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <tr>
                                <th>Tournament Date</th>
                                <th>Tournament Name</th>
                            </tr>
                            <c:forEach var="item" items="${myTournaments}">
                                <tr>
                                    <td><p>${item.tournamentDate}</p></td>
                                    <td><p><a href="<c:url value="/login/TO/individualTournament">
                                              <c:param name="tournamentName" value="${item.tournamentName}"/>
                                              <c:param name="tournamentDate" value="${item.tournamentDate}"/>
                                              </c:url>"><c:out value="${item.tournamentName}"></c:out></a></p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
                <tr></tr>
                <tr>
                    <td><center><input type="submit" value="New Tournament"></center></td>
                </tr>
            </table>    
            </form>
    </body>
</html>
