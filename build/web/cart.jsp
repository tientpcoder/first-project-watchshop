<%-- 
    Document   : cart
    Created on : Oct 31, 2019, 3:22:54 PM
    Author     : tientruong
--%>

<%@page import="model.ProductInfo"%>
<%@page import="dal.ProDuctInfoDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.OrderLine"%>
<%@page import="model.Order"%>
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
            Order order = (Order) session.getAttribute("cart");
            String name = (String) request.getAttribute("name");
            String id = (String) request.getAttribute("id");
            Integer them = (Integer) request.getAttribute("them");
            int k = 0;
            Locale.setDefault(new Locale("vi", "VN"));
            NumberFormat format = NumberFormat.getCurrencyInstance(Locale.getDefault());
        %>
        <style>
            #links {
                color: black;
            }
            #links:hover {
                color: red;
            }

        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container mt-5">
            <h3 class="text-center mt-5" style="font-weight: 300">Giỏ Hàng</h3>
            <hr>
            <div class="text-center">
                <a href="home" style="color: grey">Trang Chủ</a> / Giỏ Hàng
            </div>
            <% if (order == null) {  %>
            <div class="text-center ">
                <i style="font-size: 100px;" class="fas fa-shopping-bag mt-5" > 
                    <span style="font-size: 35px;color: white;margin-left: -50px">?</span>

                </i> 
                <h3 class="mt-5">BẠN CHƯA ĐẶT MUA BẤT KỲ SẢN PHẨM NÀO!</h3>
                <h6 class="mt-2">Hãy chọn cho mình 1 chiếc đồng hồ ưng ý nhất nhé 🙂</h6>
            </div>

            <%} else {%>

            <%if (them == 1) {
            %>
            <div class="mt-5 py-4 text-center" style="background-color: green">
                <i style="color: white;font-size: 30px;" class="fas fa-check"></i>
                <span style="color: white">"<%=name%>" ĐÃ ĐƯỢC THÊM VÀO GIỎ HÀNG </span>
                <a href="pdetail?pid=<%=id%>"><button type="button" class="btn btn-outline-warning">TIẾP TỤC XEM SẢN PHẨM</button></a>
            </div>
            <%}
            %>

            <div class="row">
                <div class="col-9">
                    <form method="post" action="UpdateCart">

                        <table class="table mt-5">
                            <thead class="text-center">
                                <tr>
                                    <th scope="col"></th>
                                    <th scope="col">Sản Phẩm</th>
                                    <th scope="col" style="width: 130px;">Giá</th>
                                    <th scope="col">Số Lượng</th>
                                    <th scope="col" style="width: 130px;">Tổng Cộng</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                <%for (OrderLine elem : order.getLines()) {%>
                                <%
                                        ProDuctInfoDAO pid = new ProDuctInfoDAO();
                                        ProductInfo pin = pid.getProductInfosByID(elem.getProduct().getId());
                                        int quan = pin.getProduct().getQuantity();
                                    %>
                                <tr>
                                    <th scope="row"><img style="width: 90px;height: 90px;" src="image/<%=elem.getProduct().getImage()%>"></th>
                                    <td ><a id="links" href="pdetail?pid=<%=elem.getProduct().getId()%>"> <%=elem.getProduct().getName()%> </a>
                                        <br>
                                        <small>Còn <%=quan %> sản phẩm</small>
                                    </td>
                                    <%

                                        String currency = format.format(elem.getProduct().getPrice());
                                    %>
                                    <td><%=currency%></td>
                                    
                                    <td><input style="width: 40px" min="1" max="<%=quan %>" type="number" name="<%="quan" + k%>" value="<%=elem.getQuantity()%>" /></td>
                                        <%
                                            currency = format.format(elem.getTotal());
                                        %>
                                    <td><%= currency%></td>
                                    <td><a class="ml-2" href="UpdateCart?rindex=<%=k%>"><i class="fas fa-minus-circle"></i></a> </td>
                                </tr>
                                <%k++;
                                    }%>
                            </tbody>
                        </table>
                        <input type="submit" class="btn btn-outline-info" value="Cập Nhập Giỏ Hàng" />

                    </form>
                </div>
                <div class="col-3">

                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Tổng Hóa Đơn</th>
                                <th scope="col"></th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Tạm Tính</th>
                                <td style="color: red;font-weight: 600"><%=format.format(order.total())%></td>

                            </tr>
                            <tr>
                                <th scope="row">Tổng</th>
                                <td style="color: red;font-weight: 600"><%=format.format(order.total())%></td>
                            </tr>
                        </tbody>
                    </table>
                            
                            <a href="Checkout"><button style="width: 100%" type="button" class="btn btn-danger" > Thanh Toán <i class="fas fa-arrow-right"></i> </button></a>
                         
                </div>
            </div>

            <%}%>

        </div>
        <%@ include file="footers.jsp" %>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
