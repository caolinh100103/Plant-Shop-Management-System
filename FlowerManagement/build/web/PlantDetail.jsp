<%-- 
    Document   : PlantDetail
    Created on : Feb 17, 2023, 2:21:36 PM
    Author     : linh1
--%>

<%@page import="basicobjects.Plant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss/stylePlantDetail.css">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>

    <body>

        <c:set var="user" value="${sessionScope.loginUser}"/>
        <c:if test="${user != null}">
            <c:import url="UserHeader.jsp"/>
        </c:if>
        <c:if test="${user == null}">
            <c:import url="header.jsp"/>
        </c:if>

        <c:set var="plant" value="${requestScope.plantdetail}"/>
        <c:if test="${plant != null}" >
            <div class="Pname">
                <h2>${plant.PName}</h2>
                <hr>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 imgage">
                        <img style="width: 100%; height: 400px;" src="${plant.imgPath}"/>
                    </div>
                    <div class="col-md-6">
                        <p>Category: ${plant.cateName}</p>
                        <p>Description: ${plant.description}</p>
                        <p>Price: ${plant.check}$</p>
                    </div>
                </div>
            </div>
            <div style="text-align: center; margin: 30px">
                <c:if test="${plant.status == 1}">
                    <a style="text-decoration: none; font-size: 25px" href="MainController?action=addtocart&id=${plant.id}">ADD TO CART</a>
                </c:if>
            </div>      
        </c:if>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>
