<%-- 
    Document   : courseS
    Created on : Feb 21, 2022, 9:50:31 PM
    Author     : black
--%>

<%@page import="models.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href=”https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css” rel=”stylesheet”/>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Course</title>
        <%
            ArrayList<Course> list = (ArrayList<Course>) request.getAttribute("listC");
            String mess = request.getAttribute("mess1").toString();
        %>
        <style>
            .table{
                width: 80%;
                margin-left: 130px;
                margin-top: 70px;
                font-size: 15px;
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
            
            #get45{
                margin-left: 130px; 
                margin-bottom: -60px; 
                font-size: 14px; 
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <h1><%= mess%></h1>
        <div id="get45">
            <a href="subjects" style="color: black;">Subject Code:</a> ${subName}
        </div>
        <table class="table table-sm" style="text-align: center;">
            <thead style="background-color: pink; text-align: center;">
                <tr>                  
                        <th class="high">Course ID</th>                   
                        <th class="high">Course Code</th>  
                        <th class="high">Subject ID</th> 
                        <th class="high">Instructor</th> 
                        <th></th>
                    </tr>
            </thead>
            <tbody>
                 <% for (Course p : list) {%>
                    <tr>
                        <td class="high" style="width: 150px;" ><%= p.getCourseId()%></td>                   
                        <td class="high" style="width: 270px;"><%= p.getCourseCode() %></td>  
                        <td class="high" style="width: 270px;"><%= p.getSubjectId() %></td> 
                        <td class="high" style="width: 270px;"><%= p.getInstructor().getInsLastName() + p.getInstructor().getInsId()%></td>  
                        <td class="high" style="width: 100px;"><a href="takeAttendance?sid=<%= p.getSubjectId()%>&sub=${subName}&cid=<%= p.getCourseId()%>&iname=<%= p.getInstructor().getInsLastName() + p.getInstructor().getInsId()%>">Take attendance</a></td>            
                    </tr>
                    <%}%>
            </tbody>
        </table>
    </body>
</html>
