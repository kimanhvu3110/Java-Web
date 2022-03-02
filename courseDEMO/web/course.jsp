<%-- 
    Document   : course
    Created on : Feb 21, 2022, 9:49:19 PM
    Author     : black
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Subject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href=”https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css” rel=”stylesheet”/>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Home</title>
        <%
            int tol = Integer.parseInt(request.getAttribute("tol").toString());
            int pag = Integer.parseInt(request.getAttribute("cpage").toString());
            int nb = Integer.parseInt(request.getAttribute("nbPage").toString());
            ArrayList<Subject> listp = (ArrayList<Subject>) request.getAttribute("list");
        %>
        <style>
            *{
                margin: 0;

            }
            .container{
                height: 100vh;
                width: 100%;
                position: absolute;
                background-image: url(image/pice.png);
                background-repeat: repeat-x;
                background-position: center;
                background-size: cover;
                padding-left: 5%;
                padding-right: 5%;
                margin-bottom: 20px;
                box-sizing: border-box;
                position: relative;
            }

            h1{
                font-family: Palatino Linotype, sans-serif;
                margin-top: 20px;
                text-align: center;
                border: 1px solid pink;
                width: 80%;
                margin-left: 100px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
                font-size: 30px;
            }
            h2{
                margin-left: 400px;
                margin-bottom: 20px;
                margin-top: 30px;
            }

            .table table-striped{
                margin-left: 260px;
                text-align: center;
            }
            #tr2{
                background-color: pink;
            }
            .loop{
                height: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container" >           
            <h1>Welcome to attendance management system</h1>
            <h2>List of all subjects</h2>      
            <form action="subjects" method="post" style="margin-left: 420px;
                width: 50%;">
                <input type="text" name="search">
                <i class="fa fa-search"></i>        
            </form>
               
            <table class="table table-striped" style="text-align: center; margin-top: 50px;">
                <thead>
                    <tr id="tr2">                  
                        <th class="loop">Subject Code</th>                   
                        <th class="loop">Subject Name</th>                   
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Subject p : listp) {%>
                    <tr>
                        <td class="loop" style="width: 150px;" ><%= p.getSubjectCode()%></td>                   
                        <td class="loop" style="width: 270px;"><%= p.getSubjectName()%></td>             
                        <td class="loop" style="width: 100px;"><a href="courses?sc=<%= p.getSubjectCode()%>&sid=<%= p.getSubjectId()%>">Go to course</a></td>            
                    </tr>
                    <%}%>
                </tbody>
            </table><br><br>
            
            <nav aria-label="Page navigation example" style="margin-left: 400px; margin-bottom: 50px;">
                <ul class="pagination" >
                    <li class="page-item">
                        <%if(pag==1){%>
                            
                            <%}else{%>
                            <a class="page-link" href="subjects?page=<%= pag - 1%>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <%}%>
                        </a>
                    </li> 
                    <%if(tol<10){%>
                    <c:forEach begin="1" end="<%= nb %>" var="i">
                        <li class="page-item"><a class="page-link" href="subjects?page=${i}">${i}</a></li>
                        </c:forEach> <%}else{%>
                    <% if (pag <= 4) {%>
                    <c:forEach begin="1" end="5" var="i">
                        <li class="page-item"><a class="page-link" href="subjects?page=${i}">${i}</a></li>
                        </c:forEach> <%} else if(pag <= nb-3) {%>
                        <c:forEach begin="<%= pag - 2%>" end="<%= pag + 2%>" var="i">
                        <li class="page-item"><a class="page-link" href="subjects?page=${i}">${i}</a></li>
                        </c:forEach><% } else{%>
                        <c:forEach begin="<%= pag - 3%>" end="<%= nb%>" var="i">
                        <li class="page-item"><a class="page-link" href="subjects?page=${i}">${i}</a></li>
                        </c:forEach><%} }%>
                    <li class="page-item">
                            <%if(pag==nb){%>
                            
                            <%}else{%>
                            <a class="page-link" href="subjects?page=<%= pag + 1%>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <%}%>
                        </a>
                    </li>
                </ul>
            </nav>

        </div>
       <div></div>
    </body>
</html>
