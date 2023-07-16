<%-- 
    Document   : CanceledOrders
    Created on : Mar 2, 2023, 11:10:09 AM
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
        <header>
            <%@include file="UserHeader.jsp" %>
        </header>
            <c:set var="canceledOrdersList" value="${requestScope.listOfCanceledOrders}"/>
        <c:choose>
            <c:when test="${canceledOrdersList.size() > 0 && canceledOrdersList != null}" >
                <table class="table">
                    <tr>
                        <th>OrderID</th>
                        <th>OrderDate</th>
                        <th>ShipDate</th>
                        <th>Order's Status</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="order" items="${canceledOrdersList}">
                        <tr>
                            <td>${order.orderID}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.shipDate}</td>
                            <td>
                                <c:if test="${order.status == 3}">
                                    Canceled
                                </c:if>
                            </td>
                            <td><a href="MainController?action=OrderAgain&orderID=${order.orderID}">Order Again</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise >
                <h1>No canceled orders</h1>
            </c:otherwise>
        </c:choose> 
        
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
