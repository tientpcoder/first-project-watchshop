<%-- 
    Document   : checkout
    Created on : Nov 1, 2019, 4:38:36 PM
    Author     : tientruong
--%>

<%@page import="model.OrderLine"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh Toán</title>
        <%
            Order order = (Order) session.getAttribute("cart");
            Locale.setDefault(new Locale("vi", "VN"));
            NumberFormat format = NumberFormat.getCurrencyInstance(Locale.getDefault());
            User user = (User) session.getAttribute("user");
            String name = "";
            String email = "";
            String phone = "";
            String address = "";
            int id = -1;//ko co user thi id=-1
            int k = (user == null) ? 0 : 1;
            if (user != null) {
                id = user.getId(); // co thi cap nhap id
                name = user.getName();
                email = user.getEmail();
                phone = user.getPhone();
                address = user.getAddress();
            }
            String success = (String) request.getAttribute("success");
            ArrayList<String> sphet = (ArrayList<String>) request.getAttribute("sphet");
        %>
        <style>

            .tt{
                width: 95%;
            }
            label{
                margin-top: 5px;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container  mt-5">

            <h3 class="text-center">THANH TOÁN</h3>
            <hr>
            <div class="row">

                <div class="col-6">

                    <h3>ĐỊA CHỈ NHẬN HÀNG</h3>
                    <form action="Checkout" method="post">
                        <label >Họ & Tên:* </label>
                        <br>
                        <input class="tt" type="text" name="name" value="<%= name%>"  required />
                        <br>
                        <label>Quốc Gia: </label>
                        <span style="color: red;">Việt Nam</span>
                        <br>
                        <label >Địa chỉ:* </label>
                        <br>
                        <input class="tt" type="text" name="address" value="<%=  address%>"  required />
                        <br>          
                        <label >Số điện thoại:* </label>
                        <br>
                        <input class="tt" type="text" name="phone" value="<%=phone%>"  required />
                        <br>
                        <label >Địa Chỉ email:* </label>
                        <br>
                        <input class="tt" type="email" name="email" value="<%=email%>"  required />
                        <br>
                        <hr class="mt-5">
                        <h3 class="mt-5">THÔNG TIN THÊM</h3>
                        <small>Ghi chú đơn hàng (Tùy Chọn)</small>
                        <textarea name="message" cols="70" rows="5" placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa chỉ giao hàng chi tiết hơn"></textarea>
                        <br>
                        <input type="radio" name="purchase" class="mt-3" value="0" checked/> Thanh Toán Khi Nhận Hàng (COD)
                        <br>
                        <input type="radio" name="purchase" class="mt-3" value="1"/> Chuyển Khoản Ngân Hàng
                        <br>
                        <input type="hidden" name="id" value="<%= id%>" />
                        <%if (order != null) {%>
                        <input type="submit" class="btn btn-danger mt-5" value="Thanh Toán" />
                        <%}%>

                    </form>

                </div>

                <div class="col-6">
                    <%if (order != null) {
                    %>
                    <h4 class="text-center">Đơn Hàng Của Bạn</h4>
                    <table class="table mt-5" style="font-size:14px">
                        <thead>
                            <tr>
                                <th scope="col">Sản Phẩm</th>
                                <th scope="col" style="width: 160px"> Tổng Cộng</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%for (OrderLine elem : order.getLines()) {
                            %>
                            <tr>
                                <th scope="row"><%=elem.getProduct().getName()%> x <%=elem.getQuantity()%></th>
                                <td style="color: red;font-weight: 600" ><%=format.format(elem.getTotal())%></td>

                            </tr>
                            <%}%>
                            <tr style="font-weight: bold; font-size: 20px;">
                                <th >TỔNG CỘNG</th>
                                <td style="color: red;font-weight: 600" ><%=format.format(order.total())%></td>

                            </tr>
                        </tbody>
                    </table>
                    <%if (sphet != null) {
                            for (String elem : sphet) {
                    %>
                    <p style="color: red">Sản phẩm <%=elem%> không đủ số lượng bạn yêu cầu vui lòng đặt lại!</p>
                    <%}
                            }%>
                    <%} else {%>
                    <%
                        if (success != null) {%>
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">Đặt Hàng Thành Công!</h4>
                        <p>Đơn hàng của bạn đã đặt thành công! vui lòng chờ trong ít phút sẽ có nhân viên gọi cho bạn để xác nhận đơn hàng </p>
                        <hr>
                        <p class="mb-0">Chúc bạn tiếp tục mua sắm vui vẻ! Xin chân thành cảm ơn!</p>
                    </div>
                    <%}%>
                    <%}%>

                </div>

            </div>


        </div>
        <%@ include file="footers.jsp" %>
    </body>
</html>
