<%-- 
    Document   : signin
    Created on : Oct 26, 2019, 2:21:02 PM
    Author     : tientruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Ký</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--        <link rel="stylesheet" type="text/css" href="css/login.css">-->
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <%
            String email = (String) request.getAttribute("email");
            String pass = (String) request.getAttribute("pass");
            String passcf = (String) request.getAttribute("passcf");
            String name = (String) request.getAttribute("name");
            String phone = (String) request.getAttribute("phone");
            String address = (String) request.getAttribute("address");
            String result = (String) request.getAttribute("result");

        %>
        <style>
            .inputcss{
                outline: none;
                border: none;
                border-bottom: 1px solid black;
                border-radius: 0;
                padding: 5px 0;
                width: 100%;
                margin: 10px 0;
                transition: .3s;
            }
            .hov{
                transition: .3s !important;
            }
            .hov:hover{
                transform: scale(1.2);
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container mt-5" style="height: 900px; width: 800px;border: 1px solid black">           
            <div class="container mt-5" style="height: 750px; width: 500px;">
                <h4 class="text-center mb-5">Đăng Ký</h4>
                <form method="post" action="signin" onsubmit="return checkForm(this);">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Địa chỉ email *</label><br>
                        <input name="email" type="email" class="inputcss" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required value="<%=email%>">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Mật khẩu *</label><br>
                        <input name="pass" type="password" class="inputcss" id="exampleInputPassword1" placeholder="Password" value="<%=pass%>" required>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Nhập Lại Mật khẩu *</label><br>
                        <input name="passcf" type="password" class="inputcss" id="exampleInputPassword1" placeholder="Password Confirm" value="<%=passcf%>" required>
                    </div>
                    <div class="form-group">
                        <label >Họ và tên *</label><br>
                        <input name="name" type="text" class="inputcss" placeholder="Họ và tên" value="<%=name%>" required>
                    </div>
                    <div class="form-group">
                        <label >Số điện thoại *</label><br>
                        <input name="phone" type="text" class="inputcss" placeholder="Số điện thoại" value="<%=phone%>" required>
                    </div>
                    <div class="form-group">
                        <label >Địa chỉ *</label><br>
                        <input name="address" type="text" class="inputcss" placeholder="Địa Chỉ" value="<%=address%>" required>
                    </div>
                    <%if (!result.equals("")) {
                    %>
                    <p style="color: red"><%=result%> </p>
                    <%}%>
                    <button type="submit" class="btn btn-success mt-3 hov" style="padding: 8px 45px;border-radius: 20px">Đăng Ký</button>
                </form>           
            </div>

        </div>
        <%@ include file="footers.jsp"%>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
                   
                    $('.inputcss').click(function(){
                    $('.inputcss').css({
                        "border-bottom":"1px solid black",
                            "transform":"translateX(0px)"
                    });
                    $(this).css({"border-bottom":"1px solid green",
                            "transform":"translateX(20px)"
                        });
                    });
        </script>
    </body>
</html>
