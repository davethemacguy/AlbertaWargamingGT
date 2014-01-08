<!DOCTYPE html>
<html>
    <head>
        <title>AWGT</title>
        <style type="text/css">
            body {
                background: url('http://localhost:8080/AlbertaWargaming/images/machariusbackground.jpg');
            }

            table { 
                margin: auto; 
            }

            div.text_box {
                position: fixed;
                margin-top: -15px;
                margin-left: -10px;
                padding: 0px;
                width: 650px; 
                height: 150px; 
                background-color: black;
                background-image: linear-gradient(#888, #444);
                opacity:0.4;
                filter:alpha(opacity=40);
            } 
        </style>

        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
    </head>

    <body>
        <div class="text_box"> 

            <div style="position:fixed; margin-left:10px; margin-top:20px">
                <img src="/AlbertaWargaming/images/bannerLogo.png">
            </div>
            <div style="margin-left:10px; margin-top:20px">
                <font color="white">
                <p style="text-align: center">You are now logged out.</p>
                <form style="text-align: center" action="/AlbertaWargaming/login/indexProtected.jsp" method="post">
                    <input type="submit" value="Log in again">
                </form>
                </font>
            </div>
        </div>
    </body>
</html>