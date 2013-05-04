<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Alberta Wargaming GT</title>
        <style type="text/css">
            table { margin: auto; }
            h1 { text-align: center; }
            * {
                font-size: 100%;
                font-family: Tahoma;
            }
        </style>
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
        <LINK href="/AlbertaWargaming/css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div style="text-align: center"><%@include file="/includes/banner.jsp" %><b>Login - Error:</b>
            <p>You did not log in successfully.</p>
            <p>Please check your username and password and try again.</p></div>

        <table cellspacing="5" border="0">
            <form action="j_security_check" method="get">
                <tr>
                    <td align="right">Username</td>
                    <td><input type="text" name="j_username"></td>
                </tr>
                <tr>
                    <td align="right">Password</td>
                    <td><input type="password" name="j_password"></td>
                    <td colspan="2" align="center"><input type="submit" value="Login"></td>
                </tr>
            </form>
        </table>
        <form style="text-align: center" action="/AlbertaWargaming" method="get">
            <input type="submit" value="Return to Homepage">
        </form>
    </body>
</html>
