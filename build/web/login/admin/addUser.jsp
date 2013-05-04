<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>AWG: Add a User</title>
</head>

<script language="JavaScript">
function validate(form) {
    if (form.firstName.value=="") {
        alert("Please fill in your first name");
        form.firstName.focus();
    }
    else if (form.lastName.value=="") {
        alert("Please fill in your last name");
        form.lastName.focus();
    }
    else if (form.emailAddress.value=="") {
        alert("Please fill in your email address");
        form.lastName.focus();
    }
    else {
        form.submit();
    }
}
</script>

<body>

<h1>Create User</h1>
<br>
<%@include file="/includes/header.jsp" %>

<form action=<%request.getContextPath();%>"/AlbertaWargaming/addUser" method="post">
<table cellspacing="5" border="0">
    <tr>
        <td align="right">User Name:</td>  
        <td><input type="text" name="userName">
        </td>
    </tr>
    <tr>
        <td align="right">First name:</td>
        <td><input type="text" name="firstName">
        </td>
    </tr>
    <tr>
        <td align="right">Last name:</td>
        <td><input type="text" name="lastName">
        </td>
    </tr>
    <tr>
        <td align="right">Email address:</td>
        <td><input type="text" name="emailAddress">
        </td>
    </tr>
    <tr>
        <td align="right">Password:</td>
        <td><input type="password" name="passWord">
        </td>
    </tr>
    <tr>
        <td align ="right">User role:</td>
        <td>
            <select name="userRole">
                <option value="admin">Administrator</option>
                <option value="TO">Tournament Organizer</option>
                <option value="Player">Player</option>
            </select>
        </td>
    </tr>
    <tr>
        <td><input type="hidden" name="userDelete"
                   value="n">
        </td>
    </tr>
    <tr>
        <td></td>
        <td><input type="button" value="Submit" 
                   onClick="validate(this.form)"></td>
    </tr>
</table>
</form>
</body>
</html>