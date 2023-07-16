<%-- 
    Document   : UserHome
    Created on : Mar 6, 2023, 9:49:10 PM
    Author     : linh1
--%>

<%@page import="basicobjects.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="basicobjects.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <header>
            <%@include file="UserHeader.jsp" %>
        </header>
            
        <%
            User user = (User) session.getAttribute("loginUser");

            ArrayList<Plant> list = (ArrayList<Plant>) request.getAttribute("listPlants");
            if (list != null && list.size() > 0) {
        %>

        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Image</th>
                <th>Status</th>
                <th>Action</th>
                <th>Action</th>
            </tr>
            <%
                for (Plant t : list) {
            %>
            <tr>
                <td><%= t.getId()%></td>
                <td><%= t.getPName()%></td>
                <td><%= t.getCheck()%></td>
                <td style="text-align: center;"><img src="<%=t.getImgPath()%>" style="width: auto; height: 500px"></td>
                <td><%= t.getStatus() == 1?"AVAILABLE":"NOT AVAILABLE"%></td>
                <td><a href="MainController?action=plantDetail&id=<%=t.getId()%>"style="text-decoration: none">Detail</a></td>
                <td><a href="MainController?action=addtocart&id=<%=t.getId()%>" style="text-decoration: none"><%= t.getStatus() == 1 ?"ADD TO CART " : ""%></a></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
        } else {
            String s = (String) request.getAttribute("MSG");
        %>
        <%= s != null ? s : ""%>
        <div class="body">
            <h1>Welcome <%=user.getFullName()%> to L-Plant</h1>
            <div class="center">
                <div class="child">
                    <h2>Good plant good life</h2>
                </div>
            </div>
            <div class="bestSeller">
                <h1 style="margin: 15px">Top Seller</h1>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="Images/pexels-photo-1407325.jpeg" alt="">
                            <p>Tempore, dolores. Conubia error nec vestibulum diam aut magni diam laoreet gravida, odit
                                consequat. Corrupti optio. Facilisis totam anim, voluptatibus, earum, ornare inventore? Facilisi
                                nisi id blandit similique dolores porta harum, wisi molestiae sollicitudin, hac nulla nullam
                                aperiam, amet tortor dui illum laborum vero dictum? Exercitationem sint lobortis. Congue culpa
                                natoque diamlorem donec, modi turpis sociosqu montes nam etiam irure!</p>
                        </div>
                        <div class="col-md-6">
                            <img src="Images/pexels-photo-1578105.webp" alt="">
                            <p>Tempore, dolores. Conubia error nec vestibulum diam aut magni diam laoreet gravida, odit
                                consequat. Corrupti optio. Facilisis totam anim, voluptatibus, earum, ornare inventore? Facilisi
                                nisi id blandit similique dolores porta harum, wisi molestiae sollicitudin, hac nulla nullam
                                aperiam, amet tortor dui illum laborum vero dictum? Exercitationem sint lobortis. Congue culpa
                                natoque diamlorem donec, modi turpis sociosqu montes nam etiam irure!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
