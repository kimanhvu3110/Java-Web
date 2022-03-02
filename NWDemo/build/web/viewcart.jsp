<%-- 
    Document   : viewcart
    Created on : Feb 19, 2022, 11:09:41 AM
    Author     : black
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String mess = request.getAttribute("mess").toString();
        %>
        <style>
            #order{
                margin-left: 400px;
                width: 150px;
                text-decoration: none;
                text-align: center;
                padding: 10px;
                border: 1px solid pink;
                background-color: antiquewhite;
            }
        </style>
    </head>
    <body>
        <div>
            <div style="margin-left: 440px; margin-bottom: -150px; margin-top: 100px; ">
                <h1><%=mess%></h1>
                <div id="order">
                    <span style="color: indianred"><i class="fa fa-handshake-o" aria-hidden="true"></i></span>
                &emsp;<a style="text-decoration: none" href="order">Order product</a>
                </div>
            </div>
        <%@include file="categoryList.jsp"%>
        <%@include file="productsList.jsp"%>
                 
        </div>
    </body>
</html>
