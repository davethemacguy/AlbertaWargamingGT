<%-- 
    Document   : individualResults
    Created on : Nov 12, 2013, 12:53:44 PM
    Author     : localadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AWGT</title>
        <%@include file="/includes/header.jsp" %>
        <!-- CSS goes in the document HEAD or added to your external stylesheet -->
        <style type="text/css">
            #tableParams {
                margin-left:50px;
                width:1030px;
                text-align:center;
            }
            #tableParams td{
                vertical-align: top;
            }
        </style>

        
    </head>
    <body>
        <script type="text/javascript">var col = 1;</script>
        <script type="text/javascript">var userName = {pageContext.reques.remoteUser}</script>
        <div id="container">
            <div class='title'>Tournament Results</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                Here you can view all past tournaments that you have participated in the GT circuit!
            </div>
            

            <table id="tableParams">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Player Results for ${pageContext.request.userPrincipal.name}</b>
                        <form action="individualResults" method="get">
                            <input type="submit" value="Show Results">
                        </form>
                        <b>${userName}</b>
                        <b>${fullName}</b>
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>${userName}</td>
                </tr>
               
                
                
                
                
                <tr>
                    <td>
                        <table class="hovertable" style="width:600px">
                            <tr>
                                <th>Tournament Date</th>
                                <th>Tournament Name</th>
                                <th>Army</th>
                                <th>Points</th>
                            </tr>
                            
                           <%-- <c:forEach var="player" items="${tournamentResults}">
                            <c:forEach var="tournament" items="${results}">
                                <tr onmouseover="this.style.backgroundColor='#BFBFBF';" onmouseout="this.style.backgroundColor='#A1A1A1';">
                                    <td><p><script type="text/javascript">document.write(col++);</script></p></td>
                                    <td><p>${tournament.tournamentDate}</p></td>
                                    <td><p>${tournament.tournamentName}</p></td>
                                    <td><p>${tournament.army}</p></td>
                                    <td><p>${tournament.score}</p></td>
                                </tr>
                            </c:forEach> --%>
                           
                        </table>
                    </td>
                </tr>
            </table>
            
     
      
        
    </body>
</html>
