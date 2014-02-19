<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>


<html>
    <head>
        <title>AWGT: Update user's information</title>
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
        <div id="container">
            <div id="tableParams">
                <form action="/AlbertaWargaming/login/admin/updateUser" method="post">
                    <table>
                        <tr>
                            <td>First name:</td>
                            <td><input type="text" name="firstName" 
                                       value="${user.firstName}">
                            </td>
                        </tr>
                        <tr>
                            <td>Last name:</td>
                            <td><input type="text" name="lastName" 
                                       value="${user.lastName}">
                            </td>
                        </tr>
                        <tr>
                            <td>Email address:</td>
                            <td><input type="text" name="emailAddress"
                                       value="${user.emailAddress}">
                            </td>
                        </tr>
                        <tr>
                            <td>New PassWord:</td>
                            <td><input type="password" name="passWord"
                                       value="${user.passWord}">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="hidden" name="userName"
                                       value="${user.userName}">
                            </td>
                        </tr>
                        <tr>
                            <td>User role:</td>
                            <td>
                                <select name="userRole">
                                    <option value="admin">Administrator</option>
                                    <option value="TO">Tournament Organizer</option>
                                    <option value="user" selected>Player</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Card ID:</td>
                            <td><input type="text" name="cardID" value="${user.cardID}">
                        </tr>
                        <tr>
                            <td>Card Verified:</td>
                            <td>
                                <select name="cardVerified">
                                    <option value="Yes">Yes</option>
                                    <option value="No" selected>No</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Is Private?</td>
                            <td>
                                <select name="isPrivate">
                                    <option value="Yes">Yes</option>
                                    <option value="No" selected>No</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Is Flagged?</td>
                            <td>
                                <select name="blackFlagged">
                                    <option value="Yes">Yes</option>
                                    <option value="No" selected>No</option>
                                </select>
                            </td>
                        
                        <tr>    
                            <td>Reason for Flagging:</td>
                            <td><input type="text" name="flagReason" value="${user.flagReason}">   
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="hidden" name="userID"
                                       value="${user.userID}">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
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