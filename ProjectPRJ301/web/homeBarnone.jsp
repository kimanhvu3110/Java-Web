<%-- 
    Document   : homeBarnone
    Created on : Mar 4, 2022, 3:46:22 PM
    Author     : black
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="models.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300&family=Markazi+Text&family=Rokkitt:wght@100&display=swap" rel="stylesheet">
    <%
        ArrayList<Category> list = (ArrayList<Category>) request.getAttribute("listCate");
        ArrayList<Category> list2 = (ArrayList<Category>) request.getAttribute("listCa");
    %>
    <style>
        *{
            margin: 0;
            padding: 0;

        }
        .header{
            position: relative;
            left: 0px;
            right: 0px;
            top: 0px;
            height: 80px;
            background-color: tan;           
        }
        #s1{
            color: black;
            text-decoration: none;
            position: relative;
            font-size: 21px;
            font-weight: bold;
            font-style: normal;
            font-family: 'Rokkitt', serif;
        }
        #s1:active{
            color: white;
            text-decoration: none;
        }

        #s2{
            color: black;
            text-decoration: none;
            position: relative;
            font-size: 21px;
            font-weight: bold;
            font-style: normal;
            font-family: 'Rokkitt', serif;
            left: 30px;
        }
        #s2:active{
            color: white;
            text-decoration: none;
        }

        #s3{
            color: black;
            text-decoration: none;
            position: relative;
            font-size: 21px;
            font-weight: bold;
            font-style: normal;
            font-family: 'Rokkitt', serif;
            left: 60px;
        }
        #s3:active{
            color: white;
            text-decoration: none;
        }

        #s4{
            color: black;
            text-decoration: none;
            position: relative;
            font-size: 21px;
            font-weight: bold;
            font-style: normal;
            font-family: 'Rokkitt', serif;
            left: 80px;
        }
        #s4:active{
            color: white;
            text-decoration: none;
        }

        #s5{
            color: black;
            position: relative;
            font-size: 21px;
            font-weight: bold;
            font-style: normal;
            font-family: 'Rokkitt', serif;
            left: 350px;
        }
        #s5:active{
            color: white;           
        }

        #s6{
            color: black;
            position: relative;
            font-size: 21px;
            font-weight: bold;
            font-style: normal;
            font-family: 'Rokkitt', serif;
            left: 400px;
        }
        #s6:active{
            color: white;           
        }
        .dropbtn {
            background-color: tan;
            color: black;
            font-weight: bold;
            padding: 16px;
            font-size: 21px;
            border: none;
            cursor: pointer;
        }

        /* Dùng trong <div> để định vị nội dung thả xuống */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: bisque;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }


        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }


        .dropdown-content a:hover {
            background-color: burlywood;
            color: white;
            font-size: 16px;
        }


        .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropfont{
            font-size: 15px;
        }


        .dropdown:hover .dropbtn {
            background-color: moccasin;
        </style>       
        <div class="header">
            <a id="image" href="http://localhost:8080/ProjectPRJ301/Home">
                <img src="image/bae.png" style="margin-left: 20px; width: 142px; top: 50px;">
            </a>
            <a id="s1" href="Home">Trang Chủ</a>

            <div id="s2" class="dropdown">
                <button class="dropbtn">Tin Tức</button>
                <div class="dropdown-content">
                    <% for (Category a : list) {%>
                    <a class="dropfont" href="category?cid=<%= a.getId()%>"><%= a.getName()%></a>
                    <% }%>
                </div>
            </div>

            <div id="s3" class="dropdown">
                <button class="dropbtn">Làm Đẹp</button>
                <div class="dropdown-content">
                    <% for (Category a : list2) {%>
                    <a class="dropfont" href="category?cid=<%= a.getId()%>"><%= a.getName()%></a>
                    <% }%>
                </div>
            </div>

            <a id="s4" href="kinhNguyetCuaToi">"Bà Dì" topic</a>
            <a id="s5" href="http://localhost:8080/ProjectPRJ301/login">Đăng Nhập</a>
            <a id="s6" href="http://localhost:8080/ProjectPRJ301/logUp">Đăng Ký</a>
            <a id="Loicon" style=" position:relative; margin-left: 150px; " ><span class="fa fa-user-circle-o" aria-hidden="true" ></span></a>
        </div>              
    </div>
