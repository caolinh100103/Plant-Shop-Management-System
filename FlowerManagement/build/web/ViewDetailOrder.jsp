<%-- 
    Document   : ViewDetailOrder
    Created on : Mar 14, 2023, 11:57:16 PM
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
        <c:set var="user" value="${sessionScope.loginUser}"/>
        <c:if test="${user.role == 1}">
            <c:import url="AdminHeader.jsp"/>
        </c:if>
        <c:if test="${user.role == 0}">
            <c:import url="UserHeader.jsp"/>
        </c:if>

        <c:set var="orderDetail" value="${requestScope.orderList}"/>
        <table class="table">
            <tr>
                <th>ORDER DETAIL ID</th>
                <th>ORDER ID</th>
                <th>PLANT ID</th>
                <th>PLANT NAME</th>
                <th>IMAGE</th>
                <th>PRICE</th>
                <th>QUANTITY</th>
            </tr>
            <c:forEach var="orderDetail" items="${orderDetail}">
                <tr>
                    <td>${orderDetail.ordDeatailID}</td>
                    <td>${orderDetail.orderID}</td>
                    <td>${orderDetail.plantID}</td>
                    <td>${orderDetail.plantName}</td>
                    <td><img style="width: 50%; height: 150px" src="${orderDetail.imgPath}"/></td>
                    <td>${orderDetail.price}$</td>
                    <td>${orderDetail.quantity}</td>
                </tr>
            </c:forEach>
        </table>
        <c:import url="footer.jsp"/>
    </body>
</html>
