<%-- 
    Document   : login
    Created on : Oct 25, 2019, 6:06:48 PM
    Author     : tientruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--        <link rel="stylesheet" type="text/css" href="css/login.css">-->
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.css" rel="stylesheet">

        <%
            String issuccess = (String) request.getAttribute("issucces");
        %>
        <style>
            .inputstyle{
                outline: none;
                border-radius: 25px;
                background: #e6e6e6;
                padding: 10px 0 10px 15px;
                width: 100%;
                border:1px solid #e6e6e6;
            }
        </style>
    </head>
    <%@ include file="header.jsp" %>
    <body>
        <div class="container mt-5" style="height: 680px; width: 800px;border: 1px solid white; border-radius: 10px;box-shadow: 0px 0px 6px 2px rgba(201,199,201,1);
             ">           
            <div class="container mt-5" style="height: 600px; width: 500px;">
                <h1 class="mb-5">Đăng Nhập</h1>
                <form method="post" action="login">
                    <!--                    <div class="form-group">
                                            <input name="email" type="email" class="inputstyle" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        </div>-->
                    <div class="md-form">
                        <i class="fas fa-user prefix"></i>
                        <input type="email" name="email" id="inputIconEx2" class="form-control">
                        <label for="inputIconEx2">E-mail address</label>
                    </div>
                    <!--                    <div class="form-group">
                                            <input name="pass" type="password" class="inputstyle" id="exampleInputPassword1" placeholder="Password">
                                        </div>-->
                    <div class="md-form">
                        <i class="fas fa-lock prefix"></i>
                        <input name="pass" type="password" id="inputValidationEx2" class="form-control validate">
                        <label for="inputValidationEx2" data-error="wrong" data-success="right">Type your password</label>
                    </div>
                    
                    <div class="custom-control custom-checkbox">
                        <input name="remember" type="checkbox" class="custom-control-input" id="defaultChecked2">
                        <label class="custom-control-label" for="defaultChecked2">Ghi nhớ mật khẩu</label>
                    </div>
                    <button type="submit" class="btn btn-success mt-5 mb-3" style="width:100%;border-radius: 25px">Đăng Nhập</button>
                    <p class="mt-3 text-center">Bạn chưa có tài khoản? <a href="signin" >Đăng Ký</a> ngay</p>
                </form>
                <%if (issuccess != null) { %>
                <p class="mt-2" style="color: red">Đăng nhập không thành công! <br> Sai email hoặc mật khẩu </p>
                    <%}%>
            </div>

        </div>
        <%@ include file="footers.jsp"%>
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
    </body>
</html>
