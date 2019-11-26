<%-- 
    Document   : UserOrder
    Created on : Nov 2, 2019, 11:51:40 AM
    Author     : tientruong
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.OrderLine"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn Hàng Của Bạn</title>
        <%
            ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
            Locale.setDefault(new Locale("vi", "VN"));
            NumberFormat format = NumberFormat.getCurrencyInstance(Locale.getDefault());
        %>
        <style>
            footer{
               margin-top: 500px;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>       
        <%if (orders.size() > 0) {
        %>
        <h3 class="mt-5 mb-5 text-center">Đơn Hàng Của Bạn</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID Đơn Hàng</th>
                    <th scope="col">Sản Phẩm</th>
                    <th scope="col">Giá Trị Đơn Hàng</th>
                    <th scope="col">Thông Tin Giao Hàng</th>
                    <th scope="col">Trạng Thái</th>
                </tr>
            </thead>
            <tbody>
                <% for (Order o : orders) {%>
                <tr>
                    <th scope="row"><%= o.getId()%></th>
                    <td>
                        <%for (OrderLine ol : o.getLines()) {%>
                        <p><%=ol.getProduct().getName()%> x <%=ol.getQuantity()%> </p>
                        <%}%>
                    </td>
                    <td><%=format.format(o.total())%></td>
                    <td>
                        <p>Tên: <%=o.getName()%></p>
                        <p>Sđt: <%=o.getPhone()%></p>
                        <p>Địa Chỉ: <%=o.getAddress()%></p>
                    </td>
                    <% if (o.isStatus()) {%>
                    <td style="color: green;font-weight: 600;">Đã Xác Nhận</td>
                    <%} else {%>
                    <td style="color: red;font-weight: 600;">Chưa Xác Nhận</td>
                    <%}%>
                </tr>
                <%}%>

            </tbody>
        </table>
        <%}else{%>
        <h3 class="mt-5 mb-5 text-center">Bạn Chưa Có Đơn Hàng Nào</h3>
        <%}%>
        <%@ include file="footers.jsp" %>
    </body>
</html>
