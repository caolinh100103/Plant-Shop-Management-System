<%-- 
    Document   : Login
    Created on : Feb 7, 2023, 5:25:33 PM
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
            <h1>Login</h1>
            <form action="MainController" method="post">
                <div class="txt_field">
                    <label>Email</label>
                    <input type="text" name="email" required="" pattern="^[A-Za-z0-9+_.-]+@(.+)$"> 
                </div>
                <div class="txt_field">
                    <label>Password</label>
                    <input type="password" name="password" required=""> 
                </div>
                <div class="pass">Forget Password?</div>
                <input type="hidden" name="action" value="loginUser" />
                <input type="submit" value="Login">
                <%= (request.getAttribute("ERROR") != null) ? request.getAttribute("ERROR") : ""%>
                <div class="signUp">
                    <a href="Register.jsp">Sign up</a>
                </div>
            </form>
        </div>
    </body>
</html>
