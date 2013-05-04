<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>AWG: Deleted Users</title>
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
  </tr>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:forEach var="user" items="${users}">

  <tr valign="top">
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
    
</body>
</html>