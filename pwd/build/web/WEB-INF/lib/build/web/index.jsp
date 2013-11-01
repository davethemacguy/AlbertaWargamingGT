<%@page import="data.UserDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <style type="text/css">
        h1 {
            overflow: hidden; 
            margin-left: auto;
            margin-right: auto;
            width: 1200px;
            height: 300px;
            line-height: 1%;
            font-size: 2cm;
        }

    </style>

    <head>
        <title>Alberta Wargaming GT</title>
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
        <LINK href="/AlbertaWargaming/css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body>

        <%
            if (session.isNew()) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>
        <script language="JavaScript">
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
                    form.emailAddress.focus();
                }
                else if (form.passWord.value=="") {
                    alert("Please fill in your password");
                    form.emailAddress.focus();
                }
                else {
                    form.submit();
                }
            }
        </script>

        <%if (data.UserDB.noUsers()) {%>

        <h1>Please initialize the Administrator account:</h1>

        <form action="addUser" method="post">
            <table cellspacing="5" border="0">
                <tr>
                    <td align="right">User Name</td>
                    <td><input type="text" name="userName">
                    </td>
                </tr>
                <tr>
                    <td align="right">First name:</td>
                    <td><input type="text" name="firstName">
                    </td>
                </tr>
                <tr>
                    <td align="right">Last name:</td>
                    <td><input type="text" name="lastName">
                    </td>
                </tr>
                <tr>
                    <td align="right">Email Address</td>
                    <td><input type="text" name="emailAddress">
                    </td>
                </tr>
                <tr>
                    <td align="right">Password</td>
                    <td><input type="password" name="passWord">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="userRole" value="admin">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="userDelete" value="n">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="Submit" 
                               onClick="validate(this.form)"></td>
                </tr>
            </table>
        </form>

        <%} else {
        %>
        <div id="mainBody">
            <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alberta Wargaming<img src="images/logo.jpg" width="245" height="257" alt="logo"/>
            </h1>
            <div style="text-align: center">
                <h3>Login</h3>
                <a href="/AlbertaWargaming/login/indexProtected.jsp">Access Alberta Wargaming Rankings</a>
                <h3>
                    Sign up for Alberta Wargaming Rankings!</h3>
                <a href="requestAWGAccess.jsp">Sign up!</a>
                <br>
                <br>
                <div style="width: 700px; margin-left: auto; margin-right: auto;">
                    The Alberta Wargaming GT is an invite only tournament pitting the top 20 Warhammer 40,000 and Warhammer Fantasy gamers in the province against each other. The GT is based on the results of of the Alberta Tournament circuit from October to July with the GT itself in August. Sign up and participate in local GT approved events to start earning points towards your invite today!
                </div>
            </div>
            <br>
            <%    }
            %>
        </div>
    </body>
    <%@include file="/includes/footer.jsp" %>
</html>