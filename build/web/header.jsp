<%-- 
    Document   : header
    Created on : Oct 23, 2019, 3:58:21 PM
    Author     : tientruong
--%>

<%@page import="model.User"%>
<%@page import="dal.CategoriesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Categories"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jomolhari&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/home1.css">
        <link rel="stylesheet" type="text/css" href="css/all.min.css">
        <%
            CategoriesDAO cd = new CategoriesDAO();
            ArrayList<Categories> cx = cd.getCate();
        %>
        <style>
            .user{
                color: white; 

            }
            .user:hover{
                color: white; 
                text-decoration: underline;
            }
            #brand:hover{
                text-decoration: none;
            }
            #gio:hover{
                text-decoration: none;
            }
        </style>
    </head>
    <body>

        <div class="bg-dark fixed-top" style="height: 50px;">
            <div class="container" style="line-height:47px">
                <a id="brand" style="font-family: 'Notable', sans-serif; font-size: 20px; color: whitesmoke;" href="home">Rabbit </a>
                <input placeholder="Search..." type="text" size="50" style="outline:none;line-height: 0;margin-left:16%;border:2px solid black;position: absolute;top: 9px;padding: 6px; border-radius: 20px;padding-left: 20px ">
                <i  class="fas fa-search" style="max-height: 100%;margin-left: -15px;border-left: 1px solid black;padding: 0 0 0 10px;position: absolute;left: 61.7%;top: 18px;"></i>
                <a id="gio" href="Cart" class="fas fa-shopping-cart" style="position:absolute;left: 75%;top:25%;font-size: 30px;color: white"></a>
                <% if (session.getAttribute("user") == null) {
                %>
                <div style="float: right;display:inline;margin-right:-165px">
                    <a href="login" style="color: whitesmoke;font-weight: bold">Đăng Nhập</a> | <a style="color: whitesmoke;font-weight: bold" href="signin">Đăng Ký</a><br/>
                </div>
                <%}
                %>
                <!--                <div class="btn-group " style="float: right;display:inline" >
                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-user"></i> &ensp;  
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a href="Profile"><button class="dropdown-item" type="button">Thông tin</button></a>
                                        <button class="dropdown-item" type="button">Đơn Mua</button>
                                        <a href="logout"><button class="dropdown-item" type="button"><i class="fas fa-sign-out-alt"></i> Log Out</button></a>
                                    </div>
                                </div>-->


            </div>
            <% if (session.getAttribute("user") != null) {
            %>
            <div class="btn-group " style="float: right;display:inline;margin-top: -37px;
                 margin-right: 40px;" >
                <a href="Profile" class="user ml-3">Thông tin </a>
                <a class="user ml-3" href="UserOrder"> Đơn mua </a> 
                <a class="user ml-3" href="logout"> Đăng xuất </a>
            </div>
            <%}
            %>
        </div>
        
        <!-- navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-top:55px;color: black;font-weight: bold">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav m-auto">
                    <%for (Categories elem : cx) {
                    %>
                    <li class="nav-item m-auto text-center" style="padding: 0 70px;">
                        <a class="nav-link" href="<%=elem.getLink()%>"><%=elem.getName().toUpperCase()%> </a>
                    </li>
                    <%}
                    %>
                </ul>
            </div>
        </nav>
        <!-- end navbar -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
