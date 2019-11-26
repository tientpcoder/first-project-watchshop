<%-- 
    Document   : Productdetail
    Created on : Oct 22, 2019, 8:21:02 PM
    Author     : tientruong
--%>

<%@page import="model.ProductInfo"%>
<%@page import="model.Brand"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rabbit Watch</title>
        <%
            //Product p = (Product) request.getAttribute("product");
            ProductInfo pi = (ProductInfo) request.getAttribute("productInfo");
            Product p = pi.getProduct();
        %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jomolhari&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/home1.css">

        <link rel="stylesheet" type="text/css" href="css/prodetail2.css">
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/all.min.css">
        <style>
            ul.breadcrumb1 {
                padding: 10px 16px;
                list-style: none;
            }
            ul.breadcrumb1 li {
                display: inline;
                font-size: 18px;
            }
            ul.breadcrumb1 li+li:before {
                padding: 8px;
                color: black;
                content: "/\00a0";
            }
            ul.breadcrumb1 li a {
                color: grey;
                text-decoration: none;
            }
            ul.breadcrumb1 li a:hover {
                color: red;
                text-decoration: underline;
            }
        </style>

    </head>
    <body>

        <%@ include file="header.jsp" %>

        <br/>
        <div class="container top">
            <h3 style="text-align: center" class="grey"><%= p.getName()%></h3>
            <ul class="breadcrumb1 text-center">
                <li><a href="home">Trang Chủ</a></li>
                <li><a href="menwatch">Đồng Hồ Nam</a></li>
                <li><%=p.getId()%></li>
            </ul>
            <div class="row">
                <div class="col-9">
                    <div class="row">
                        <div class="col-6">
                            <img src="<%="image/" + p.getImage()%>">                           
                        </div>
                        <div class="col-6">
                            <p>THÔNG TIN SẢN PHẨM</p>
                            <p>Mã Số Sản Phẩm:<text  class="grey"><%=p.getId()%></text> </p>
                                <%
                                    Locale.setDefault(new Locale("vi", "VN"));
                                    NumberFormat format = NumberFormat.getCurrencyInstance(Locale.getDefault());
                                    String currency = format.format(p.getPrice());
                                %>
                            <h5 class="grey"> <%=currency%></h5>
                            <br/>
                            <p><%=p.getDescription()%></p>
                            <a class="far fa-play-circle" style="font-size: 50px;color: grey" href=""></a>
                            <br/>
                            <form action="Cart" method="post">
                                <input type="hidden" name="pid" value="<%=p.getId()%>" />
                                <input type="submit" value="THÊM VÀO GIỎ HÀNG" class="btn btn-success m-auto" id="addcart"/>
                            </form>
                            <br/>
                            <p style="text-align: center;">Gọi đặt mua: 0912700469 (7:30-21:30)</p>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div style="border: 1px solid black">
                        <h5 class="text-center pt-4">Thương Hiệu</h5>
                        <hr/>
                        <%Brand b = p.getBrand();%>
                        <img src="<%="image/" + b.getImage()%>" style="width: 100%;height: 175px">
                    </div>
                    <hr>
                    <p>VÌ SAO NÊN CHỌN CHÚNG TÔI?</p>
                    <hr>
                    <p>
                        <img src="image/chung-nhan1.png" style="height: 40px;width: 60px">
                        <span style="line-height: 1.6em;">Hoàn Lại Tiền Gấp 10 Lần Nếu Phát Hiện Hàng Giả - Hàng Nhái.</span> 
                    </p>
                    <p>
                        <img src="image/bao-hanh-5-nam1.png" style="height: 40px;width: 60px">
                        <span style="line-height: 1.6em;">Tăng Thêm Thời Gian Bảo Hành Lên Đến 5 Năm.</span> 
                    </p>
                    <p>
                        <img src="image/1-doi-12.png" style="height: 40px;width: 60px">
                        <span style="line-height: 1.6em;">Sai Kích Cỡ? Không Ưng Ý? Đổi Hàng Trong 7 Ngày.</span> 
                    </p>
                    <p>
                        <img src="image/thay-pin-mien-phi1.png" style="height: 40px;width: 60px">
                        <span style="line-height: 1.6em;">Thay Pin Miễn Phí Suốt Đời - Không Còn Lo Hết Pin Nữa.</span> 
                    </p>
                    <p>
                        <img src="image/cod1.png" style="height: 40px;width: 60px">
                        <span style="line-height: 1.6em;">Nhận Hàng & Trả Tiền - Ngay Tại Nhà Bạn. Hoàn Toàn Miễn Phí.</span> 
                    </p>
                    <p>
                        <img src="image/20-nam-kinh-nghiem1.png" style="height: 40px;width: 60px">
                        <span style="line-height: 1.6em;">Đến & Cảm Nhận Kinh Nghiệm Hơn 20 Năm Của Chúng Tôi.</span> 
                    </p>
                </div>
            </div>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">MÔ TẢ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">BẢO HÀNH & HẬU MÃI</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active mt-5 mb-5" id="home" role="tabpanel" aria-labelledby="home-tab">






                    <table class="table table-striped">

                        <tbody>
                            <tr>
                                <td class="left">Thương Hiệu</td>
                                <td><%=p.getBrand().getName()%></td>
                            </tr>

                            <tr>
                                <td class="left">Số Hiệu Sản Phẩm</td>
                                <td><%=p.getId()%></td>
                            </tr>

                            <tr>
                                <td class="left">Xuất Xứ</td>
                                <td><%=p.getBrand().getCountry()%></td>
                            </tr> 

                            <tr>
                                <td class="left">Kính</td>
                                <td><%=pi.getCrystal().getName()%></td>
                            </tr>

                            <tr>
                                <td class="left">Máy</td>
                                <td><%=pi.getMovement().getName()%></td>
                            </tr> 

                            <tr>
                                <td class="left">Bảo Hành</td>
                                <td>4 Năm 
                                    <%if (p.getBrand().getCountry().toString().trim().equalsIgnoreCase("Thụy Sỹ")) {%>
                                    -<span style="color: red;font-weight: bold;"> RED Guarantee</span>
                                    <%}%>
                                </td>
                            </tr> 

                            <tr>
                                <td class="left">Đường Kính Mặt Số</td>
                                <td><%=pi.getDial_size() + " mm"%></td>
                            </tr> 

                            <tr>
                                <td class="left">Bề Dày Mặt Số</td>
                                <td><%=pi.getDial_thickness() + " mm"%></td>
                            </tr> 

                            <tr>
                                <td class="left">Dây Đeo</td>
                                <td><%=pi.getStrap().getName()%></td>
                            </tr> 

                            <tr>
                                <td class="left">Chống Nước</td>
                                <td><%=pi.getAtm().getType()%></td>
                            </tr> 
                        </tbody>
                    </table>




                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"><p><span style="font-size: 14pt; font-family: 'courier new', courier, monospace;">Chế Độ Bảo Hành</span></p>
                    <p><strong><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Tất cả các đồng hồ khi bán ra đều kèm theo 2 phiếu bảo hành:</span></strong></p>
                    <ul style="list-style-type: square;">
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">1 Phiếu Bảo Hành (hoặc Thẻ Bảo Hành/Sổ Bảo Hành) của hãng có giá trị bảo hành Quốc tế (Thời gian bảo hành tùy theo quy định của từng hãng).</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">1 Phiếu Bảo Hành của Rabbit (Sử dụng để được thay pin miễn phí vĩnh viễn &amp; Hưởng chế độ bảo hành tăng thêm từ 1-4 năm của Rabbit).</span></li>
                    </ul>
                    <p><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;"><strong>Ví dụ:</strong> Đồng Hồ Citizen có chế độ bảo hành chính hãng: máy = 12 tháng, Pin = 12 tháng.</span></p>
                    <ul style="list-style-type: square;">
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Khi mua tại Rabbit, Khách hàng sẽ được tặng thêm thời gian bảo hành từ 4 năm về máy. Pin = Vĩnh Viễn.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Tổng cộng: Khi mua tại Rabbit, đồng hồ Citizen sẽ được bảo hành máy = 05 năm, Pin = Vĩnh Viễn.</span></li>
                    </ul>
                    <p><strong><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Lưu ý:</span></strong></p>
                    <ul style="list-style-type: square;">
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Đối với sản phẩm còn trong thời gian bảo hành Quốc Tế: Quý khách có thể đem tới Rabbit hoặc bất kỳ nhà trung tâm bảo hành nào của hãng được ghi trên phiếu để yêu cầu được kiểm tra đồng hồ.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Đối với sản phẩm hết thời gian bảo hành Quốc Tế nhưng vẫn trong thời gian bảo hành tại Rabbit: Quý khách đem đồng hồ kèm Phiếu Bảo Hành của Rabbit tới bất kỳ chi nhánh nào của Rabbit để được hướng dẫn và kiểm tra đồng hồ.</span></li>
                    </ul>
                    <p><strong><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Điều Kiện Được Bảo Hành</span></strong></p>
                    <ul style="list-style-type: square;">
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Bảo hành chỉ có giá trị khi đồng hồ có Phiếu bảo hành của hãng &amp; Phiếu bảo hành của Rabbit đi kèm, điền chính xác, đầy đủ các thông tin.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Phiếu bảo hành phải còn nguyên vẹn, không rách, chấp vá, hoen ố, mờ nhạt.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Còn trong thời gian bảo hành. Thời gian bảo hành được tính từ ngày mua có ghi trên Phiếu Bảo Hành.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Chỉ bảo hành thay thế mới cho những linh kiện, phụ tùng bị hỏng – không thay thế bằng một chiếc đồng hồ khác.</span></li>
                    </ul>
                    <p><strong><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Điều Kiện Không Được Bảo Hành</span></strong></p>
                    <ul style="list-style-type: square;">
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Đồng hồ không có Phiếu bảo hành của hãng và Phiếu bảo hành của Rabbit đi kèm.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Các loại dây đeo, khoá, vỏ, màu xi, mặt số, mặt kiếng bị hỏng hóc, vỡ do sử dụng không đúng, tai nạn, lão hóa tự nhiên, va đập, … trong quá trình sử dụng.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Hỏng hóc do hậu quả gián tiếp của việc sử dụng sai hướng dẫn của hãng có kèm theo đồng hồ.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Trầy xước về dây hoặc mặt kiếng bị trầy xước, vỡ do va chạm trong quá trình sử dụng. </span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Tự ý thay đổi máy móc bên trong, mở ra can thiệp sửa chữa trong thời gian còn bảo hành – Tại những nơi không phải là trung tâm của hãng</span></li>
                    </ul>
                    <p><strong><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Chế Độ Bảo Hành RED GUARANTEE</span></strong></p>
                    <ul style="list-style-type: square;">
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Tăng thêm 1-2 năm bảo hành tại Rabbit ngoài chế độ bảo hành Quốc Tế của hãng để có tổng thời gian là 4 năm.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Ưu tiên bảo hành – Đồng hồ sẽ được xếp vào danh sách ưu tiên bảo hành để nhanh chóng quay lại với Quý khách.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Giao nhận đồng hồ bảo hành ngay tại nhà Quý khách.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Cập nhật tình trạng đồng hồ qua điện thoại tới Quý khách. Quý khách được tư vấn, cập nhật tình trạng đồng hồ trong quá trình đồng hồ được bảo hành.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">4 năm đánh bóng đồng hồ miễn phí.</span></li>
                    </ul>
                    <p><span style="font-family: 'courier new', courier, monospace; font-size: 14pt;">Chính Sách Đổi Hàng</span></p>
                    <p><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Trong vòng 7 ngày kể từ ngày mua hàng từ Đồng Hồ Rabbit, Quý khách có thể yêu cầu đổi hàng hoàn toàn miễn phí. Thời hạn 7 ngày được tính theo dấu bưu điện khi Quý khách gửi sản phẩm về cho chúng tôi hoặc thời gian chúng tôi tiếp nhận yêu cầu trực tiếp (tại cửa hàng) của Quý khách.</span></p>
                    <ul style="list-style-type: square;">
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Yêu cầu đổi hàng cần được thực hiện trong vòng 7 ngày kể từ ngày Quý khách nhận được hàng.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Sản phẩm không có dấu hiệu đã qua sử dụng (còn đầy đủ keo dán bảo vệ chống trầy xước mặt đồng hồ, nắp đáy, dây..)</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Sản phẩm không bị dây bẩn, trầy xước, hư hỏng, dính hoá chất hoặc có dấu hiệu cạy mở.</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Các bộ phận, linh kiện, phụ kiện, tài liệu hướng dẫn sử dụng, tài liệu kỹ thuật, quà tặng kèm theo (nếu có), … </span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">Hộp đựng, bao bì đóng gói sản phẩm còn nguyên vẹn, không bị móp, rách, ố vàng, …</span></li>
                        <li><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">C</span><span style="font-family: verdana, geneva, sans-serif; font-size: 10pt;">hỉ chấp nhận đổi 1 lần duy nhất tính từ ngày mua sản phẩm.</span></li>
                    </ul></div>
                <hr>

            </div>
            <p>SẢN PHẨM LIÊN QUAN</p>
            <hr>
            <div class="container pb-4">  

                <!--Carousel Wrapper-->
                <div id="carouselExampleIndicators"  class="carousel slide carousel-multi-item" data-ride="carousel">

                    <!--/.Controls-->
                    <div class="controls-top">
                        <a style="position:absolute;top:20%;z-index:100;left:-30px;color: black" href="#multi-item-example" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
                        <a  style="position:absolute;top:20%;z-index:100;right:-30px;color: black" href="#multi-item-example" data-slide="next"><i class="fa fa-chevron-right"></i></a>
                    </div>

                    <!--Indicators-->
                    <ol class="carousel-indicators">
                        <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
                        <li data-target="#multi-item-example" data-slide-to="1"></li>
                    </ol>
                    <!--/.Indicators-->

                    <!--Slides-->
                    <div class="carousel-inner" role="listbox">

                        <!--First slide-->
                        <div class="carousel-item active" style="height: auto">

                            <div class="row">
                                <div class="col-3">
                                    <div class="card mb-2">
                                        <img class="card-img-top" src="image/anh1.jpg"
                                             alt="">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4 class>ok</h4>
                                                <h4 class="card-name text-primary">ok</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="card mb-2">
                                        <img class="card-img-top" src="image/anh1.jpg"
                                             alt="">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4 class>ok</h4>
                                                <h4 class="card-name text-primary">ok</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="card mb-2">
                                        <img class="card-img-top" src="image/anh1.jpg"
                                             alt="">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4 class>ok</h4>
                                                <h4 class="card-name text-primary">ok</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="card mb-2">
                                        <img class="card-img-top" src="image/anh1.jpg"
                                             alt="">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4 class>ok</h4>
                                                <h4 class="card-name text-primary">ok</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <!--/.First slide-->

                        <!--Second slide-->
                        <div class="carousel-item" style="height: auto">

                            <div class="row">
                                <div class="col-3">
                                    <div class="card mb-2">
                                        <img class="card-img-top" src="image/anh1.jpg"
                                             alt="">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4 class></h4>
                                                <h4 class="card-name text-primary"></h4>
                                            </div>
                                            <div class="card-text">
                                                <p class="text-danger"></p>
                                                <p></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="card mb-2">
                                        <img class="card-img-top" src="image/anh1.jpg"
                                             alt="p">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4 class></h4>
                                                <h4 class="card-name text-primary"></h4>
                                            </div>
                                            <div class="card-text">
                                                <p class="text-danger"></p>
                                                <p></p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="card mb-2">
                                        <img class="card-img-top" src="image/anh1.jpg"
                                             alt="">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4 class></h4>
                                                <h4 class="card-name text-primary"></h4>
                                            </div>
                                            <div class="card-text">
                                                <p class="text-danger"></p>
                                                <p></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="card mb-2">
                                        <img class="card-img-top" src="image/anh1.jpg"
                                             alt="">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4 class></h4>
                                                <h4 class="card-name text-primary"></h4>
                                            </div>
                                            <div class="card-text">
                                                <p class="text-danger"></p>
                                                <p></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--/.Second slide-->

                        <!--/.Slides-->

                    </div>
                    <!--/.Carousel Wrapper-->

                </div>
            </div>
        </div>




            <%@ include file="footers.jsp"%>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
