<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head>
        <title>AWG: Manage Users</title>
    </head>
    <body>

        <h1>Users List</h1>
        <br>
        <%@include file="/includes/header.jsp" %>

        <table cellpadding="5" border=1>

            <tr valign="bottom">
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email Address</th>
                <th>User Role</th>
            </tr>

            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <c:forEach var="user" items="${users}">

                <tr valign="top">
                    <td><p>${user.userName}</td>
                    <td><p>${user.firstName}</td>
                    <td><p>${user.lastName}</td>
                    <td><p>${user.emailAddress}</td>
                    <td><p>${user.userRole}</td>
                    <td><a href="/AlbertaWargaming/login/admin/displayUser?userID=${user.userID}">Update</a></td>
                    <td><a href="/AlbertaWargaming/login/admin/deleteUser?userID=${user.userID}">Delete</a></td>
                </tr>
            </c:forEach>
            <tr valign="bottom">
                <td><a href="/AlbertaWargaming/login/admin/addUser.jsp">Add User</a></td>
            </tr>
            <tr valign="bottom">
                <td><a href="displayDeletedUsers">Undelete a User</a></td>
            </tr>
        </table>
        <br> 

    </body>
</html>