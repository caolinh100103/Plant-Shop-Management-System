<%-- 
    Document   : UpdatePlant
    Created on : Mar 9, 2023, 1:16:21 PM
    Author     : linh1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
        <c:set var="p" value="${requestScope.plant}"/>
        <c:set var="cate" value="${requestScope.categories}"/>
        <c:import url="AdminHeader.jsp"/>

        <div class="container">
            <h1>Change Information of Plant</h1>
            <hr>
            <section class="container my-3 bg-light w-50 text-light p-3">                
                <form class="row g-3 p-3" method="post" action="MainController">
                    <div class="col-md-12">
                        <p style="color: black"> Old Name : ${p.PName}</p>
                        <p style="color: black">Change Name: <input class="form-control" type="text" name="newName"/></p>
                    </div>
                    <div class="col-md-12">
                        <p style="color: black"> Old price : ${p.check}$</p>
                        <p style="color: black">Change Price: <input class="form-control" type="text" name="newPrice"/></p>
                    </div>
                    <div class="col-md-12">
                        <p style="color: black">Old Image Path: ${p.imgPath}</p>
                        <p style="color: black">Change Image Path: <input class="form-control" type="text" name="newImgPath"/></p>
                    </div>
                    <div class="col-md-12">
                        <p style="color: black">The Old Description: ${p.description}</p>
                        <label style="color: black" for="newDescription">Change Description: </label>
                        <textarea id="w3review" name="newDescription" rows="6" cols="70" ></textarea>
                    </div>
                    <div class="col-md-12">
                        <p style="color: black">Old Status: ${p.status}</p>
                        <p style="color: black">Change Status: <input class="form-control" type="number" min="0" max="1" name="newStatus"/></p>
                    </div>
                    <fieldset style="margin-top: 20px; color: black" class="form-group">
                        Old Category : ${p.cateName}
                        <div class="row">
                            <legend style="color: black" class="col-form-label col-sm-2 pt-0">Category</legend>
                            <div class="col-sm-10">
                                <c:forEach var="category" items="${cate}">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="Category" id="gridRadios1" value="${category.cateID}" checked>
                                        <label style="color: black" class="form-check-label" for="gridRadios1">
                                            "${category.cateName}"
                                        </label>
                                    </div>
                                </c:forEach>            
                            </div>
                        </div>
                    </fieldset>
                    <input type="hidden" name="action" value="updatedPlant"/>
                    <input type="hidden" name="id" value="${p.id}"/>
                    <input type="submit" value="update"/>
                    <h3 style="color: black">${requestScope.MSG}</h3>
                </form>
            </section>
        </div>
    </body>
</html>
