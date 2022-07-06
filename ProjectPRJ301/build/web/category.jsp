<%-- 
    Document   : category
    Created on : Mar 13, 2022, 10:22:39 PM
    Author     : black
--%>

<%@page import="models.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo Mình Đẹp</title>
        <link rel="shortcut icon" type="image/png" href="image/favi.png"/>
        <link href=”https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css” rel=”stylesheet”/>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <%
            int tol = Integer.parseInt(request.getAttribute("tol").toString());
            int pag = Integer.parseInt(request.getAttribute("cpage").toString());
            int nb = Integer.parseInt(request.getAttribute("nbPage").toString());
            ArrayList<News> listN = (ArrayList<News>) request.getAttribute("listNew");
        %>
        <style>
            *{
                margin: 0;
                padding: 0;
                font-size: 16px;
            }
            #back{
                overflow-y:auto;
                background-image:url(image/demoWeb.png);
                background-repeat:no-repeat;
                background-attachment:fixed;
            }
            .new{
                margin-left: 550px;
                margin-bottom: -20px;
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
                margin-top: -450px;
                width: 450px;
            }
            .img3{
                width: 70%;
            }
            #right {
                max-width: 500px;
                height: 400px;
                margin-left: 800px;
                margin-top: 100px;
                margin-bottom: 50px;
                border: 0px solid #000;
                padding-left:18px;
            }
            #navi {
                margin-top: 50px;
                margin-left: 100px;
                margin-bottom: -70px;

            }
            #navi a{
                color: darkgoldenrod;
                font-weight: 600;
                font-size: 18px;
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
            <div id="navi"><a href="Home">Home</a>&emsp;>&emsp;<a href="category?cid=${idC}">${nameC}</a></div>
            <div id="right">
                <img src="image/cat${idC}.png" width="300" height="500" > 
            </div>  
            <div class="divs"><br>
                <% for (News s : listN) {%>
                <h2><a href="news?id=<%= s.getId()%>"><%= s.getTitle()%></a></h2>
                <br>
                <img src="image/<%= s.getImage()%>" class="img3"> <br> 
                <%= s.getDescription()%><br><hr>
                <% }%>
            </div>

            <nav aria-label="Page navigation example" style="margin-left: 100px;">
                <ul class="pagination">
                    <li class="page-item">
                        <% if ((pag - 1) >= 1) {%>
                        <a class="page-link" href="category?cid=${idC}&page=<%= pag - 1%>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                        <% } else {%>
                        <a class="page-link" href="category?cid=${idC}&page=<%= pag%>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                        <% }%>
                    </li>
                    <c:forEach begin="1" end="<%= nb%>" var="i">
                        <li class="page-item"><a class="page-link" href="category?cid=${idC}&page=${i}">${i}</a></li>
                        </c:forEach>
                    <li class="page-item">
                        <% if ((pag + 1) <= nb) {%>
                        <a class="page-link" href="category?cid=${idC}&page=<%= pag + 1%>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                        <% } else {%>
                        <a class="page-link" href="category?cid=${idC}&page=<%= pag%>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                        <% }%>
                    </li>
                </ul>
            </nav>

        </div>
         <%@include file="backpage.jsp" %>
        
    </body>
</html>
