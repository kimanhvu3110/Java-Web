<%-- 
    Document   : products
    Created on : Feb 18, 2022, 11:00:52 PM
    Author     : black
--%>

<%@page import="models.Product"%>
<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>   
        <% ArrayList<Product> pros = (ArrayList<Product>) request.getAttribute("products"); %>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <style>
            #cart{
                margin-left: 650px;
                margin-top: 30px;
                text-decoration: none;
                width: 100px;
                text-align: center;
                padding: 10px;
                border: 1px solid pink;
                background-color: antiquewhite;
            }
            
            #table1{
                width: 800px;
                text-align: center;
                margin-top: 50px;
            }
            
            .id1{
               
                height: 30px;
            }
            
            h1{
                margin-top: 50px;
                margin-bottom: 5px;
                letter-spacing: 5px;
                text-align: center;
                padding: 0px;
                border: 1px solid pink;
                width: 75%;
                margin-left: 70px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            
             #tr1{
                    background-color: pink;
            }
            
        </style>
    </head>
    <body>
        <div>
            <%@include file="categoryList.jsp"%>
            <div style="width: 70%; float: left;">
    <% if(pros !=null && pros.size()!=0){
          
           %>
           <script>
               function checkUnit(){
                   var x = document.getElementById("checkl");
                   if(console.log(x > 1) )
                   {
                       alert("Can not add");
                       return false;
                   }                  
               }
           </script>
           <div >
                <h1>List of products</h1>
                <div id="cart">                              
                 <span style="color: indianred"><i class="fa fa-window-restore" aria-hidden="true"></i></span>
                 &emsp;<a style="text-decoration: none" href="viewCart">Go to cart</a>
                </div>
            <table id="table1" border="1">
            <thead>
                <tr id="tr1">                  
                    <th>Name</th>
                    <th>UnitPrice</th>
                    <th>CategoryName</th>
                    <th>UnitsInStock</th>                   
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for(Product p : pros) { %>
                <tr>
                    <td class="id1" ><%= p.getProductName()%></td>
                    <td class="id1" ><%= p.getUnitPrice()%></td>
                    <td class="id1"><%= p.getCategory().getCatName()%></td>
                    <td id="checkl" class="id1"><%= p.getUnitInStock()%></td>             
                    <td><a href="addToCart?pid=<%= p.getProductID()%>&cid=<%=p.getCategory().getCatId()%>" onclick="return checkUnit();">Add to Cart</a></td>            
                </tr>
                <%}%>
            </tbody>
            </table><br><br> 
           </div>
         <%}%>   
</div>
        </div>
    </body>
</html>
