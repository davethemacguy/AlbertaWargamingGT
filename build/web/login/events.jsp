<%-- 
    Document   : events
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
        </style>
    </head>
    <body>
        <div id="container">
            <div class='title'>Event Calendar</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Feel free to add this calendar to your own Google calendar. This is the public posting of all GT events and is always up to date.<br><br>
                You can always contact us at <a href="mailto:albertawargaminggt@gmail.com">albertawargaminggt@gmail.com</a>.
            </div>
            <div style="text-align:center; height: 100% auto;">
                <iframe src="https://www.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;height=600&amp;wkst=1&amp;bgcolor=%23336666&amp;src=awgtcircuit%40gmail.com&amp;color=%232952A3&amp;ctz=America%2FEdmonton" style=" border:solid 1px #777 " width="1030" height="600" frameborder="0" scrolling="no"></iframe>        
            </div>
        </div>
    </body>
</html>
