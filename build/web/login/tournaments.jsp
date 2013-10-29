<%-- 
    Document   : tournaments
    Created on : 4-Jan-2013, 11:03:22 AM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/header.jsp" %>
        <style type="text/css">
            @-webkit-keyframes greenPulse {
                from { background-color: #749a02; -webkit-box-shadow: 0 0 18px #0015FF; }
            50% { background-color: #91bd09; -webkit-box-shadow: 0 0 100px #D4FCCF; }
            to { background-color: #749a02; -webkit-box-shadow: 0 0 18px #0015FF; }
            }
            div.hr {
                background: #FF0000  no-repeat scroll center;
                margin-left: 50px;
                width:40%;
                height:5px;
            }
            div.hr hr {
                display: none;
            }
            .title{
                font-size: 25px;
                margin-left:50px;
            }
            .titleDescription{
                margin-left:50px;
                margin-right: 50px;
                margin-bottom: 50px;
            }
            #container {
                width: 1130px; 
                top: 7%; 
                left: 50%;
                margin-left: -565px;
                position: absolute
            }
            #table {
                padding-top:20px;
                width:100%;
                border-spacing:0px;
                display: table;
            }
            #table tr{
                height: 200px;
            }
            #table tr:nth-child(even){
                height: 125px;
            }
            .logoBox { 
                background-color: #888;
                background-image: linear-gradient(#444, #888);
                box-shadow: 0 5px 5px #777;
                height: 200px;
                width: 450px;
                -webkit-border-radius: 10px 10px 10px 10px; 
                -moz-border-radius: 10px 10px 10px 10px;
                -o-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
                margin: auto;
            }
            .logoBox:hover {
                -webkit-animation-name: greenPulse;
                -webkit-animation-duration: 2s;
                -webkit-animation-iteration-count: infinite;
            }
            .thumb{
                float: left;
            }
            .logoBox img{
                max-width: 180px;
                max-height: 180px;
                padding-top: 10px;
                padding-left: 10px;
                box-shadow: 0 5px 5px #454545;
                display: block;
            }
            .logoBox p{
                padding-top: 50px;
                margin-left: 210px;
            }
            .logoBox p:first-line{
                font-size: 25px;
            }
            .tourneyTextDescription {
                width: 450px;
                height: 150px;
                margin-left:auto;
                margin-right:auto;
                padding-top: 10px;
                font-size: 12px;
            }
            #youtube{
                text-align: center;
            }


        </style> 
    </head>
    <body>
        <div id ="container">
            <div class='title'>AWGT Premiere Tournaments</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                The Alberta Wargaming Grand Tournament Circuit is comprised of 11 premiere tournaments all over Alberta. Over a 10 month period starting in October and ending in August. Players compete in each event for points in order to win invites for the final event of the year, the Alberta Wargaming Grand Tournament. Players can also gain points by finishing with any special award at tournaments including painting, sportsmanship or general. Finally players win automatic invites by winning best overall at any premiere event!</div>
            <div id ="youtube">
                <iframe  width="625" height="325" src="//www.youtube.com/embed/8Zol66xdkrI"></iframe>
            </div>
            <table id='table'>
                <tr>
                    <td>
                        <div class = 'logoBox'>
                            <div class="thumb"><img src="../images/OnslaughtLogo.png"/></div>
                            <p>
                                Onslaught (Fall)<br>
                                October 19th, 2013<br>
                                Edmonton
                            </p>                          
                        </div>
                    </td>
                    <td><div class = 'logoBox'>TOC</div></td>
                </tr>
                <tr>
                    <td><div class='tourneyTextDescription'>Onslaught is a one day miniature gaming tournament that features Fantasy and 40K. It started in 2006 and has gained a following that has grown over the years. Although the event is a competition by nature, it is put on to promote the community, hobby skills as well as our mutual enthusiasm for the hobby. It is being held at Aldergrove community hall</div></td>
                    <td></td>
                </tr>
                <tr>
                    <td><div class='logoBox'>Onslaught Spring</div></td>
                    <td><div class='logoBox'>TOP</div></td>
                </tr>
            </table>
        </div>
    </body>
</html>
