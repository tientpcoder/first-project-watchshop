<%-- 
    Document   : admin_home
    Created on : Oct 29, 2019, 10:22:44 AM
    Author     : tientruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jomolhari&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/home1.css">
        <link rel="stylesheet" type="text/css" href="css/all.min.css">
    </head>
    <body>
        <%@ include file="admin_header.jsp" %>
        <h1  class="mt-5 text-center">Wellcome Admin ${requestScope.admin.name}</h1>
        <div class="container mt-5" style="border: 1px solid black;width: 700px; height: 300px;">
            
            <div class="mt-5">
                <h3>Nếu cần hỗ trợ kỹ thuật quý khách vui lòng liên hệ: </h3>
            <ul>
                
                <h5 class="mt-5"><li>Gửi yêu cầu vào email: <text style="color: red">tientp@gmail.com</text></li></h5>
                <h5 class="mt-5"><li>Gọi số Hotline: <text style="color: red">0868657733</text></li></h5>
                
            </ul>
                
            </div>
            
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
