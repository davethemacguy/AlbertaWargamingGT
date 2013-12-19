<%-- 
    Document   : armyRankings
    Created on : 4-Jan-2013, 11:21:58 AM
    Author     : Stephen
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

        <div id="container">
            <div class='title'>Test Page</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                
            </div>


            <table>       
                <tr>
                    <td>
                        <p>${userName}</p>
                    </td>
                </tr>  
                <tr>
                    <td>
                        <p>${fullName}</p>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
