<%-- 
    Document   : ViewOrders
    Created on : Mar 1, 2023, 4:42:18 PM
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
            <%@include file="UserHeader.jsp"%>
        </header>
        <c:set var="orderList" value="${requestScope.allOrders}"/>
        <c:choose>
            <c:when test="${orderList != null && orderList.size() > 0}">
                <table class="table">
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Ship Date</th>
                        <th>Order's Status</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.orderID}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.shipDate}</td>
                            <td>
                                <c:if test="${order.status == 1}">
                                    Processing
                                    <br/>
                                    <a href="MainController?action=CancelOrder&OrderID=${order.orderID}" class="Cancle">Cancel Order</a>
                                </c:if>
                                <c:if test="${order.status == 2}">
                                    Completed
                                </c:if>
                                <c:if test="${order.status == 3}">
                                    Canceled
                                </c:if>
                            </td>
                            <td><a href="MainController?action=orderDetail&orderid=${order.orderID}">View Detail</a></td>
                        </tr>
                    </c:forEach>
                </table>
                <form action="MainController" method="post" style="margin: 30px">
                    <input type="date" name="txtDateFrom" />
                    to
                    <input type="date" name="txtDateTo" />
                    <input type="hidden" name="action" value="searchByDate"/>
                    <input type="submit" value="Search"/>
                </form>
                <c:set var="MSG" value="ErrorMsg" />
                <h3>${MSG == null? MSG : ""}</h3>
            </c:when>

            <c:otherwise>
                <h1>No Orders</h1>
            </c:otherwise>
        </c:choose>
        <footer>
            <%@include  file="footer.jsp"%>     
        </footer>
    </body>
</html>
