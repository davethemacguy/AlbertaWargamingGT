<!DOCTYPE html>
<html>
    <head>
        <title>AWGT: Deleted Users</title>
        <%@include file="/includes/header.jsp" %>
        <style type="text/css">
            #tableParams {
                margin-left:50px;
                width:1030px;
                text-align:center;
            }
        </style>
    </head>

    <body>
        <div id="container">
            <div id="tableParams">
                <table>
                    <tr>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email Address</th>
                        <th></th>
                    </tr>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td><p>${user.userName}</td>
                            <td><p>${user.firstName}</td>
                            <td><p>${user.lastName}</td>
                            <td><p>${user.emailAddress}</td>
                            <td><a href="/AlbertaWargaming/login/admin/unDeleteUser?userID=${user.userID}">Undelete</a></td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                <br>
            </div>
        </div>
    </body>
</html>