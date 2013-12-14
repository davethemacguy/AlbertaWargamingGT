<%-- 
    Document   : convertPasswords
    Created on : 12-Dec-2013, 2:46:53 PM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WARNING</title>
    </head>
    <body>
        This will convert all user passwords to hash. To only be used once.
        <form action=<%request.getContextPath();%>"/AlbertaWargaming/login/admin/convertpasswords" method="post">
            <input type="submit" value="!CONVERT!">
        </form> 

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
                    </tr>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <c:forEach var="user" items="${Users}">

                        <tr>
                            <td><p>${user.userName}</td>
                            <td><p>${user.firstName}</td>
                            <td><p>${user.lastName}</td>
                            <td><p>${user.emailAddress}</td>
                            <td><p>${user.userRole}</td>
                            <td><p>${user.passWord}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>               
    </body>
</html>
