<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>


<html>
    <head>
        <title>TEST PAGE</title>
        <%@include file="/includes/header.jsp" %>
        <script>
            function validate(form) {
                if (form.firstName.value=="") {
                    alert("Please fill in your first name");
                    form.firstName.focus();
                }
                else if (form.lastName.value=="") {
                    alert("Please fill in your last name");
                    form.lastName.focus();
                }
                else if (form.emailAddress.value=="") {
                    alert("Please fill in your email address");
                    form.lastName.focus();
                }
                else {
                    form.submit();
                }
            }
        </script>
        <style type="text/css">
            #tableParams {
                margin-left:50px;
                width:1030px;
                text-align:center;
            }
        </style>
    </head>


    <body>
        <table class="hovertable" style="width:600px">
                            <tr>
                                <th>Tournament Name</th>
                                <th>System</th>
                                <th>Season</th>
                                <th>Count</th>
                            </tr>
                            <tr>
                                <td>${tournament}</td>
                                <td>${system}</td>
                                <td>${season}</td>
                                <td>${count}</td>
                            </tr>
                                

                        </table>
    </body>
</html>