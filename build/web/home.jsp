<%-- 
    Document   : home
    Created on : Oct 8, 2019, 8:59:54 AM
    Author     : tientruong
--%>


<%@page import="model.Categories"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rabbit Watch</title>
        <%
            ArrayList<Product> prosnam = (ArrayList<Product>) request.getAttribute("datanam");
            ArrayList<Product> prosnu = (ArrayList<Product>) request.getAttribute("datanu");
            ArrayList<Categories> cates = (ArrayList<Categories>) request.getAttribute("cates");
        %>
        <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/home1.css">
        <link rel="stylesheet" type="text/css" href="css/global.css">
        
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div id="carouselExampleIndicators" class="carousel slide " data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="image/anh1.jpg" class="d-block w-100 " alt="...">
                </div>
                <div class="carousel-item">
                    <img src="image/anh2.jpg" class="d-block w-100 " alt="...">
                </div>
                <div class="carousel-item">
                    <img src="image/anh4.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <br>
        <!-- start dhnam -->
        <h2 class="text-center" id="dhnam">ĐỒNG HỒ NAM</h2>
        <br>

        <div class="container" >
            <div class="row">
                <%for (Product elem : prosnam) {
                %>
                <div class=" col-3 mb-5 pl-3">
                    <div class="card" style="height: 100%">
                        <img src="<%="image/" + elem.getImage()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <a href="pdetail?pid=<%=elem.getId()%>" class="card-title"><p><%=elem.getName()%></p></a>
                                    <%
                                        Locale.setDefault(new Locale("vi", "VN"));
                                        NumberFormat format = NumberFormat.getCurrencyInstance(Locale.getDefault());
                                        String currency = format.format(elem.getPrice());
                                    %>
                            <p class="gia"> <%=currency%></p>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <!-- end dhnam -->

        <!-- start dhnu -->
        <h2 class="text-center" id="dhnu">ĐỒNG HỒ NỮ</h2>
        <br >
        <div class="container" >
            <div class="row">
                <%for (Product elem : prosnu) {
                %>
                <div class=" col-3 mb-5 pl-3">
                    <div class="card" style="height: 100%">
                        <img src="<%="image/" + elem.getImage()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <a href="pdetail?pid=<%=elem.getId()%>" class="card-title"><p><%=elem.getName()%></p></a>
                                    <%
                                        Locale.setDefault(new Locale("vi", "VN"));
                                        NumberFormat format = NumberFormat.getCurrencyInstance(Locale.getDefault());
                                        String currency = format.format(elem.getPrice());
                                    %>
                            <p class="gia"> <%=currency%></p>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    
    
    <%@ include file="footers.jsp"%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
