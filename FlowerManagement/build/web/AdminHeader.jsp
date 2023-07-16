<%-- 
    Document   : AdminHeader
    Created on : Mar 7, 2023, 9:59:05 AM
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
                        <h2><a href="AdminHome.jsp" style="color: brown; text-decoration: none">L-Plant</a></h2>
                    </div>
                    <ul>
                        <li><a href="MainController?action=manageAccounts">Manage Accounts</a></li>
                        <li><a href="MainController?action=ViewOrderOfAccounts">View All Orders</a></li>
                        <li><a href="MainController?action=ManagePlants">Manage Plants</a></li>
                        <li><a href="MainController?action=ManageCategories">Manage Categories</a></li>
                        <li><a href="MainController?action=LogOut">Log Out</a></li>
                    </ul>
                </div>
            </nav>
        </header>
    </body>
</html>
