<%-- 
    Document   : orders
    Created on : Feb 20, 2022, 9:35:03 AM
    Author     : black
--%>

<%@page import="java.util.HashMap"%>
<%@page import="models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Shipper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Shipper> shippers = (ArrayList<Shipper>) request.getAttribute("shipper");           
            ArrayList<Product> pros = (ArrayList<Product>) request.getAttribute("products"); 
            HashMap<Integer, Integer> proMap = (HashMap<Integer, Integer>)session.getAttribute("cart");   
        %>
        <style>
            #table2{
                width: 650px;
                text-align: center;
                margin-left: 30px;
            }
            
            .id2{
               
                height: 30px;
            }
            
            #tr2{
                    background-color: pink;
            }
            h1{
                margin-top: 50px;
                margin-bottom: 5px;
                letter-spacing: 5px;
                text-align: center;
                padding: 0px;
                border: 1px solid pink;
                width: 60%;
                margin-left: 250px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            
            #block1{
                position: fixed;
                padding: 20px 50px 50px 50px;
                width: 30%;
                border: 1px solid pink;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }          
            #sub{       
                color: white;
                text-decoration: none;
                text-align: center;              
                border: 1px solid pink;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: chocolate;
            }
            #sub.active{
                color: hotpink;
                text-decoration: line-through;
            }
            #add{
                margin-top: 50px;
                margin-left: 20px;
                text-decoration: none;
                text-align: center;
                padding: 10px;
                border: 1px solid pink;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: blanchedalmond;
            }
            #add.active{
                color: hotpink;
                text-decoration: line-through;
            }
</style>
    </head>
    <body>
        <h1>Order product in cart</h1>
        <% if(pros !=null && pros.size()!=0){         
           %>
          <form action="order" method="post">
           <div style="width: 60%;">           
               <table id="table2" style="margin-top: 50px;" border="1">
            <thead>
                <tr id="tr2">                  
                    <th>Name</th>
                    <th>UnitPrice</th>
                    <th>CategoryName</th>
                    <th>UnitsInStock</th>  
                    <th>Quantity in cart</th>
                    <th style="width: 10px; ">new UnitPrice</th>                    
                </tr>
            </thead>
            <tbody>
                <% for(Product p : pros) { %>
                <tr>
                    <td class="id2" ><%= p.getProductName()%></td>
                    <td class="id2" ><%= p.getUnitPrice()%></td>
                    <td class="id2" ><%= p.getCategory().getCatName()%></td>
                    <td class="id2"  ><%= p.getUnitInStock()%></td>       
                    <td class="id2" ><%= proMap.get(p.getProductID())%></td>
                    <td class="id2" style="width: 10px;"><input type="text" name="new<%= p.getProductID()%>"></td>                   
                </tr>
               <%}%>
            </tbody>
            </table><br><br> 
           </div>
            <div id="block1" style=" margin-left: 700px; top: 140px;" required="">
            Required ShippDate: <input type="date" name="RequiredDate"><br><br>
            ShipVia: <select name="Shipper">
                <%  for(Shipper s : shippers){%>
                <option value="<%= s.getShipID()%>"><%= s.getCompanyName()%></option>
                <%}%>
            </select><br><br>
            ShipName: <input type="text" name="ShipName"><br><br>
            Address: <input type="text" name="ShipAddress"><br><br>
            <input id = "sub" type="submit" name="btSubmit" value="Order">
            </div>
        </form>
        <%} else {%>             
        <p style="margin-left: 40%; margin-top: 50px; font-size: 20px;"><%= "No product to order"%></p>
        <%}%>
        <a id="add" href="Products"> Back to products</a>
    </body>
</html>
