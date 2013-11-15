<%-- 
    Document   : fullName
    Created on : Nov 14, 2013, 1:04:27 PM
    Author     : localadmin
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Full Name</title>
        <style type="text/css">
            #tableParams {
                margin-left:50px;
                width:1030px;
                text-align:center;
            }
        </style>
        <%@include file="/includes/header.jsp" %>
    </head>
    <body>
        <div id="container">
            <div id="tableParams">
                <table>
                    <tr valign="bottom">
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email Address</th>
                        <th>User Role</th>
                        <th></th>
                        <th></th>
                    </tr>
                       <tr></tr>
                       <tr></tr>
                       <tr>
                           <%-- Working --%>
                           <td><p>${userName}</td>
                       </tr>
                       <tr></tr>
                       <tr>
                           <%-- Working --%>
                           <td><p>${currentUser}</td>
                       </tr> 
                       <tr>
                            <%-- Working --%>
                            <td><p>${user.userName}</td>
                            <td><p>${user.firstName}</td>
                            <td><p>${user.lastName}</td>
                            <td><p>${user.emailAddress}</td>
                            <td><p>${user.userRole}</td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr>
                             <%-- Not Working --%>
                            <td><p>${playerName}</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td><p>${results.tournamentName}</td>
                            <td><p>${results.tournamentDate}</td>
                            <td><p>${results.army}</td>
                            <td><p>${results.points}</td>
                        </tr>
                    </c:forEach>
                    
                </table>
            </div>
        </div>
    </body>
</html>
