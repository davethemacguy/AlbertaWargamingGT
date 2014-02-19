<!DOCTYPE html>
<html>
    <head>
        <title>AWGT: Flagged Users</title>
        <%@include file="/includes/header.jsp" %>
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
        <%--
        <div id="container">
            <div class='title'>Flagged Users</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>
                These users have been flagged in previous Tournaments for the reason(s) listed.
            </div>                
                    <table class="hovertable" style="width:600px">                    
                    <tr></tr>
                    <tr></tr>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Reason Flagged</th>
                        <th></th>
                    </tr>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td><p>${user.firstName}</td>
                            <td><p>${user.lastName}</td>
                            <td><p>${user.flagReason}</td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                <br>
            </div>
        </div>
        --%>
        
        <div id="container">
            <div class='title'>Flagged Users</div>
            <div class="hr"><hr /></div>
            <div class='titleDescription'>The following users have been flagged at prior tournaments for the reason(s) listed.</div>
            <table id="tableParams">
                <tr>
                </tr>
                <tr id="spacer"><td></td></tr>
                <tr>
                    <td>
                        <table class="hovertable" style="width:600px">
                            <tr>
                                <th>Full Name</th>
                                <th>Reason Flagged</th>
                                <th>Number of Times Flagged</th>
                            </tr>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td><p>${user.fullName}</p></td>
                                    <td><p>${user.flagReason}</p></td>
                                    <td><p>${user.flagCount}</p></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>