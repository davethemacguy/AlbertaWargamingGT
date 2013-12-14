<!DOCTYPE HTML>

<html>
    <head>
        <title>AWGT</title>
        <style type="text/css">
            table { margin: auto; }
        </style>
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
        <LINK href="/AlbertaWargaming/css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div style="text-align: center"><%@include file="/includes/banner.jsp" %><b>Login - Error:</b>
            <p>You did not log in successfully.</p>
            <p>Please check your username and password and try again.</p>
        </div>
        <form action=<%request.getContextPath();%>"/AlbertaWargaming/loginredir" method="post">
            <table cellspacing="5" border="0">
                <tr>
                    <td align="right">Username</td>
                    <td><input type="text" name="j_username"></td>
                    <td>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td align="right">Password</td>
                    <td><input type="password" name="j_password"></td>
                    <td colspan="2" style="text-align:center"><input type="submit" value="Login"></td>
                </tr>
            </table>
        </form>
        <form style="text-align: center" action="/AlbertaWargaming" method="get">
            <input type="submit" value="Return to Homepage">
        </form>
        <form style="text-align: center" action="/AlbertaWargaming/sendPassword.jsp">
            <input type="submit" value="Forgot Password?">
        </form>
    </body>
</html>
