<%-- 
    Document   : tournaments
    Created on : 4-Jan-2013, 11:03:22 AM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AWGT</title>
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
            .titleDescription{
                margin-left:50px;
                margin-right: 50px;
                margin-bottom: 50px;
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
                position: relative;
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
                cursor: pointer;
            }
            .thumb{
                float: left;
            }
            .logoBox img{
                max-width: 180px;
                max-height: 180px;
                min-height: 180px;
                min-width: 180px;
                padding-top: 10px;
                padding-left: 10px;
                box-shadow: 2px 2px 5px #454545;
                display: block;
            }
            .logoBox p{
                position:relative;
                padding-top: 50px;
                margin-left: 210px;
            }
            .logoBox p:first-line{
                font-size: 25px;
            }
            .tourneyTextDescription {
                width: 450px;
                height: 110px;
                margin-left:auto;
                margin-right:auto;
                padding-top: 10px;
                font-size: 12px;
            }
            #youtube{
                text-align: center;
            }
        </style> 

        <script>
            var eventName = '';
            var eventDate = '';
            var events = new Array();
            var gclaData = 'https://www.google.com/calendar/feeds/awgtcircuit%40gmail.com/public/full?orderby=starttime&sortorder=ascending&max-results=30&alt=json';
            $.getJSON(gclaData, callbackFunction);
            function callbackFunction(data)
            {
                var table = document.getElementById('table');
                var boxRow;
                var descriptionRow;
                for (var i = 0; i < data.feed.entry.length; i++) {
                    if (i % 2 == 0) {
                        boxRow = table.insertRow(-1);
                        descriptionRow = table.insertRow(-1);
                    }
                    var eventName = data.feed.entry[i].title.$t;
                    var date = new Date(data.feed.entry[i].gd$when[0].startTime);
                    var place = data.feed.entry[i].gd$where[0].valueString;
                    var description = data.feed.entry[i].content.$t.split("\n");
                    //Splice returns the element removes and then leaves the remainder of the description
                    var img = description.splice(0, 1);
                    img = img.toString().trim();
                    var url = description.splice(0, 1);
                    url = url.toString().trim();
                    var cellTop = boxRow.insertCell(i % 2);
                    var cellBottom = descriptionRow.insertCell(i % 2);
                    cellTop.innerHTML = "<div class = 'logoBox'><a href='" + url + "' style='z-index:2;display:block;position:absolute;width:100%;height:100%;' target='_blank'></a><div class='thumb'><img src='" + img + "'/></div><p>" + eventName + "<br>" + date.toLocaleDateString() + "<br>" + place + "</p></div>";
                    cellBottom.innerHTML = "<div class='tourneyTextDescription'>" + description.toString() + "</div>";
                }
            }
        </script>

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
            </table>
        </div>
    </body>
</html>
