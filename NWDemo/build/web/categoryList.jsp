<%-- 
    Document   : categoryList
    Created on : Feb 20, 2022, 8:58:45 AM
    Author     : black
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
    <%
            ArrayList<Category> cats = (ArrayList<Category>) request.getAttribute("cats");
           
        %>
         <div style="width: 20%; float: left; margin-top: 10px;">   
             <h2>Categories</h2>
                <%for(Category c: cats){%>
                <div style="margin: 4px; margin-top: 20px; margin-left: 20px;">
                <a href="Products?cid=<%=c.getCatId()%>"><%=c.getCatName()%></a>
                </div>
                <%}%>
            </div>
</div>
