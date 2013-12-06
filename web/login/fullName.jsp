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
                           
                       </tr>
                       <tr>
                           <%-- Working  --%>
                           <td><p>Logged in UserName</td>
                           <td></td>
                           <td><p>${user}</td> 
                       </tr>
                       <tr></tr>
                       <tr>
                           
                       </tr>
                       <tr>
                           <td><p>Logged in UserID</td>
                           <td></td>
                           <td><p>${userID}</td>
                       </tr>
                       <tr>
                           <td><p>Logged in FullName</td>
                           <td></td>
                           <td><p>${fullName}</td>
                       </tr>
                       <tr></tr>
                       <tr>
                           
                       </tr>
                       <tr>
                           <%-- Working 
                           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                           <td><p><c:out value="${currentUser.username}" /></td> --%>
                       </tr> 
                       <tr>
                           <td><form action="individualResults" method="post">
                           <td>
                           <select name="playerName">
                                <option selected="selected"></option>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="name" items="${activeUsers}">
                                    <option value="playerName = '${name.firstName}'+'${name.lastName}'">${name.firstName} ${name.lastName}</option>
                                </c:forEach>
                            </select>
                                <input type="submit" value="Go!">
                           </td>
                           </td>
                           </form>
                       </tr>
                       <tr>
                            <%-- Working 
                            <td><p>${user.userName}</td>
                            <td><p>${user.firstName}</td>
                            <td><p>${user.lastName}</td>
                            <td><p>${user.emailAddress}</td>
                            <td><p>${user.userRole}</td> --%>
                        </tr>
                        <tr></tr>
                        <tr></tr>                             
                        <tr></tr>
                        <tr>
                            <%--
                            <td><p>${results.tournamentName}</td>
                            <td><p>${results.tournamentDate}</td>
                            <td><p>${results.army}</td>
                            <td><p>${results.points}</td>  --%>
                        </tr>
                    
                </table>
            </div>
        </div>
    </body>
</html>
