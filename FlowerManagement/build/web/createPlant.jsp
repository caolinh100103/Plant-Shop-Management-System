<%-- 
    Document   : createPlant
    Created on : Mar 8, 2023, 7:32:32 PM
    Author     : linh1
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
        <%@include file="AdminHeader.jsp" %>
        <c:set var="listCate" value="${requestScope.listCategories}"/>
        <div class="container">
            <form action="MainController" method="post">
                <div style="margin-top: 20px" class="form-group row">
                    <label for="Name" class="col-sm-2 col-form-label">Plant Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="Name" name="plantName"/>
                    </div>
                </div>
                <div style="margin-top: 20px" class="form-group row">
                    <label for="price" class="col-sm-2 col-form-label" >Price</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="price" name="price" min="1"/>
                    </div>
                </div>
                <div style="margin-top: 20px" class="form-group row">
                    <label for="image" class="col-sm-2 col-form-label">Image Path</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="image" name="imgPath"/>
                    </div>
                </div>
                <div style="margin-top: 20px" class="form-group row">
                    <label for="description" class="col-sm-2 col-form-label">Description</label>
                    <div class="col-sm-10">
                        <textarea  class="form-control" id="description" name="description"></textarea>
                    </div>
                </div>
                <fieldset style="margin-top: 20px" class="form-group">
                    <div class="row">
                        <legend class="col-form-label col-sm-2 pt-0">Category</legend>
                        <div class="col-sm-10">
                            <c:forEach var="category" items="${listCate}">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="Category" id="gridRadios1" value="${category.cateID}" checked>
                                    <label class="form-check-label" for="gridRadios1">
                                        "${category.cateName}"
                                    </label>
                                </div>
                            </c:forEach>            
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary" value="createNewPlant" name="action">Create</button>
                    </div>
                </div>
            </form>
            <h3 style="text-align: center">${requestScope.MSG != null ? requestScope.MSG : ""}</h3>
        </div>
    </body>
</html>
