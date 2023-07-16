<%-- 
    Document   : UserHeader
    Created on : Feb 28, 2023, 11:47:40 PM
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
        <header style="display: block">
            <nav>
                <div class="menu">
                    <div class="logo">
                        <h2><a href="UserHome.jsp" style="text-decoration: none; color: brown">L-Plant</a></h2>
                    </div>
                    <ul>
                        <li><a href="MainController?action=cartDetail">View Cart</a></li>
                        <li><a href="MainController?action=ViewOrder">View Orders</a></li>
                        <li><a href="MainController?action=CanceledOrders">Canceled Orders</a></li>
                        <li><a href="MainController?action=ChangeProfile">Change profile</a></li>
                        <li><a href="MainController?action=LogOut">Log Out</a></li>
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
