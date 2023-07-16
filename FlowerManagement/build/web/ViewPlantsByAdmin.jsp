<%-- 
    Document   : ViewPlantsByAdmin
    Created on : Mar 8, 2023, 6:24:08 PM
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
        <header><%@include file="AdminHeader.jsp" %></header>
            <c:set var="listPlants" value="${requestScope.listPlants}"/>
        <form style="margin: 30px" method="post" action="MainController">
            <p>Do you want to create a new Plants?</p>
            <input type="submit" name="action" value="createPlant"/>
        </form>
        <c:if test="${listPlants != null && listPlants.size() > 0}" >

            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <th style="text-align: center">Name</th>
                    <th style="text-align: center">Price</th>
                    <th style="text-align: center">Image</th>
                    <th style="text-align: center">Category</th>
                    <th style="text-align: center">Action</th>
                    <th style="text-align: center">Action</th>
                </tr>
                <c:forEach var="plant" items="${listPlants}">
                    <tr>
                        <td style="text-align: center; justify-content: center">${plant.id}</td>
                        <td style="text-align: center; justify-content: center">${plant.PName}</td>
                        <td style="text-align: center; justify-content: center">${plant.check}$</td>
                        <td style="text-align: center; justify-content: center"><img src="${plant.imgPath}" style="width: auto; height: 500px"/></td>
                        <td style="text-align: center; justify-content: center">${plant.cateName}</td>
                        <td style="text-align: center; justify-content: center"><a href="MainController?action=viewPlant&id=${plant.id}">View Detail</a></td>
                        <td style="text-align: center; justify-content: center"><a href="MainController?action=updatePlant&id=${plant.id}">Update plant</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

    </body>
</html>
