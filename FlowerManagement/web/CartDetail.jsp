<%-- 
    Document   : CartDetail
    Created on : Feb 21, 2023, 12:23:09 PM
    Author     : linh1
--%>

<%@page import="java.util.HashMap"%>
<%@page import="DAO.PlantDAO"%>
<%@page import="basicobjects.Plant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>

    <body>
        <c:set var="user" value="${sessionScope.loginUser}"/>
        <c:choose>
            <c:when test="${user != null}">
                <c:import url="UserHeader.jsp"/>
            </c:when>
            <c:otherwise>
                <c:import url="header.jsp"/>
            </c:otherwise>
        </c:choose>
        <%
            HashMap<Integer, Integer> cart = (HashMap<Integer, Integer>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
        %>
        <h1>Thong tin cua gio hang</h1>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>PRICE</th>
                <th>QUANTITY</th>
                <th>SELECTION</th>
            </tr>
            <%
                float total = 0;
                for (int id : cart.keySet()) {
                    Plant p = PlantDAO.getPlant(id);
            %>
            <tr> <form method="post" action="MainController">
                <td><%=p.getId()%></td>
                <td><%=p.getPName()%></td>
                <td><%=p.getCheck()%>$</td>
                <td><input type="number" value="<%=cart.get(id)%>" min="1" name="quantity"/></td>
                <td>
                    <input type="submit" value="update" name="action"/>
                    <input type="submit" value="remove plant" name="action" />
                </td>
                <input type="hidden" value="<%=p.getId()%>" name="pid"/>
            </form>
        </tr>
        <%
                total = total + p.getCheck() * cart.get(id);
            }
        %>
        <h2>Tong tien thanh toan: <%=total%>$</h2>
        <form method="post" action="MainController">
            <input type="submit" name="action" value="checkout"/>
        </form>
        <%
            } else {
                out.print("<h1>None products in cart</h1>");
            }
        %>
    </table>

    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</body>

</html>
