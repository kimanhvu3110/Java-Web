<%-- 
    Document   : addemployee.jsp
    Created on : Feb 10, 2022, 3:03:31 PM
    Author     : black
--%>

<%@page import="models.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Department> depts = (ArrayList<Department>) request.getAttribute("depts");  
            String mess = request.getAttribute("mess").toString();
        %>
        <style>
            *{
                margin: 0;
                font-family: Palatino Linotype , sans-serif;                
            }
            h1{
                margin-top: 50px;
                margin-bottom: 5px;
                letter-spacing: 5px;
                text-align: center;
                padding: 0px;
                border: 1px solid pink;
                width: 60%;
                margin-left: 230px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            #block1{
                margin-top: 50px;
                margin-left: 300px;
                padding: 20px 50px 50px 50px;
                width: 40%;
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
            .ad{
                margin-top: 10px;
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <h1>Add new Employee</h1>
        <div id="block1">
        <form action="addemployee" method="post" required="">           
            Name: <input class="ad" type="text" name="enname" required=""><br>
            Sex: <input class="ad" type="radio" name="ensex" value="Male" selected="selected">Male
            <input class="ad" type="radio" name="ensex" value="Female">Female<br>
            Dob: <input class="ad" type="date" name="endob" required=""><br>
            Position: <input class="ad" type="text" name="enposition" required=""><br>
            Department: <select class="ad" name="department">
                <% for(Department d: depts) {%>
                <option value="<%= d.getId()%>"><%= d.getName()%></option>
                <%}%>
            </select><br><br>
            <input id = "sub" type="submit" value="Add new">
        </form>
        </div>          
    </body>
</html>
