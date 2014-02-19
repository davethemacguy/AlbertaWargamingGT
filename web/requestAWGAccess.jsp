<%-- 
    Document   : requestProjectAccess
    Created on : 14-Apr-2012, 11:08:30 AM
    Author     : Stephen
--%>

<!DOCTYPE html>
<html>
    <head>

        <style type="text/css">
            table { margin: auto; }
        </style>

        <script language="JavaScript">
            function validate(form) {
                if (form.firstName.value === "") {
                    alert("Please fill in your first name");
                    form.firstName.focus();
                }
                else if (form.lastName.value === "") {
                    alert("Please fill in your last name");
                    form.lastName.focus();
                }
                else if (form.emailAddress.value === "") {
                    alert("Please fill in your email address");
                    form.emailAddress.focus();
                }
                else if (form.passWord.value === "") {
                    alert("Please fill in your password");
                    form.emailAddress.focus();
                }
                else if (form.passWord.value !== form.confirmPassWord.value) {
                    alert("Passwords do not match");
                    form.passWord.focus();
                }
                else {
                    form.submit();
                }
            }
        </script>

        <title>Alberta Wargaming GT</title>
        <link rel="icon" href="http://linds14sr20det.s20.eatj.com/AlbertaWargaming/images/webicon.ico"/>
        <LINK href="/AlbertaWargaming/css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div style="text-align: center"><%@include file="/includes/banner.jsp" %><b>Sign Up:</b></div>
        <br>
        <form action="addUser" method="post">
            <table cellspacing="8" border="0">
                <tr>
                    <td align="right">User Name</td>
                    <td><input type="text" placeholder="User Name" name="userName"></td>
                    <td rowspan="6">
                        <div style="width: 400px;height: 150px;overflow:-moz-scrollbars-vertical;overflow-y:auto;">
                            <p>By agreeing to these terms and conditions you indicate your approval for the
                                Alberta tournament circuit to use your name and an any relevant
                                tournament information for the circuit's website. You will be able to check
                                out your standings on the website and see how close you are to be invited
                                to the Grand Tournament in August!
                                <br>
                                <br>You are subject to being banned if you use the services rendered by this website in any malicious fashion.
                                <br>
                                <br>We will not publicly post any personal information other than the participant's name.

                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="right">First name:</td>
                    <td><input type="text" placeholder="First Name" name="firstName">
                    </td>
                </tr>
                <tr>
                    <td align="right">Last name:</td>
                    <td><input type="text" placeholder="Last Name" name="lastName">
                    </td>
                </tr>
                <tr>
                    <td align="right">Email Address</td>
                    <td><input type="text" placeholder="E-Mail Address" name="emailAddress">
                    </td>
                </tr>
                <tr>
                    <td align="right">Password</td>
                    <td><input type="password" placeholder="Password" name="passWord">
                    </td>
                </tr>
                <tr>
                    <td align="right">Confirm Password</td>
                    <td><input type="password" placeholder="Confirm Password" name="confirmPassWord">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="userRole" value="user">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="userDelete" value="n">
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="cardID" value="0"></td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="cardVerified" value="n"></td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="isPrivate" value="n"></td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="blackFlagged" value="n"></td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td><input type="hidden" name="flagReason" value=""></td>
                </tr>
                <tr>
                    <td colspan="3" align="center"><input type="button" value="I agree and Submit!" 
                                                          onClick="validate(this.form)"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
