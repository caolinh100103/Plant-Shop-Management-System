<%-- 
    Document   : header
    Created on : Feb 6, 2023, 5:01:14 PM
    Author     : linh1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss/styleHeader.css">
    </head>
    <body>
        <header>
            <nav>
                <div class="menu">
                    <div class="logo">
                        <h2 href="#"><a href="index.jsp" style="text-decoration: none; color: brown">L-Plant</a></h2>
                    </div>
                    <ul>
                        <li><a href="Register.jsp">Register</a></li>
                        <li><a href="Login.jsp">Login</a></li>
                        <li><a href="MainController?action=cartDetail">View Cart</a></li>
                    </ul>
                </div>
                <form action="MainController" method="post" class="formHeader">
                    <input type="text" name="txtsearch" placeholder="Enter plant name" class="text">
                    <select name="searchby" class="select">
                        <option value="byName">By Name</option>
                        <option value="byCategory">By Category</option>
                    </select>
                    <input type="submit" value="Search" class="submit" name="action">
                </form>
            </nav>
        </header>
    </body>
</html>
