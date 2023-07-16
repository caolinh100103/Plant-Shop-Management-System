<%-- 
    Document   : AdminHome
    Created on : Mar 7, 2023, 10:30:25 AM
    Author     : linh1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <link rel="stylesheet" href="mycss/adminHome.css">
    </head>
    <body>
        <%@include file="AdminHeader.jsp" %>
        <c:set var="user" value="${sessionScope.loginUser}"/>
        <h1 style="margin: 20px 0px; text-align: center">Hello ${user.fullName} back to admin page</h1>
        <c:set var="msg" value="${requestScope.updateSuccessfully}"/>
        <h3 style="margin-left: 30px">${msg}</h3> 
    </body>
</html>
