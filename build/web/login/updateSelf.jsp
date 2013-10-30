<!DOCTYPE HTML>

<html>

    <head>
        <title>AWGT</title>
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
    <center>
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
    </center>

    <div id="mainBody" style="text-align: center">
        <form action="updateUser" method="post">
            <table cellspacing="5" border="0">
                <tr>
                    <td align="right">First name:</td>
                    <td><input type="text" name="firstName" 
                               value="${user.firstName}">
                    </td>
                </tr>
                <tr>
                    <td align="right">Last name:</td>
                    <td><input type="text" name="lastName" 
                               value="${user.lastName}">
                    </td>
                </tr>
                <tr>
                    <td align="right">Email address:</td>
                    <td><input type="text" name="emailAddress"
                               value="${user.emailAddress}">
                    </td>
                </tr>
                <tr>
                    <td align="right">New PassWord:</td>
                    <td><input type="password" name="passWord">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="userName"
                               value="${user.userName}">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="userRole"
                               value="${user.userRole}">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="userID"
                               value="${user.userID}">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
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