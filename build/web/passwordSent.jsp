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

        <% if (session.getAttribute("status") == "success") {%>
        <p style="text-align: center">The password has been mailed to: <%= session.getAttribute("email")%></p>
        <% } else {%>
        <p style="text-align: center">The username does not exist or has no email address associated with it.</p>
        <% }%>
        <br>
        <form style="text-align: center" action="/AlbertaWargaming" method="get">
            <input type="submit" value="Return to Homepage">
        </form>
    </body>

</html>