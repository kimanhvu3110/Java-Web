<%-- 
    Document   : myWall
    Created on : Mar 16, 2022, 9:41:22 PM
    Author     : black
--%>

<%@page import="models.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap
              /4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome
          /4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                background-image: url(image/cool.png);
                font-size: 16px;
            }
            #back{
                overflow-y:auto;
                background-image:url(image/demoWeb.png);
                background-repeat:no-repeat;
                background-attachment:fixed;
            }

            .title{
                font-family: sans-serif;
            }
            .image{
                width: 70px;
            }
            .new{
                margin-left: 550px;
                margin-bottom: -20px;
            }
            #infor{
                width: 50%;
                padding: 20px;
                margin-top: 30px;
                margin-left: 480px;
            }
            #infor.small{
                margin-left: 350px;
            }
            h1{
                margin-top: 30px;
                margin-bottom: 30px;
                font-family: Times New Roman;
                text-align: center;
                padding: 0px;
                border: 1px solid pink;
                width: 80%;
                font-size: 19px;
                margin-left: 300px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: tan;
            }
            .divs a{
                color: black;
                font-family: Maven Pro Bold;
                font-size: 21px ;
                font-weight: 600;
            }
            .divs h2{
                font-size: 21px;
                font-family: Maven Pro Bold;
                font-weight: 600;
            }
            .divs{
                margin-left: 100px;
                margin-bottom: 30px;
                width: 450px;
            }
            .img3{
                width: 70%;
            }
        </style>
        <%
            ArrayList<News> listN = (ArrayList<News>) request.getAttribute("listOne");
        %>
    </head>
    <body>
        <div id="back" >
            <div>
                <img src="image/baee.png" style="margin-top:-185px; width: 150px; margin-bottom: -300px; margin-left: 330px;">
                <p class="new" style="font-size: 50px;">Mình Đẹp</p>
                <p class="new" style="color: red; font-size: 15px; margin-left: 750px; margin-top: 7px;">NEWS</p>
            </div>
            
            <div style="margin-top: 50px;">              
                <%@include file="homeBarTwo.jsp" %>              
            </div>
            
            <div id="infor">
                <span style="color: cadetblue; font-size: 50px; margin-bottom: -50px;" class="fa fa-user-o" aria-hidden="true"></span>
                 <p class="small"><strong>Tài khoản:</strong> ${sessionScope.account.username}</p>
                 <p class="small"><strong>Email:</strong>    ${sessionScope.emailS}</p>
            </div>
            
            <div class="divs">
                <h1>${mess}</h1>
                <% for (News s : listN) {%>
                <h2><a href="news?id=<%= s.getId()%>"><%= s.getTitle()%></a></h2>                
                <button><a style="text-decoration: none; font-size: 14px;" href="notSave?nid=<%= s.getId()%>">Bỏ lưu bài viết</a></button>
                <br><hr>
                <% }%>
            </div>
        </div>
            <%@include file="backpage.jsp" %>
    </body>
</html>
