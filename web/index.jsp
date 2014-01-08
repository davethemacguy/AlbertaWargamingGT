<!DOCTYPE html>
<html>
    <head>
        <LINK href="/AlbertaWargaming/css/splashtheme.css" rel="stylesheet" type="text/css">
        <title>AWGT</title>
        <style type="text/css">
            #infocontent {
                margin-top: 10px;
                background-image: linear-gradient(#888, #444);
                width: 400px; 
                height: 200px; 
                font-family: "Arial", Helvetica, sans-serif;
                color: white;       
                position: absolute;
                border-radius: 20px;
                display: none;
            }
            
            #text_box{
                left: -415px;
            }
        </style>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.8.21/jquery-ui.min.js"></script>
        <script>
            $(function() {
                $("#logo").click(function() {
                    $(this).parent().animate({left: '0px'}, {queue: false, duration: 500});
                }, function() {
                    $(this).parent().animate({left: '0px'}, {queue: false, duration: 500});
                });
            });

            $(function() {
                $("#back").click(function() {
                    $(this).parent().animate({left: '-415px'}, {queue: false, duration: 500});
                }, function() {
                    $(this).parent().animate({left: '-415px'}, {queue: false, duration: 500});
                    $("#infocontent").toggle(false);
                });
            });
            
            $('#slidecontent').draggable();

            $(function() {
                $("#info").click(function() {
                    $("#infocontent").toggle(200);
                });
            });

            $(document).ready(function() {
                var out = getParameterByName('out');
                if (out === "yes") {
                    $(function() {
                        $('#text_box').css({left: 0}).appendTo('body');
                    });
                }
            });

            function getParameterByName(name) {
                name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                        results = regex.exec(location.search);
                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }
        </script>

        <link rel="icon" href="/AlbertaWargaming/images/webicon.ico"/>
    </head>

    <body>
        
        <div id="text_box">
            <div id="slidecontent">         
                <div id="rankings" class="glow">
                    <a href="/AlbertaWargaming/login/indexProtected.jsp">
                        <img src="/AlbertaWargaming/images/dagger-512.png" alt="Rankings login icon">
                    </a><br>
                    Rankings
                </div>
                <div id="requestAccess" class="glow">
                    <a href="/AlbertaWargaming/requestAWGAccess.jsp">
                        <img src="/AlbertaWargaming/images/sword-512.png" alt="Signup icon">
                    </a><br>
                    Register
                </div> 
                <div id="info" class="glow">
                    <img src="/AlbertaWargaming/images/info-512.png" alt="Information icon"><br>
                    Information
                    <div id="infocontent">
                        <br>
                        <br>
                        The Alberta Wargaming GT is an annual Warhammer and 
                        Warhammer 40,000 tournament that pits the top players 
                        of Alberta against each other. Invitation to the GT is 
                        earned by playing in participating tournaments 
                        throughout the year. REGISTER for the site to view the 
                        current RANKINGS and sign up for upcoming qualifier 
                        events!
                    </div>
                </div>   
            </div>
            <div id="logo" class="glow">
                <img src="/AlbertaWargaming/images/bannerLogo.png" alt="AWGT icon">
                <img src="/AlbertaWargaming/images/forward.png" alt="Slide menubar right icon"><br>
            </div>
            <div id="back" class="glow">
                <img src="/AlbertaWargaming/images/back.png" alt="Slide menubar left icon">
            </div>
        </div>
    </body>
</html>