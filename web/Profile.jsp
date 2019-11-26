<%-- 
    Document   : Profile
    Created on : Oct 27, 2019, 1:30:33 PM
    Author     : tientruong
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/home1.css">
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <%

            User acc = (User) request.getAttribute("user");
            String issuc1 = (String) request.getAttribute("issuc1");
            String issuc2 = (String) request.getAttribute("issuc2");
        %>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1 style="text-align: center">Thành Viên: <%=acc.getName()%></h1>
        <div class="container" >
            <h3>Thông Tin Tài Khoản</h3>
            <div class="container mt-5" style="width: 700px">

                <form method="post" action="Profile">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=acc.getEmail()%>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Mật Khẩu</label>
                        <input type="password" name="oldpass" class="form-control" id="exampleInputPassword1" required >
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Mật Khẩu Mới</label>
                        <input type="password" name="newpass" class="form-control" id="exampleInputPassword1" required>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Xác Nhận Mật Khẩu Mới</label>
                        <input type="password" name="newpassconfirm" class="form-control" id="exampleInputPassword1" required>
                    </div>
                    <input type="hidden" value="1" name="formtype">
                    <input type="hidden" value="<%=acc.getId()%>" name="ID">
                    <%if (issuc1 != null) {%>
                    <p style="color: red"> <%=issuc1%> </p>
                    <%}%>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </form>

            </div>
        </div>


        <div class="container mt-5" >
            <h3>Thông Tin Cá Nhân</h3>
            <div class="container mt-5" style="width: 700px">      
                <form method="post" action="Profile">
                    <div class="form-group">
                        <label >ID</label>
                        <input type="text" name="ID" class="form-control" id="exampleInputPassword1" value="<%=acc.getId()%>" readonly>
                    </div>

                    <div class="form-group">
                        <label >Tên</label>
                        <input type="text" name="name" class="form-control" id="exampleInputPassword1" value="<%=acc.getName()%>" required>
                    </div>

                    <div class="form-group">
                        <label >Số Điện Thoại</label>
                        <input type="text" name="phone" class="form-control" id="exampleInputPassword1" value="<%=acc.getPhone()%>" required>
                    </div>
                    <div class="form-group">
                        <label >Địa Chỉ</label>
                        <input type="text" name="address" class="form-control" id="exampleInputPassword1" value="<%=acc.getAddress()%>" required>
                    </div>
                    <div class="form-group">
                        <label >Ngày Tạo</label>
                        <%
                            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                            String dateString = df.format(acc.getCreated());
                        %>
                        <input type="text" name="created" class="form-control" id="exampleInputPassword1" value="<%=dateString %>" readonly>
                    </div>

                    <input type="hidden" value="2" name="formtype">
                    <%if (issuc2 != null) {%>
                    <p style="color: red"> <%=issuc2%> </p>
                    <%}%>
                    <button type="submit" class="btn btn-primary mb-5">Lưu</button>
                </form>

            </div>
        </div>







        <%@ include file="footers.jsp" %>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    </body>
</html>
