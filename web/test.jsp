<%-- 
    Document   : test
    Created on : Nov 5, 2019, 3:21:05 PM
    Author     : tientruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.css" rel="stylesheet">
        <!-- MDBootstrap Datatables  -->
        <link href="css/datatables.min.css" rel="stylesheet">
        <style>
            table.dataTable thead .sorting:after,
            table.dataTable thead .sorting:before,
            table.dataTable thead .sorting_asc:after,
            table.dataTable thead .sorting_asc:before,
            table.dataTable thead .sorting_asc_disabled:after,
            table.dataTable thead .sorting_asc_disabled:before,
            table.dataTable thead .sorting_desc:after,
            table.dataTable thead .sorting_desc:before,
            table.dataTable thead .sorting_desc_disabled:after,
            table.dataTable thead .sorting_desc_disabled:before {
                bottom: .5em;
            }
        </style>
    </head>
    <body>
        <div class="form-check">
    <input type="checkbox" class="form-check-input" id="materialUnchecked">
    <label class="form-check-label" for="materialUnchecked">Material unchecked</label>
</div>
<!--        <table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
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
                            <c:set var = "dem" scope = "session" value = "${dem+1}"/>
                            <c:if test = "${dem >= requestScope.pfrom && dem <= requestScope.pto}">
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
                                        <a href="EditProduct?pid=${p.product.id}"> <i class="fas fa-edit"></i></a> 
                                        <a class="ml-2" href=""><i class="fas fa-times-circle"></i></a> 

                                    </td>
                                </tr>

                            </c:if>

                        </c:forEach>
                
                
                
                
            </tbody>
            <tfoot>
                <tr>
                    <th >ID</th>
                    <th >Name</th>
                    <th >Ảnh</th>
                    <th>Danh Mục</th>
                    <th >Hiển Thị</th>
                    <th >Số Lượng</th>
                    <th >Tác Vụ</th>
                </tr>
            </tfoot>
        </table>-->
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
