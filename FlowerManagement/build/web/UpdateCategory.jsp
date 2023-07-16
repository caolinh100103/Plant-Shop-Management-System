<%-- 
    Document   : UpdateCategory
    Created on : Mar 10, 2023, 11:55:32 AM
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
        <c:import url="AdminHeader.jsp"/>
        <c:set var="category" value="${requestScope.category}"/>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Update Category</h2>
                    <hr>
                </div>
            </div>

        </div>
        <section class="container my-3 bg-light w-50 text-light p-3">
 
            <form class="row g-3 p-3" method="post" action="MainController">
                <div class="col-md-12">
                    <p style="color: black">Old Category : ${category.cateName}</p>
                    <p style="color: black">Change Category <input class="form-control" type="text" name="newCategory" required=""/></p>
                </div>
                <input type="hidden" name="action" value="updatedCategory"/>
                <input type="hidden" name="cateID" value="${category.cateID}"/>
                <input type="submit" value="update"/>
                <h3 style="color: black">${requestScope.MSG}</h3>
            </form>
        </section>
    </body>
</html>
