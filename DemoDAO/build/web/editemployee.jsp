<%-- 
    Document   : editemployee
    Created on : Feb 10, 2022, 3:04:37 PM
    Author     : black
--%>

<%@page import="models.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editEmployee</title>
        <% 
            Employee p = (Employee) request.getAttribute("employ");          
            ArrayList<Department> depts = (ArrayList<Department>) request.getAttribute("depts");  
            String mess = request.getAttribute("mess").toString();
        %>
        <style>
            h1{
                margin-top: 50px;
                margin-bottom: 5px;
                letter-spacing: 5px;
                text-align: center;
                padding: 0px;
                border: 1px solid pink;
                width: 40%;
                margin-left: 380px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            #block3{
                margin-top: 50px;
                margin-left: 330px;
                padding: 20px 50px 50px 50px;
                width: 40%;
                border: 1px solid pink;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            #id4{
                color: white;
                text-decoration: none;
                text-align: center;              
                border: 1px solid pink;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
		border-radius: 5px;
                background-color: chocolate;
            }
           
            #id4.active{
                color: hotpink;
                text-decoration: line-through;
            }
            
            .ac{
                 margin-top: 10px;
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <h1>Edit Employee</h1>
        <div id="block3">
        <form action="editemployee" method="post">
            ID: <input class="ac" value="${employ.id}" type ="text" name ="eID" readonly> <br>
            Name: <input class="ac" value="${employ.name}" type="text" name="ename"> <br>
             Sex: <input class="ac" type="radio" name="esex" value="Male" <%=p.getSex().equals("Male")?"checked":""%>>Male
            <input class="ac" type="radio" name="esex" value="Female" <%=p.getSex().equals("Female")?"checked":""%>>Female<br>
            Dob:  <input class="ac" type="date" name="edob" value="${employ.dob}"> <br>
            Position: <input class="ac" type="text" name="eposition" value="${employ.position}"><br>
            Current DeptID : <input class="ac" type="text" name="eposition" value="${employ.deptID} " readonly><br>
            Department: <select class="ac" name="department1">
                <% for(Department s: depts) {%>
                <option value="<%= s.getId()%>" <%=(s.getId()==p.getDeptID())?"selected":""%>><%= s.getName()%></option>
                <%}%>
            </select><br><br>
            <input id="id4" type="submit" value="Submit edit">
        </form>
        </div>
            <%= mess%>
    </body>
</html>
