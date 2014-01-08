<%-- 
    Document   : news
    Created on : 31-Dec-2013, 12:35:03 AM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AWGT</title>
        <jsp:include page="getString?stringId=eventInfo"/>
        <%@include file="/includes/header.jsp" %>
    </head>
    <body>
        <div id="container">
            <div class='title'>Breaking News</div>
            <div class="hr"><hr /></div>
            <div class="titleDescription">
                <div id="changeEventRoster">${text}</div>
            </div>
            <%if (request.isUserInRole("TO") || request.isUserInRole("admin")) {%>
            <script>var html = document.getElementById("changeEventRoster").innerHTML</script>
            <form style="text-align:center" id="adminInput" action="TO/updateString" method="post">
                <textarea style="width:800px; height:800px; overflow-y: hidden" id="changes" name="text" form="adminInput"></textarea>
                <script> document.getElementById("changes").innerHTML = html;</script>
                <br/>
                <input type="hidden" value="eventInfo" name="stringId">
                <input type="submit" value="Submit" >
            </form>
            <%}%>
        </div>
    </body>
</html>
