<%-- 
    Document   : ManageCategory
    Created on : Mar 10, 2023, 11:21:07 AM
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
        <c:set var="listCate" value="${requestScope.listCategories}"/>
        <div class="container">
            <hr>
            <table class="table" >
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="category" items="${listCate}">
                    <tr>
                        <td>${category.cateID}</td>
                        <td>${category.cateName}</td>
                        <td><a href="MainController?action=updateCategory&id=${category.cateID}">Update</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a class="createCate" href="MainController?action=createCategory">Create a new Category</a>
        </div>
    </body>
</html>
