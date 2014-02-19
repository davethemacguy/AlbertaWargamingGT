<!DOCTYPE html>
<html>
    <head>
        <title>AWGT: Manage Users</title>
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
                        <th>Card ID</th>
                        <th>Card Verified?</th>
                        <th>Is Private?</th>
                        <th>Is Flagged?</th>
                        <th>User Role</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <c:forEach var="user" items="${users}">

                        <tr>
                            <td><p>${user.userName}</td>
                            <td><p>${user.firstName}</td>
                            <td><p>${user.lastName}</td>
                            <td><p>${user.emailAddress}</td>
                            <td><p>${user.cardID}</td>
                            <td><p>${user.cardVerified}</td>
                            <td><p>${user.isPrivate}</td>
                            <td><p>${user.blackFlagged}</td>
                            <td><p>${user.userRole}</td>
                            <td><a href="/AlbertaWargaming/login/admin/displayUser?userID=${user.userID}">Update</a></td>
                            <td><a href="/AlbertaWargaming/login/admin/deleteUser?userID=${user.userID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                        <tr></tr>
                        <tr></tr>
                </table>
                    <table width="100%">
                    <tr>
                        <td align="center"><a href="/AlbertaWargaming/login/admin/addUser.jsp">Add User</a></td>
                    </tr>
                    <tr>
                        <td align="center"><a href="displayDeletedUsers">Undelete a User</a></td>
                    </tr>
                    </table>
            </div>
        </div>
    </body>
</html>