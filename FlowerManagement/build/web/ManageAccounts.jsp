<%-- 
    Document   : ManageAccounts
    Created on : Mar 7, 2023, 12:12:10 PM
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
        <form style="float: right" action="MainController" method="post" >
            <input type="text" name="txtSearch" />
            <input type="hidden" name="action" value="searchAccount"/>
            <input type="submit" value="search" />
        </form>

        <table class="table">
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Full Name</th>
                <th>Phone</th>
                <th>Status</th>
                <th>role</th>
                <th>action</th>
            </tr>
            <c:forEach var="user" items="${requestScope.listOfAccounts}">
                <tr>
                    <td>${user.accID}</td>
                    <td>${user.email}</td>
                    <td>${user.fullName}</td>
                    <td>${user.phone}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.status == 1}">
                                AVAILABLE
                            </c:when>
                            <c:otherwise>
                                NOT AVAILABLE
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${user.role == 1}">
                                ADMIN
                            </c:when>
                            <c:otherwise >
                                USER
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${user.status == 1 && user.role == 0}">
                            <a href="MainController?action=blockOrunblock&status=0&id=${user.accID}">BLOCK</a>
                        </c:if>
                        <c:if test="${user.status == 0 && user.role == 0}">
                            <a href="MainController?action=blockOrunblock&status=1&id=${user.accID}">UNBLOCK</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
