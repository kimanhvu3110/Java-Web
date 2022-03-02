<%-- 
    Document   : takeRoll
    Created on : Feb 27, 2022, 10:27:02 AM
    Author     : black
--%>

<%@page import="models.RollCall"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href=”https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css” rel=”stylesheet”/>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Take Attendance</title>
        <%
            ArrayList<RollCall> list = (ArrayList<RollCall>) request.getAttribute("listR");
            String mess23 = request.getAttribute("mess23").toString();
        %>
        <style>
        .table{
                width: 90%;
                margin-left: 70px;
                margin-top: 70px;
                font-size: 15px;
                height: 40px;
            }
            
             h1{
                font-family: Palatino Linotype, sans-serif;
                margin-top: 20px;
                text-align: center;
                border: 1px solid pink;
                width: 60%;
                margin-left: 270px;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
		border-radius: 10px;
                background-color: antiquewhite;
                font-size: 30px;
            }
            .high{
                height: 30px;
            }
            #get1{
                margin-left: 100px;
                margin-top: 50px;
                font-size: 15px;
                margin-bottom: -60px;
            }
            #submit1{       
                color: white;
                width: 15%;
                margin-left: 700px;
                margin-bottom: 50px;
                text-decoration: none;
                text-align: center; 
                font-size: 15px;
                border: 1px solid pink;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
		border-radius: 5px;
                background-color: green;
            }
            #submit1.active{
                color: hotpink;
                text-decoration: line-through;
            }
            a{
                margin-left: 30px;
                text-decoration: none;
                text-align: center;               
                border: 1px solid pink;
                color: black;
                font-size: 15px;
                background-color: blanchedalmond;
            }
            a.active{
                color: hotpink;
                text-decoration: line-through;
            }
         </style>
    </head>
    <body>
        <h1>List students in slot</h1>
        <div id="get1">
            <p style="color: green; margin-right: 200px; "><%= mess23 %></p>
            Attendance for ${subName} at slot ${slot} on ${date} at room ${romm} take by ${ianme}           
        </div>
        <form action="takeAttendance?tid=${ti}&sc=${subName}&cc=${cc}&iname=${ianme}&sid=${si}" method="post">
        <table class="table table-sm" style="text-align: center;">
            <thead style="background-color: pink; text-align: center;">
                <tr> 
                    <th></th>
                    <th class="high">Course</th>
                    <th class="high">Roll Number</th>                   
                    <th class="high">Name</th>  
                    <th class="high">Absent</th>
                    <th class="high">Present</th>
                    <th class="high">Comment</th> 
                </tr>
            </thead>
            <tbody>
                <% int i=0 ;%>
                <% for (RollCall p : list) {%>
                <tr>
                    <td><%= i++%></td>
                    <td class="high">${cc}</td>
                    <td class="high" style="width: 150px; height: 100px;" ><%= p.getStudent().getRollNB() %></td> 
                    <% if(p.getStudent().getMidName()!=null){%>
                    <td class="high" style="width: 270px; height: 30px;"><%= p.getStudent().getFirstName()+"   "+p.getStudent().getMidName()+" "+p.getStudent().getLastName() %></td>
                    <% }else{%>
                    <td class="high" style="width: 270px; height: 30px;"><%= p.getStudent().getFirstName()+"   " +p.getStudent().getLastName() %></td>
                    <% }%>
                    <td class="high" style="width: 100px; height: 30px; "><input type="radio" name="check<%= p.getId()%>"<%=p.isIsAbsent()==true?"checked":""%> value="true">Absent</td>                       
                    <td class="high" style="width: 100px; height: 30px; "><input type="radio" name="check<%= p.getId()%>" <%=p.isIsAbsent()==false?"checked":""%> value="false">Present</td>    
                    <% if(p.getComment() == null) p.setComment("");%>
                    <td class="high" style="width: 270px; height: 30px;"><input type="text" name="comment<%= p.getId()%>" value="<%= p.getComment()%>"></td>                              
                </tr>
                <% }%>               
            </tbody>
        </table>
            <div>
                <input id="submit1" type="submit" name="btSubmit" value="Submit">
            <a href="takeAttendance?sid=${si}&sub=${subName}&cid=${ci}&iname=${ianme}"> Back to list slot</a>
            </div>
        </form>
    </body>
</html>
