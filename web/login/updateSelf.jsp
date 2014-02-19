<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>AWGT</title>
        <script>
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
                else if (form.passWord.value=="") {
                    alert("Please fill in your password");
                    form.passWord.focus();
                }
                else {
                    form.submit();
                }
            }
        </script>

        <style type="text/css">
            table { margin: auto; }
            * {
                text-align: center;
                font-size: 100%;
                font-family: Tahoma;
            }
        </style>
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
        <%@include file="/includes/header.jsp" %>
    </head>

    <body>
        <div id ="container">
            <table>
                <tr>
                    <td>
                        <h1>Update Your Information:</h1>
                    </td>
                    <td>
                        <%@include file="/includes/logo.jsp" %>
                    </td>
                </tr>
            </table>

            <form action="/login/admin/updateUser" method="post">
                <table>
                    <tr>
                        <td>Full Name:</td>
                        <td>${fullName}</td>
                    </tr>
                    <tr>
                        <td>First name:</td>
                        <td><input type="text" name="firstName" 
                                   value="${user.firstName}">
                        </td>
                    </tr>
                    <tr>
                        <td>Last name:</td>
                        <td><input type="text" name="lastName" 
                                   value="${user.lastName}">
                        </td>
                    </tr>
                    <tr>
                        <td>User Name:</td>
                        <td><input type=""text" name="userName"
                                   value="${userName}">
                        </td>
                    <tr>
                        <td>Email address:</td>
                        <td><input type="text" name="emailAddress"
                                   value="${user.emailAddress}">
                        </td>
                    </tr>
                    <tr>
                        <td>New PassWord:</td>
                        <td><input type="password" name="passWord">
                        </td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input type="hidden" name="userRole"
                                   value="${user.userRole}">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="hidden" name="userID"
                                   value="${user.userID}">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="hidden" name="userDelete" value="n">
                        </td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input type="button" value="Submit" 
                                   onClick="validate(this.form)"></td>
                    </tr>
                </table>    
            </form>
                        
                    
        </div>
    </body>
</html>