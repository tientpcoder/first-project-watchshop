<%-- 
    Document   : QuanLySanPham
    Created on : Oct 29, 2019, 1:31:32 PM
    Author     : tientruong
--%>

<%@page import="ulti.HtmlHelper2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Sản Phẩm</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jomolhari&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jomolhari&display=swap" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="css/home1.css">
        <link rel="stylesheet" type="text/css" href="css/all.min.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.css" rel="stylesheet">
        <!-- MDBootstrap Datatables  -->
        <link href="css/datatables.min.css" rel="stylesheet">
        <script>
            function submitForm()
            {
                document.getElementById("searchFrm").submit();
            }

        </script>
        <%
            Integer pageindex = (Integer) request.getAttribute("pageindex");
            Integer pagecount = (Integer) request.getAttribute("pagecount");
            Integer pfrom = (Integer) request.getAttribute("pfrom");
            Integer pto = (Integer) request.getAttribute("pto");
            String pid = (String) request.getAttribute("pid");
        %>
        <style>
            table{
                text-align: center
            }
            *{
                font-size: 16px;
                font-weight: bold;
                font-family: 'Jomolhari', serif;

            }
            .row{
                margin: 0 !important;
            }
            .edit{
                padding: 3px 10px;
                background: #169ad0;
                color:white!important;
                border-radius: 8px;
                font-weight: 200;
            }
            .delete{
                padding: 3px 10px;
                background: #c70d0d;
                color:white!important;
                border-radius: 8px;
                font-weight: 200;
            }
        </style>
    </head>
    <body>
        <%@ include file="admin_header.jsp" %>
        <div class="mb-5" >
            <h3 class="table mt-5 text-center mb-3">Danh Mục Sản Phẩm</h3>
            <span class="table-add float-right mr-4" style="margin-top:6px;margin-left: 200px;"><a href="#!" class="text-success"><i class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
            <form id="searchFrm" action="QLSP" method="post">
                <table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="th-sm">ID</th>
                            <th class="th-sm">Name</th>
                            <th class="th-sm">Ảnh</th>
                            <th class="th-sm">Danh Mục</th>
                            <th class="th-sm">Hiển Thị</th>
                            <th class="th-sm">Số Lượng</th>
                            <th class="th-sm">Tác Vụ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var = "dem" scope = "session" value = "${0}"/>
                        <c:forEach items="${requestScope.PiList}" var="p">
                           
                                <tr>
                                    <td>
                                        ${p.product.id}
                                    </td>
                                    <td>
                                        ${p.product.name}
                                    </td>
                                    <td>
                                        <img style="height: 60px;width: 60px;" src="image/${p.product.image}" />
                                    </td>
                                    <td>
                                        ${p.product.cate.name}

                                    </td>
                                    <td>         
                                        
                        <input name="status${p.product.id}" value="${p.product.id}" onchange="submitForm();" 
                                               type="checkbox" ${ (p.product.status eq true)?"checked":"" } />        
                        
                   
                                    </td>
                                    <td>
                                        <c:choose>

                                            <c:when test = "${p.product.quantity > 0}">
                                                ${p.product.quantity}
                                            </c:when>

                                            <c:otherwise>
                                                <span style="color: red;font-weight: 700" >HẾT HÀNG</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="EditProduct?pid=${p.product.id}" class="edit">Edit</a>
                                        <a  href="" class="delete">Delete</a>                                
                                    </td>
                                </tr>

                        
                        </c:forEach>
                    </tbody>
                </table>
            </form>

        </div>
       <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- MDBootstrap Datatables  -->
        <script type="text/javascript" src="js/addons/datatables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#dtBasicExample').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>
    </body>
</html>
