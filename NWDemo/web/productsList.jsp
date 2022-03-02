<%-- 
    Document   : productsList
    Created on : Feb 19, 2022, 11:11:24 AM
    Author     : black
--%>

<%@page import="java.util.HashMap"%>
<%@page import="models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    #table2{
                width: 650px;
                text-align: center;
                margin-top: 50px;
                margin-left: 30px;
            }
            
            .id2{
               
                height: 30px;
            }
            
            #tr2{
                    background-color: pink;
            }
</style>
<div style="width: 60%; float: left;">
    <% 
        ArrayList<Product> pros = (ArrayList<Product>) request.getAttribute("products"); 
        HashMap<Integer, Integer> proMap = (HashMap<Integer, Integer>)session.getAttribute("cart");
    %>
    <% if(pros !=null && pros.size()!=0){
          
           %>
           <div>           
               <table id="table2" style="margin-top: 180px;" border="1">
            <thead>
                <tr id="tr2">                  
                    <th>Name</th>
                    <th>UnitPrice</th>
                    <th>CategoryName</th>
                    <th>UnitsInStock</th>  
                    <th>Quantity in cart</th>
                    <th>Increase</th>
                    <th>Decrease</th>
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
                    <td><a style="text-decoration: none; width: 20px;" href="addProduct?pid=<%= p.getProductID()%>">+</a></td> 
                    <td><a style="text-decoration: none; width: 20px;" href="truProduct?pid=<%= p.getProductID()%>">-</a></td>
                </tr>
                <%}%>
            </tbody>
            </table><br><br> 
           </div>
         <%}%>   
</div>
