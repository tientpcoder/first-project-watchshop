<%-- 
    Document   : EditProduct
    Created on : Nov 2, 2019, 11:32:43 PM
    Author     : tientruong
--%>

<%@page import="model.ATM"%>
<%@page import="model.DialShape"%>
<%@page import="model.Movement"%>
<%@page import="model.Crystal"%>
<%@page import="model.Strap"%>
<%@page import="model.Brand"%>
<%@page import="model.Categories"%>
<%@page import="model.ProductInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa sản phẩm</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/all.min.css">
        <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
        <meta charset=utf-8 />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
        <%
            ProductInfo pin = (ProductInfo) request.getAttribute("pin");
            ArrayList<Categories> cates = (ArrayList<Categories>) request.getAttribute("cates");
            ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("brands");
            ArrayList<Strap> straps = (ArrayList<Strap>) request.getAttribute("straps");
            ArrayList<Crystal> crystals = (ArrayList<Crystal>) request.getAttribute("crystals");
            ArrayList<Movement> movements = (ArrayList<Movement>) request.getAttribute("movements");
            ArrayList<DialShape> dialShapes = (ArrayList<DialShape>) request.getAttribute("dialShapes");
            ArrayList<ATM> atms = (ArrayList<ATM>) request.getAttribute("atms");
            String pid = "", pname = "", pquan = "", pprice = "", CateId = "", BrandID = "", StrapID = "", CrysID = "", MoveID = "", DSID = "", dials = "", dialt = "";
        %>
        <style>
            .inputstyle{
                outline: none;
                border: none;
                border-bottom:1px solid black;
                padding:0 0 5px 0;
                transition: .3s;
            }
            span,input,select,textarea{
                margin: 10px 0;
                font-family: 'Open Sans', sans-serif;
            }
            span{
                font-weight: bold;
            }
            form{
                box-shadow: 0px 0px 6px 2px rgba(201,199,201,1);
                border-radius: 20px;
                margin: 50px 0;
                padding: 30px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h3 class="text-center mt-5">Thông Tin Sản Phẩm</h3>
            <form action="EditProduct" method="post" enctype="multipart/form-data">

                <div class="container">
                    <div class="row">

                        <div class="col-8">

                            <span>Mã Sản Phẩm: </span>
                            <span style="color:skyblue"><%= pin.getProduct().getId()%></span>
                            <input type="hidden" name="pid" value="<%= pin.getProduct().getId()%>" />
                            <br>

                            <span>Tên Sản Phẩm: </span><br>
                            <input type="text" class="inputstyle" style="width:90%;" name="pname" value="<%= pin.getProduct().getName()%>" />
                            <br>

                            <span>Số Lượng: </span>
                            <input min="0" style="width:50px" type="number" name="quantity" value="<%= pin.getProduct().getQuantity()%>" />
                            <br>

                            <span>Giá: </span><br>
                            <input  type="text" class="inputstyle" name="price" value="<%= pin.getProduct().getPrice()%>" />
                            <br>
                            <span>Discount: </span><br>
                            <input type="number" class="inputstyle" min="0" name="discount" value="<%= pin.getProduct().getDiscount()%>" />
                            <br>
                            <select name="cateid"class="inputstyle" > 
                                <% for (Categories c : cates) {
                                %>
                                <option 
                                    <%=(c.getId() == pin.getProduct().getCate().getId()) ? "selected" : ""%>
                                    value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%}%>
                            </select>
                            <br>
                            <span>Hãng: </span><br>
                            <select name="bid" class="inputstyle" > 
                                <% for (Brand b : brands) {
                                %>
                                <option 
                                    <%=(b.getId() == pin.getProduct().getBrand().getId()) ? "selected" : ""%>
                                    value="<%=b.getId()%>"><%=b.getName()%></option>
                                <%}%>
                            </select>
                            <br>
                            <span>Loại Dây: </span><br>
                            <select name="strapid" class="inputstyle" > 
                                <% for (Strap c : straps) {
                                %>
                                <option 
                                    <%=(c.getId() == pin.getStrap().getId()) ? "selected" : ""%>
                                    value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%}%>
                            </select>
                            <br>
                            <span>Loại Mặt Kính: </span><br>
                            <select name="crysid" class="inputstyle" > 
                                <% for (Crystal c : crystals) {
                                %>
                                <option 
                                    <%=(c.getId() == pin.getCrystal().getId()) ? "selected" : ""%>
                                    value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%}%>
                            </select>
                            <br>
                            <span>Loại Máy: </span><br>
                            <select name="moveid" class="inputstyle" > 
                                <% for (Movement c : movements) {
                                %>
                                <option 
                                    <%=(c.getId() == pin.getMovement().getId()) ? "selected" : ""%>
                                    value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%}%>
                            </select>
                            <br>
                            <span>Hình Dạng Mặt Số: </span><br>
                            <select name="dsid" class="inputstyle" > 
                                <% for (DialShape c : dialShapes) {
                                %>
                                <option 
                                    <%=(c.getId() == pin.getDialShape().getId()) ? "selected" : ""%>
                                    value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%}%>
                            </select>
                            <br>
                            <span>Mức Chống Nước: </span> <br>
                            <select name="atmid" class="inputstyle" > 
                                <% for (ATM c : atms) {
                                %>
                                <option 
                                    <%=(c.getId() == pin.getAtm().getId()) ? "selected" : ""%>
                                    value="<%=c.getId()%>"><%=c.getType()%></option>
                                <%}%>
                            </select>
                            <br>
                            <span>Đường Kính Mặt Số: </span><br>
                            <input type="text" style="width:35px" class="inputstyle" name="dialsize" value="<%= pin.getDial_size()%>" />mm
                            <br>
                            <span>Bề Dày Mặt Số: </span><br>
                            <input type="text" style="width:40px" class="inputstyle" name="dialthick" value="<%= pin.getDial_thickness()%>" />mm

                            <br>
                            <span class="mt-3" style="display:block">Description</span>
                            <br>
                            <textarea name="Description" class="inputstyle" cols="90" rows="6" placeholder="Description...." > <%=pin.getProduct().getDescription()%> </textarea>
                            <input type="submit" class="btn btn-outline-success" value="Save" />
                        </div>

                        <div class="col-4">
                            <img id="blah" style="width: 100%;" src="image/<%=pin.getProduct().getImage()%>" alt="your image" />
                            <input type='file' encType="multipart/form-data" name="image" value="" onchange="readURL(this);" />
                            <script>

                                function readURL(input) {
                                    if (input.files && input.files[0]) {
                                        var reader = new FileReader();

                                        reader.onload = function (e) {
                                            $('#blah')
                                                    .attr('src', e.target.result)
                                                    .width(500)
                                                    .height(500);
                                        };

                                        reader.readAsDataURL(input.files[0]);
                                    }
                                }

                            </script>

                        </div>


                    </div>
                </div>


            </form>
        </div>
        <script>

            $('.inputstyle').click(function () {
                $('.inputstyle').css({
                    "border-bottom": "1px solid black",
                });
                $(this).css({"border-bottom": "1px solid green",
                });
            });
        </script>
    </body>
</html>
