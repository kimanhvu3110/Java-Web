<%-- 
    Document   : departments
    Created on : Feb 10, 2022, 3:04:11 PM
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
            
            #tri{
                    background-color: pink;
            }
            .tableD{
                padding: 50px 0 50px 300px;               
                text-align: center;
            }
            #find{   
                margin-top: 1000px;
                margin-left: 200px;
                text-decoration: none;
                text-align: center;
                padding: 10px;
                border: 1px solid pink;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            #find.active{
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
        <h1>List of departments</h1>
        <div class="tableD">
        <table border="1">
            <thead>
                <tr id="tri">
                    <th>ID</th>
                    <th>Name</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for(Department p : depts) { %>
                <tr>
                    <td style="width: 200px; height:30px"><%= p.getId()%></td>
                    <td style="width: 300px"><%= p.getName()%></td>
                    <td style="width: 50px"><a href="employees?did=<%= p.getId()%>">GoDetails</a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        </div>
            <br>
            <a id="find" href="employeess">Find employee</a>
            &emsp;<a id="add" href="addemployee">Add new employee</a>
    </body>
</html>