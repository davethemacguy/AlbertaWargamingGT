<!DOCTYPE html>
<html>
    <head>
        <LINK href="/AlbertaWargaming/css/splashtheme.css" rel="stylesheet" type="text/css">
        <title>AWGT</title>
        <style type="text/css">
            #fpass{
                position:absolute;
                margin-left:168px;
                margin-top:90px;
                height: 24px;
                width: 140px;
                background-image: linear-gradient(silver, grey);
                text-align: center;
                vertical-align: middle;
                font-family: "Arial", Helvetica, sans-serif;
                font-size: 15px;
                line-height: 24px;   
                color: white;      
                border: grey;
                border-radius: 10px;
            }

            #fadethis{
                display: none;
            }

            input[type=submit] {
                height: 24px;
                width: 80px;
                background-image: linear-gradient(silver, grey);
                text-align: center;
                vertical-align: middle;
                font-family: "Arial", Helvetica, sans-serif;
                font-size: 15px;
                line-height: 24px;   
                color: white;      
                border: grey;
                border-radius: 10px;
            }
            
            #text_box{
                left:0px;
            }

        </style>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            $(document).ready(function() {
                $('div#fadethis').fadeIn('slow');
            });
        </script>    
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
    </head>

    <body>                    
        <div id="text_box">
            <div id="slidecontent">         
                <div id="rankings" class="glow">
                    <a href=<%request.getContextPath();%>"/AlbertaWargaming/login/indexProtected.jsp">
                        <img src="/AlbertaWargaming/images/dagger-512.png">
                    </a><br>
                    Rankings
                </div>
                <div id="fadethis">
                    <div id="requestAccess">
                        <form id="logon" action=<%request.getContextPath();%>"/AlbertaWargaming/loginredir" method="post" autocomplete="off">
                            <table cellspacing="5" border="0">
                                <tr>
                                    <td><input type="text" placeholder="Username" name="j_username"></td>
                                </tr>
                                <tr>
                                    <td><input type="password" placeholder="Password" name="j_password"></td>
                                    <td rowspan="2"><input type="submit" value="Log In" /></td>
                                </tr>
                            </table>
                        </form>
                    </div>  
                    <a href=<%request.getContextPath();%>"/AlbertaWargaming/sendPassword.jsp">
                        <div id="fpass">
                            Forgot Password
                        </div>
                    </a>
                </div>
            </div>
            <div id="logo" class="glow">
                <img src="/AlbertaWargaming/images/bannerLogo.png">
                <img src="/AlbertaWargaming/images/forward.png"><br>
            </div>
            <div id="back" class="glow">
                <a href=<%request.getContextPath();%>"/AlbertaWargaming/index.jsp?out=yes">
                    <img src="/AlbertaWargaming/images/back.png">
                </a>
            </div>
        </div>
    </body>
</html>
