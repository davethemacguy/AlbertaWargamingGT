<!DOCTYPE html>
<html>

    <head>
        <title>AWGT</title>
        <style type="text/css">
            table { 
                margin: auto; 
            }
        </style>

        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
        <LINK href="/AlbertaWargaming/css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div style="text-align: center"><%@include file="/includes/banner.jsp" %><b>Login:</b></div>
        <br>
        <p style="text-align: center">Please enter your username and password to continue.</p>
            <form action="j_security_check" method="post">
                <table cellspacing="5" border="0">
                    <tr>
                        <td><input type="text" placeholder="Username" name="j_username"></td>
                        <td><input type="password" placeholder="Password" name="j_password"></td>
                        <td align="center"><input type="submit" value="Login"></td>
                    </tr>
                </table>
            </form> 
            <form style="text-align: center" action="/AlbertaWargaming/sendPassword.jsp">
               <input type="submit" value="Forgot Password?">
            </form>
        <form style="text-align: center" action="/AlbertaWargaming" method="get">
            <input type="submit" value="Return to Homepage">
        </form>
    </body>

</html>