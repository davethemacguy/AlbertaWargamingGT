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
        <p style="text-align: center">Enter the e-mail address for the user account password you wish to reset</p>
        <form action="retrievePassword" method="post">
            <table cellspacing="5" border="0">
                <tr>
                    <td><input type="text" placeholder="E-mail Address" name="email"></td> 
                    <td align="center"><input type="submit" value="Send password reset email!"></td>
                </tr>
            </table>
        </form> 
        <form style="text-align: center" action="/AlbertaWargaming" method="get">
            <input type="submit" value="Return to Homepage">
        </form>
    </body>

</html>