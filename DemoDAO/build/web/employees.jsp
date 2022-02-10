<%-- 
    Document   : employees
    Created on : Feb 10, 2022, 3:05:41 PM
    Author     : black
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>employees</title>
        <% 
             ArrayList<Employee> emps = (ArrayList<Employee>) request.getAttribute("emps");
             Employee e = emps.get(0);
             
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
                width: 90%;
                margin-left: 70px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            
            #tr2{
                    background-color: pink;
            }
            .tableE{
                padding: 50px 0 50px 150px;               
                text-align: center;               
            }
            #add{
                margin-top: 50px;
                margin-left: 60px;
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
            #back{   
                margin-top: 1000px;
                margin-left: 10px;
                text-decoration: none;
                text-align: center;
                padding: 10px;
                border: 1px solid pink;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            #back.active{
                color: hotpink;
                text-decoration: line-through;
            }
        </style>
    </head>
    <body>
        <script>
            function confirmDele(){
                var x = confirm("Are you sure to delete?");
             if (x)
                  return true;
             else
                return false;
            }
        </script>
        <h1>List of employees: Department <%=e.getDepartment().getName()%></h1>
        <div class="tableE">
        <table border="1">
            <thead>
                <tr id="tr2">
                    <th>ID</th>
                    <th>Name</th>
                    <th>Sex</th>
                    <th>Dob</th>
                    <th>Position</th>
                    <th>Department</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for(Employee p : emps) { %>
                <tr>
                    <td style="width: 50px; height: 30px "><%= p.getId()%></td>
                    <td style="width: 200px"><%= p.getName()%></td>
                    <td style="width: 60px"><%= p.getSex()%></td>
                    <td style="width: 100px"><%= p.getDob()%></td>
                    <td style="width: 200px"><%= p.getPosition()%></td>
                    <td style="width: 200px"><%= p.getDepartment().getName()%></td>
                    <td><a href="editemployee?dip=<%=p.getId()%>" style="color: blue">Edit</a></td>
                    <td><a href="deleteemployee?sid=<%=p.getId()%>" style="color: red" onclick="return confirmDele()">Delete</a></td>                  
                </tr>
                <%}%>
            </tbody>
        </table>
        </div>
            <a id="add" href="addemployee">Add new Employee</a>
            &emsp; <a id="back" href="departments"> Back to departments </a>
    </body>
</html>

