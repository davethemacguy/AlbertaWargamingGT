<%-- 
    Document   : testUpload
    Created on : Dec 5, 2013, 11:57:57 AM
    Author     : localadmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src='js/jquery.min.js'></script>
        <script type='text/javascript'>

        $(document).ready(function()
            {
            $.ajax
            ({
            type: "GET",
            url: "PopulateAutocomplete",
            dataType:"json",
            success: function(data)
            {
            if(data.realFirstNames.length)
                {
                $.each(data.realFirstNames, function(i,data)
                {
            var firstName="<div id='firstName"+data.firstName+"'>"+data.firstName+"</div>";
                $(firstName).appendTo("#content");
                });
            }
            else
            {
            $("#content").html("No Results");
            }
            }
            });
        $('#UpdateButton').click(function() 
        {

        });
        return false;
        });
    });
</script> 
    </head>
    <body>        
        
        <form action="armyRankings" method="post">
                      
                       <%--     <select name="firstName">
                                <option selected="firstName"></option>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="name" items="${firstNames}">
                                    <option value="firstName = '${name.firstName}'">${name.firstName}</option>
                                </c:forEach>
                            </select>
                          
                                <select name="lastName">
                                <option selected="firstName"></option>
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <c:forEach var="name" items="${lastNames}">
                                    <option value="lastName = '${name.lastName}'">${name.lastName}</option>
                                </c:forEach>
                            </select>
                         

                            <input type="submit" value="Go!">
                        </form>   --%>
                                
                         <textarea id='firstName'></textarea><br/>
                         <input type='button' value=' Update ' id='UpdateButton'/>
                         <div id='content'></div>       
                                
                                
                                
                                
    </body>
</html>
