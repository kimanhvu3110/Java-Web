<%-- 
    Document   : home
    Created on : Mar 4, 2022, 10:33:54 AM
    Author     : black
--%>
<%@page import="models.Account"%>
<%@page import="models.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo Mình Đẹp</title>
        <link rel="shortcut icon" type="image/png" href="image/favi.png"/>  
        <%
            ArrayList<News> list3 = (ArrayList<News>) request.getAttribute("listNew");           
            int i = 3;
        %>
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
            .div121{


            }
            .div1211{
                margin-top: -500px;
                margin-left: 80px;
                width: 400px;
            }

            .div1212{
                width: 360px;
                margin-top: -470px;
                margin-left: 500px;
            }
            .img2 {
                width: 90%;
                height: 270px;
            }
            #right {
                width: 300px;
                margin-left: 870px;
                margin-top: 50px;
                border: 0px solid #000;
                padding-left:18px;
            }
            #right2{
                width: 200px;
                margin-left: 870px;
                margin-top: 200px;
                border: 0px solid #000;
                padding-left:18px;
            }
            .div1211 h2{
                font-size: 21px;
                font-family: Maven Pro Bold;
                font-weight: 600;
                color: black;
            }
            .div1212 h2{
                font-size: 21px;
                font-family: Maven Pro Bold;
                font-weight: 600;
            }
            .div1212 h3{
                font-size: 21px;
                font-family: Maven Pro Bold;
                font-weight: 600;
            }
            .divs h2{
                font-size: 21px;
                font-family: Maven Pro Bold;
                font-weight: 600;
            }
            .divs{
                margin-left: 80px;
                width: 450px;
            }
            .img3{
                width: 70%;
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

        </style>
    </head>
    <body>        
        <div id="back" >
            <div>
                <img src="image/baee.png" style="margin-top:-185px; width: 150px; margin-bottom: -300px; margin-left: 330px;">
                <p class="new" style="font-size: 50px;">Mình Đẹp</p>
                <p class="new" style="color: red; font-size: 15px; margin-left: 750px; margin-top: 7px;">NEWS</p>
            </div>
            
            <div style="margin-top: 50px;">
                <% if(session.getAttribute("account")!=null){ %>
                <%@include file="homeBarTwo.jsp" %>
                <% }else{%>
                <%@include file="homeBarnone.jsp" %>
                <%}%>
            </div>

            <div id="right">
                <img src="image/picRight.png" width="300" height="500" > 
            </div>               

            <div class="div121" style="width: 50%;">
                <div class="div1211"> <br>
                    <h2><a href="news?id=<%= list3.get(0).getId()%>"><%= list3.get(0).getTitle()%></a></h2><br>
                    <img src="image/<%= list3.get(0).getImage()%>" class="img2"> <br>
                    <%= list3.get(0).getDescription()%>
                </div>
                <br>
                <br>
                <div class="div1212"> 
                    <h2><a href="news?id=<%= list3.get(1).getId()%>"><%= list3.get(1).getTitle()%></a></h2>
                    <br>
                    <img src="image/<%= list3.get(1).getImage()%>" class="img2" style="width: 50%; height: 30%;">
                    <br><br>
                    <p style="font-size: 13px;"><%= list3.get(1).getDescription()%></p>
                    <br>
                    <hr>
                    <h3><a href="news?id=<%= list3.get(2).getId()%>"><%= list3.get(2).getTitle()%></a></h3>
                    <p style="font-size: 13px;"><%= list3.get(2).getDescription()%></p>
                </div>
            </div> 
            <div class="divs"><br><hr>
                <% for (i = 3; i < list3.size(); i++) {%>
                <h2><a href="news?id=<%= list3.get(i).getId()%>"><%= list3.get(i).getTitle()%></a></h2>
                <br>
                <img src="image/<%= list3.get(i).getImage()%>" class="img3"> <br> 
                <%= list3.get(i).getDescription()%><br><hr>
                <% }%>
            </div>
        </div>
        <%@include file="backpage.jsp" %>
    </body>
</html>
