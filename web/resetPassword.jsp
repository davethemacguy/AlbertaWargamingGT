<!DOCTYPE html>
<html>

    <head>
        <title>AWGT</title>
        <style type="text/css">
            table { 
                margin: auto; 
            }
        </style>
<script language="JavaScript">
            function validate(form) {
                if (form.newPass.value!==form.confirmNewPass.value) {
                    alert("Passwords do not match.");
                    form.newPass.focus();
                }else {
                    form.submit();
                }
            }
        </script>
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
        <LINK href="/AlbertaWargaming/css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div style="text-align: center"><%@include file="/includes/banner.jsp" %><b>Login:</b></div>
        <br>
        <p style="text-align: center">Please enter the new password for the account:</p>
        <form action="confirmResetPassword" method="post">
            <table cellspacing="5" border="0">
                <tr>
                    <td><input type="hidden" value="<%= session.getAttribute("username")%>" name="username"></td> 
                </tr>
                <tr>
                    <td><input type="text" placeholder="New Password" name="newPass"></td> 
                </tr>
                <tr>
                    <td><input type="text" placeholder="Confirm New Password" name="confirmNewPass"></td> 
                </tr>
                <tr>
                    <td align="center"><input type="button" value="Reset my password!" onClick="validate(this.form)"></td>
                </tr>
            </table>
        </form> 
        <form style="text-align: center" action="/AlbertaWargaming" method="get">
            <input type="submit" value="Return to Homepage">
        </form>
    </body>

</html>