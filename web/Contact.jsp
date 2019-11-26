<%-- 
    Document   : Contact
    Created on : Oct 29, 2019, 7:35:58 PM
    Author     : tientruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Contact</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jomolhari&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/home1.css">
        <link rel="stylesheet" type="text/css" href="css/all.min.css">
        <style>
            .in{
                outline: none;
                border: none;
                border-bottom: 1px solid gray;
                padding: 5px 0;
                width: 100%;
            }
            *{
                font-family: SF Pro Display;
               
            }
            .lbl{
                font-size: 20px;
                margin-left: 3px;
                 font-weight: bold;
            }
            .title{
                font-family: SF Pro Display;
                font-weight: 800;
            }
            .nut{
                margin: auto;
                display: block;
                width: 40%;
                padding: 7px 0;
                border-radius: 20px !important;
            }
        </style>
    </head>
    <body>
        <%@ include file="admin_header.jsp" %>
        <div class="container" style="margin-top:100px;margin-bottom: 100px">
            <div class="row">
                <div class="col-7">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.482445565967!2d105.52510551533649!3d21.01337369367831!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b32ca5086d%3A0xa3c62e29d8ab37e4!2sFPT%20University!5e0!3m2!1sen!2s!4v1572794047501!5m2!1sen!2s" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                </div>
                <div class="col-5">
                    <form method="post" action="ShopContact" class="pt-5">
                <h1 class="title " >Contact</h1>
                <label class="lbl mt-3">Shop Name</label><br>
                    <input name="name" type="text" class="in" value="${requestScope.contact.name}" />
                    <br>
                    <label class="lbl mt-3">Address</label><br>
                    <input name="address" type="text" class="in" value="${requestScope.contact.address}" />
                    <br>
                    <label class="lbl mt-3">HotLine</label><br>
                    <input name="hotline" type="text" class="in" value="${requestScope.contact.hotline}" />
                    <br>
                    <label class="lbl mt-3">Email</label><br>
                    <input name="email" type="email" class="in" value="${requestScope.contact.email}" />
                    <br>
                    <label class="lbl mt-3">FaceBook</label><br>
                    <input name="fb" type="text" class="in" value="${requestScope.contact.fb}" />
                    <br>
                    <label class="lbl mt-3">Youtube</label><br>
                    <input name="yt" type="text" class="in" value="${requestScope.contact.yt}" />
                    <br>
                    <label class="lbl mt-3">Map</label><br>
                    <input name="map" type="text" class="in" value="${requestScope.contact.map}" />
                    <br>
                    <input type="submit" class="btn btn-outline-success nut mt-5 "value="Lưu" style="margin: auto;display: block;"/>
                </form>
                </div>
            </div>
        </div>
    </body>
</html>
