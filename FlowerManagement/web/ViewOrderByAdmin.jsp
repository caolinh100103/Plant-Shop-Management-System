<%-- 
    Document   : ViewOrderByAdmin
    Created on : Mar 11, 2023, 9:37:40 PM
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
        <c:set var="listOrder" value="${requestScope.OrderList}"/>
        <table class="table" style="margin-bottom: 25px">
            <tr>
                <th>Account ID</th>
                <th>Account Full Name</th>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Ship Date</th>
                <th>Status</th>
                <th>Action</th>
                <th>Action</th>
            </tr>
            <c:forEach var="order" items="${listOrder}">
                <tr>
                    <td>${order.key.accID}</td>
                    <td>${order.value}</td>
                    <td>${order.key.orderID}</td>
                    <td>${order.key.orderDate}</td>
                    <td>${order.key.shipDate}</td>
                    <td>
                        <c:if test="${order.key.status == 1}">
                            Processing
                            <br>
                            <a style="text-decoration: none" href="MainController?action=completeOrder&orderid=${order.key.orderID}">Complete Order</a>
                        </c:if>
                        <c:if test="${order.key.status == 2}">
                            Completed
                        </c:if>
                        <c:if test="${order.key.status == 3}">
                            Canceled
                        </c:if>

                    </td>
                    <td><a style="text-decoration: none" href="MainController?action=viewAllOrdersOfOne&id=${order.key.accID}">View All Orders of this account</a></td>
                    <td><a style="text-decoration: none" href="MainController?action=orderDetail&orderid=${order.key.orderID}">View Detail Order</a></td>
                </tr>
            </c:forEach>
        </table>

        <form  style="float: left; margin-left: 30px; border: 1px solid black; padding: 10px" action="MainController" method="post">
            <input type="date" name="txtDateFrom" />
            to
            <input type="date" name="txtDateTo" />
            <input type="hidden" name="action" value="searchByDateByAdmin"/>  
            <br>
            <input type="text" name="accountName" placeholder="Account Name"/>
            <br>
            <input type="submit" value="Search"/>
        </form>

    </body>
</html>
