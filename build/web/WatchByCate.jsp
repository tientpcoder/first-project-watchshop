<%-- 
    Document   : MenWatch
    Created on : Oct 23, 2019, 4:44:48 PM
    Author     : tientruong
--%>

<%@page import="java.util.Arrays"%>
<%@page import="ulti.HtmlHelper"%>
<%@page import="model.ProductInfo"%>
<%@page import="model.DialShape"%>
<%@page import="model.Movement"%>
<%@page import="model.Crystal"%>
<%@page import="model.ATM"%>
<%@page import="model.Strap"%>
<%@page import="model.Brand"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            ArrayList<ProductInfo> data = (ArrayList<ProductInfo>) request.getAttribute("datapro");
            Categories cate = (Categories) request.getAttribute("datacates");
            String title = cate.getName().toUpperCase();
            ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("brands");
            ArrayList<Strap> straps = (ArrayList<Strap>) request.getAttribute("straps");
            ArrayList<Crystal> crystals = (ArrayList<Crystal>) request.getAttribute("crystals");
            ArrayList<Movement> movements = (ArrayList<Movement>) request.getAttribute("movements");
            ArrayList<DialShape> dialShapes = (ArrayList<DialShape>) request.getAttribute("dialShapes");
            ArrayList<ATM> atms = (ArrayList<ATM>) request.getAttribute("atms");
            Integer cid = (Integer) request.getAttribute("cid");
            String check = "";
            String cprice = (String) request.getAttribute("cprice");
            cprice = (cprice != null) ? cprice : "";
            Integer pageindex = (Integer) request.getAttribute("pageindex");
            Integer pagecount = (Integer) request.getAttribute("pagecount");
            Integer pfrom = (Integer) request.getAttribute("pfrom");
            Integer pto = (Integer) request.getAttribute("pto");
            String brandc = (String) request.getAttribute("cbrand");
            String[] checkedbrands = brandc.split(",");
            String cstrap = (String) request.getAttribute("cstrap");
            String[] checkedstraps = cstrap.split(",");
            String ccrystal = (String) request.getAttribute("ccrystal");
            String[] checkedcrystals = ccrystal.split(",");
            String cmovement = (String) request.getAttribute("cmovement");
            String[] checkedmovements = cmovement.split(",");
            String cdialshape = (String) request.getAttribute("cdialshape");
            String[] checkeddialshape = cdialshape.split(",");
            String catm = (String) request.getAttribute("catm");
            String[] checkedatms = catm.split(",");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=title%></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Old+Standard+TT:600&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/home1.css">
        <link rel="stylesheet" type="text/css" href="css/global.css">

        <script>
            function submitForm()
            {
                document.getElementById("searchFrm").submit();
            }
        </script>

        <style>
            ul.breadcrumb1 {
                padding: 10px 16px;
                list-style: none;
            }
            ul.breadcrumb1 li {
                display: inline;
                font-size: 18px;
            }
            ul.breadcrumb1 li+li:before {
                padding: 8px;
                color: black;
                content: "/\00a0";
            }
            ul.breadcrumb1 li a {
                color: grey;
                text-decoration: none;
            }
            ul.breadcrumb1 li a:hover {
                color: red;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="top mt-5 mb-5 text-center">
            <h4 style="text-align: center;"><%=title%></h4>  
            <ul class="breadcrumb1 text-center">
                <li><a href="home">Trang Chủ</a></li>
                <li><%=title%></li>
            </ul>
        </div>
        <div class="container" style="font-family: 'Old Standard TT', serif;font-weight: 500" >
            <div class="row">
                <div class="col-3">
                    <form  action="WatchByCate?Cate=<%=cid%>" method="post" >
                        <!--loc theo thuong hieu-->
                        <p>THƯƠNG HIỆU</p>

                        <div style="max-height: 255px;">
                            <%for (Brand elem : brands) {
                                    check = "";
                            %>
                            <%
                                for (String s : checkedbrands) {
                                    if (s.equals(elem.getId() + "")) {
                                        check = "checked";
                                    }
                                }
                            %>
                            <input <%=check%>  type="checkbox" value="<%=elem.getId()%>" name="brandc"/> <%=elem.getName()%>
                            <br>
                            <%}%>
                        </div>
                        <hr>
                        <!--loc theo gia-->
                        <p>LỌC THEO GIÁ</p>

                        <div style="max-height: 255px;">
                            <input type="checkbox" value="1" name="price" <%=cprice.equals("1") ? "checked" : ""%> />  0 đ - 2.000.000 đ <br>
                            <input type="checkbox" value="2" name="price" <%=cprice.equals("2") ? "checked" : ""%>/> 2.000.000 đ - 5.000.000 đ <br>
                            <input type="checkbox" value="3" name="price" <%=cprice.equals("3") ? "checked" : ""%>/> 5.000.000 đ - 10.000.000 đ <br>
                            <input type="checkbox" value="4" name="price" <%=cprice.equals("4") ? "checked" : ""%>/> 10.000.000 đ + <br>
                        </div>
                        <hr>
                        <!--loc theo loai day-->
                        <p>CHẤT LIỆU DÂY</p>

                        <div style="max-height: 255px;">
                            <%for (Strap elem : straps) {
                                    check = "";
                            %>
                            <%
                                for (String e : checkedstraps) {
                                    if (e.equals(elem.getId() + "")) {
                                        check = "checked";
                                    }
                                }
                            %>
                            <input <%=check%> type="checkbox" value="<%=elem.getId()%>" name="strap" /> <%=elem.getName()%>
                            <br>
                            <%}%>
                        </div>
                        <hr>
                        <!--loc theo loai mat kinh-->
                        <p>CHẤT LIỆU MẶT KÍNH</p>

                        <div style="max-height: 255px;">
                            <%for (Crystal elem : crystals) {
                                    check = "";
                            %>
                            <%
                                for (String e : checkedcrystals) {
                                    if (e.equals(elem.getId() + "")) {
                                        check = "checked";
                                    }
                                }
                            %>
                            <input <%=check%> type="checkbox" value="<%=elem.getId()%>" name="crystal"/> <%=elem.getName()%>
                            <br>
                            <%}%>
                        </div>
                        <hr>
                        <!--loc theo loai may-->
                        <p>BỘ MÁY & NĂNG LƯỢNG</p>

                        <div style="max-height: 255px;">
                            <%for (Movement elem : movements) {
                                    check = "";
                            %>
                           <%
                                for (String s : checkedmovements) {
                                    if (s.equals(elem.getId() + "")) {
                                        check = "checked";
                                    }
                                }
                            %>
                            <input <%=check%> type="checkbox" value="<%=elem.getId()%>" name="movement"/> <%=elem.getName()%>
                            <br>
                            <%}%>
                        </div>
                        <hr>
                        <!--loc theo hinh dang mat so-->
                        <p>HÌNH DẠNG MẶT SỐ</p>

                        <div style="max-height: 255px;">
                            <%for (DialShape elem : dialShapes) {
                                    check = "";
                            %>
                            <%
                                for (String s : checkeddialshape) {
                                    if (s.equals(elem.getId() + "")) {
                                        check = "checked";
                                    }
                                }
                            %>
                            <input <%=check%> type="checkbox" value="<%=elem.getId()%>" name="dialshape"/> <%=elem.getName()%>
                            <br>
                            <%}%>
                        </div>
                        <hr>
                        <!--loc theo muc chong nuoc-->
                        <p>MỨC CHỐNG NƯỚC</p>

                        <div style="max-height: 255px;">
                            <%for (ATM elem : atms) {
                                    check = "";
                            %>
                            <%
                                for (String s : checkedatms) {
                                    if (s.equals(elem.getId() + "")) {
                                        check = "checked";
                                    }
                                }
                            %>
                            <input <%=check%> type="checkbox" value="<%=elem.getId()%>" name="atm"/> <%=elem.getType()%>
                            <br>
                            <%}%>
                        </div>
                        <hr>
                        <input style="width:40%;" type="submit" class="btn btn-outline-success" value="Filter"/> 
                        <a href="WatchByCate?Cate=<%=cid%>"><button type="button" class="btn btn-outline-danger" style="float:right;width:40%;">Clear</button></a>


                    </form>
                </div>
                <div class="col-9">

                    <img src=<%="image/" + cate.getBanner()%> >
                    <blockquote class="fl-l style2 mt-3"><p></p>
                        <p><span style="font-family: 'Big Shoulders Text', cursive; font-size: 15pt;"><%=cate.getDescrip()%></span></p>
                        <p><span style="font-family: 'Big Shoulders Text', cursive;
                                 ; font-size:15pt;"></span></p>
                    </blockquote>
                    <div class="row mt-4">
                        <%  int k = 0;
                            for (ProductInfo elem : data) {
                                k++;
                        %>
                        <%if (elem.getProduct().isStatus() && k >= pfrom && k <= pto) {
                        %>
                        <div class=" col-4 mb-5 pl-3">
                            <div class="card" style="height: 100%">
                                <img src="<%="image/" + elem.getProduct().getImage()%>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <a href="pdetail?pid=<%=elem.getProduct().getId()%>" class="card-title"><p><%=elem.getProduct().getName()%></p></a>
                                            <%
                                                Locale.setDefault(new Locale("vi", "VN"));
                                                NumberFormat format = NumberFormat.getCurrencyInstance(Locale.getDefault());
                                                String currency = format.format(elem.getProduct().getPrice());
                                            %>
                                    <p class="gia"> <%=currency%></p>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <%}%>


                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination"style="float: right;padding-right: 30px;">
                            <%=HtmlHelper.pager(cid + "", brandc, cstrap,ccrystal,cmovement,cdialshape,catm,cprice,pageindex, pagecount, 2)%>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
        <%@ include file="footers.jsp"%>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
