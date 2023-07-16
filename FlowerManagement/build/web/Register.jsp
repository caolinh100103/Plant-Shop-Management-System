<%-- 
    Document   : Register
    Created on : Feb 7, 2023, 5:56:36 PM
    Author     : linh1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss/mycss.css">

    </head>
    <body>
        <div class="center">
            <h1>Register</h1>
            <form action="MainController" method="post">
                <div class="txt_field">
                    <label>Email</label>
                    <input type="text" name="email" required="" pattern="^[A-Za-z0-9+_.-]+@(.+)$"> 
                </div>
                <div class="txt_field">
                    <label>Password</label>
                    <input type="password" name="password" required=""> 
                </div>
                <div class="txt_field">
                    <label>Full Name</label>
                    <input type="text" name="fullname" required=""> 
                </div>
                <div class="txt_field">
                    <label>Phone</label>
                    <input type="text" name="phone" required="" pattern="[0][0-9]{9}"> 
                </div>
                <input type="hidden" name="action" value="registerUser" />
                <input type="submit" value="Register">
                <div style="padding-bottom: 20px"></div>
                <p style="text-align: center">${requestScope.ErrorMsg !=null ? requestScope.ErrorMsg : ""}</p>
            </form>
        </div>
    </body>
</html>
