o<%-- 
    Document   : ViewDetailPlantByAdmin
    Created on : Mar 9, 2023, 11:05:42 AM
    Author     : linh1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <c:set var="plant" value="${requestScope.plant}"/>
        <c:import url="AdminHeader.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="margin-top: 25px">
                    <h1>${plant.PName}</h1>
                    <hr>
                </div>
            </div>
            <div class="row" style="border: 1px solid orange">
                <div class="col-md-6" style="margin: 20px 0px">
                    <img style="width: 100%; height: 400px" src="${plant.imgPath}"/>
                </div>
                <div class="col-md-6" style="margin: 20px 0px"> 
                    <p style="font-family: sans-serif; line-height: 30px">Category: ${plant.cateName}</p>
                    <p style="font-family: sans-serif; line-height: 30px">Description: ${plant.description}</p>
                    <p style="font-family: sans-serif; line-height: 30px">Price: ${plant.check}$</p>
                </div>
            </div>
        </div>
    </body>
</html>
