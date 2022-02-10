<%-- 
    Document   : employ
    Created on : Feb 10, 2022, 3:05:14 PM
    Author     : black
--%>

<%@page import="models.Department"%>
<%@page import="models.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter</title>
         <%
            String mess = request.getAttribute("mess").toString();
            ArrayList<String> pos = (ArrayList<String>) request.getAttribute("positions");  
            ArrayList<Employee> emp = (ArrayList<Employee>) request.getAttribute("empL");
            ArrayList<Department> depts = (ArrayList<Department>) request.getAttribute("depts");
            String name = request.getAttribute("na").toString();
            String sex = request.getAttribute("se").toString();
            String dobf = request.getAttribute("df").toString();
            String dobt = request.getAttribute("dt").toString();
            String position = request.getAttribute("po").toString();
            String id = request.getAttribute("id").toString();
        %>
        <style>
            *{
                margin: 0;
                font-family: Palatino Linotype , sans-serif;                
            }
            #div1{
                width: 30%;
                margin-left: 20px;
                margin-top: 20px;
            }
            h1{
                margin-top: 50px;
                margin-bottom: 5px;
                letter-spacing: 5px;
                text-align: center;
                padding: 0px;
                border: 1px solid pink;
                width: 30%;
                margin-left: 30px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            #div2{
                position: absolute;
                top: 50px;
                margin-left: 450px;  
                text-align: center;
            }
            h2{    
                position: fixed;
                margin-top: 0px;
                margin-bottom: 20px;
                letter-spacing: 5px;
                text-align: center;
                border: 1px solid pink;
                width: 50%;
                margin-left: 80px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
            }
            #kol{
                position: fixed;
                top: 100px;
            }
            #ko{
                background-color: pink;
            }
           .ba{ 
                font-size: 16px;
                color: indigo;
                font-family: sans-serif;
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
            .ba.active{
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
        <h1>Find employee</h1>
        <div id="div1">
        <form action="employeess" method="post">           
            Name: <input type="text" name="iname" value="<%=name%>"><br>
            Sex: <select name="isex">
                <option name="allS" value="All" selected>All sex</option>
                <option name="male" value="Male" <%=sex.equals("Male")?"selected":""%>>Male</option>
                <option name="female" value="Female" <%=sex.equals("Female")?"selected":""%> >Female</option>
            </select><br>
            Dob From: <input type="date" name="idobf" value="<%=dobf%>"><br> 
            Dob To: <input type="date" name="idobt" value="<%=dobt%>"><br> 
          Position: <select name="iposition">
              <option name="all" value="All" >All position</option>
                <% for(String d: pos) {%>
                <option value="<%=d%>" <%=position.equals(d)?"selected":""%>><%=d%></option>
                <%}%>                
          </select><br>
            Departments: <select name="idepartment">
                <option value="0" selected="">All departments</option>
                <% for(Department d: depts) {%>
                <option value="<%= d.getId()%>" <%=Integer.toString(d.getId()).equals(id)?"selected":""%>><%= d.getName()%></option>
                <%}%>               
            </select><br><br>
            <input class="ba" type="submit" value="Filter"> 
            &emsp; <a class="ba" href="departments">Back to departments</a>
        </form>
        </div>  
        <div id="div2">   
        <h2>List of employees:</h2> 
        
        <table id="kol" border="2">
            <thead>
                <tr id="ko">
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
                <% for(Employee p : emp) { %>
                <tr>
                    <td style="width:30px; height: 30px;"><%= p.getId()%></td>
                    <td style="width:170px;"><%= p.getName()%></td>
                    <td style="width:70px;"><%= p.getSex()%></td>
                    <td style="width:90px;"><%= p.getDob()%></td>
                    <td style="width:90px;"><%= p.getPosition()%></td>
                    <td style="width:180px;"><%= p.getDepartment().getName()%></td>
                    <td><a href="editemployee?dip=<%=p.getId()%>">Edit</a></td>
                    <td><a href="deleteemployee?sid=<%=p.getId()%>" style="color: red" onclick="return confirmDele()">Delete</a></td>            
                </tr>
                <%}%>
            </tbody>
       
        </table><br><br></div>
            <%=mess%>           
    </body>
</html>

