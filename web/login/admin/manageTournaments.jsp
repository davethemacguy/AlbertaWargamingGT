<%-- 
    Document   : manageTournaments
    Created on : Feb 13, 2014, 3:14:05 PM
    Author     : localadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <div class='title'>Manage Tournaments</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Manage all tournaments. Admins only.
            </div>
            
             <table class="hovertable" align="center" style="width:800px">
                <tr>
                    <th>Tournament Date</th>
                    <th>Tournament Name</th>
                </tr>
                        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="item" items="${allTournaments}">
                                <tr>
                                    <td>${item.tournamentDate}</td>
                                    <td><p><a href="<c:url value="/login/TO/individualTournament">
                                              <c:param name="tournamentName" value="${item.tournamentName}"/>
                                              <c:param name="tournamentDate" value="${item.tournamentDate}"/>
                                              </c:url>"><c:out value="${item.tournamentName}"></c:out>
                                            </a></p></td>
                                </tr>
                                </c:forEach>
             </table>
    </body>
</html>
