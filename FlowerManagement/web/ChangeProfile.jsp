<%-- 
    Document   : ChangeProfile
    Created on : Mar 5, 2023, 10:44:08 AM
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
        <header>
            <%@include file="UserHeader.jsp" %>
        </header>
        <c:set var="user" value="${sessionScope.loginUser}"/>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>My Profile</h2>
                    <hr>
                </div>
            </div>


        </div>
        <section class="container my-3 bg-light w-50 text-light p-3">
            <h2 style="text-align: center; color: black"> Email : ${user.email}</h2>
 
            <form class="row g-3 p-3" method="post" action="MainController">
                <div class="col-md-6">
                    <p style="color: black"> Old Fullname : ${user.fullName}</p>
                    <p style="color: black">Change Fullname: <input class="form-control" type="text" name="newName"/></p>
                </div>
                <div class="col-md-6">
                    <p style="color: black">Old Phone: ${user.phone}</p>
                    <p style="color: black">Change phone: <input class="form-control" type="text" name="newPhone"/></p>
                </div>
                <input type="hidden" name="action" value="updateProfile"/>
                <input type="submit" value="update"/>
                <h3 style="color: black">${requestScope.Error}</h3>
            </form>
        </section>
                    
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
