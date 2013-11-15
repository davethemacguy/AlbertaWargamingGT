<!DOCTYPE html>
<html>
    <head>
        <title>AWGT: Add a User</title>
        <%@include file="/includes/header.jsp" %>
        <style type="text/css">
            #tableParams {
                margin-left:50px;
                width:1030px;
                text-align:center;
            }
        </style>
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
    </head>



    <body>
        <div id="container">
            <div id="tableParams">


                <form action=<%request.getContextPath();%>"/AlbertaWargaming/addUser" method="post">
                    <table>
                        <tr>
                            <td>User Name:</td>  
                            <td><input type="text" name="userName">
                            </td>
                        </tr>
                        <tr>
                            <td>First name:</td>
                            <td><input type="text" name="firstName">
                            </td>
                        </tr>
                        <tr>
                            <td>Last name:</td>
                            <td><input type="text" name="lastName">
                            </td>
                        </tr>
                        <tr>
                            <td>Email address:</td>
                            <td><input type="text" name="emailAddress">
                            </td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="passWord">
                            </td>
                        </tr>
                        <tr>
                            <td>User role:</td>
                            <td>
                                <select name="userRole">
                                    <option value="admin">Administrator</option>
                                    <option value="TO">Tournament Organizer</option>
                                    <option value="Player">Player</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="hidden" name="userDelete" value="n"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="button" value="Submit" 
                                       onClick="validate(this.form)"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>