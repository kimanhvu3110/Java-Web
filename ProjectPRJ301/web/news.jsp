<%-- 
    Document   : news
    Created on : Mar 11, 2022, 3:53:00 PM
    Author     : black
--%>

<%@page import="models.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap
              /4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome
              /4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>News</title>
        <style>
            *{
                margin: 0px;
                padding: 0px;
            }
            #back{
                overflow-y:auto;
                background-image:url(image/demoWeb.png);
                background-repeat:no-repeat;
                background-attachment:fixed;
            }
            h1{
                font-size: 19px;
            }
            .end{
                background-color: tan;
                width: 100%;
                height: 100px;
            }
            .endText{
                margin-left: 400px;
                font-size: 15px;
            }
            .div121 a{
                color: black;
                font-family: Maven Pro Bold;
                font-size: 21px ;
                font-weight: 600;
            }
            .divs a{
                color: black;
                font-family: Maven Pro Bold;
                font-size: 21px ;
                font-weight: 600;
            }
            #navi {
                margin-top: 50px;
                margin-left: 170px;

            }
            #navi a{
                color: darkgoldenrod;
                font-weight: 600;
                font-size: 18px;
            }
            #save{
                margin-left: 800px;
                color: black;
                margin-bottom: -30px;
                text-decoration: none;
                text-align: center;
                padding: 5px;
                border: 1px solid pink;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
                border-radius: 10px;
                background-color: tan;
            }
            #save.active{
                color: white;
                text-decoration: line-through;
            }


        </style>
        <%
            News current = (News) request.getAttribute("currentNew");
            String check = request.getAttribute("checkSave").toString();
        %>
    </head>
    <body>
        <div id="back">
            <div style="margin-top: 20px;">
                <% if (session.getAttribute("account") != null) {%>
                <%@include file="homeBarTwo.jsp" %>
                <% } else {%>
                <%@include file="homeBarnone.jsp" %>
                <%}%>
            </div>
            <div id="navi"><a href="Home">Home</a>&emsp;>&emsp;<a href="category?cid=<%= current.getCategory().getId()%>"><%= current.getCategory().getName()%> </a>
                &emsp;>&emsp;<a href="news?id=${idNew}">Bài báo</a>           
            </div>

            <div style="width: 80%; margin-left: 170px; margin-top: 40px;">
                <h1 style="word-wrap: break-word; font-size: 27px;">${currentNew.title}</h1><br>
                <div id="save"><span class="fa fa-bookmark" aria-hidden="true" style="margin-right: 10px; color: darkred;"></span>
                    <% if (check.equals("yes") == false) { %>
                    <a style="color: black;" href="saveNews?id=${idNew}">Lưu bài viết</a>
                    <% } else { %>
                    <a style="color: black; width: 50%;">Đã lưu</a>
                    <% }%></div>
                <img src="image/${currentNew.image}" style="width: 50%; margin-left: 150px;" alt="${currentNew.title}"><br><br>
                <p style="word-wrap: break-word; font-family: sans-serif; font-family: Times New Roman; font-weight: 600;" >${currentNew.description}</p><br>         
                <pre style="word-wrap: break-word; width:100%; font-size: 16px; font-family: Times New Roman">${currentNew.content}</pre>
                <img src="image/${currentNew.imageC}" style="width: 50%; margin-left: 150px;" alt="${currentNew.title}"><br><br>
            </div>
            <%@include file="backpage.jsp" %>
        </div>
    </body>
</html>
