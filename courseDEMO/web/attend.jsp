<%-- 
    Document   : attend
    Created on : Feb 26, 2022, 9:51:06 PM
    Author     : black
--%>

<%@page import="dal.rollDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Teaching"%>
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
        <title>TakeAttendance</title>
        <%
            ArrayList<Teaching> list = (ArrayList<Teaching>) request.getAttribute("listT");
            String mess = request.getAttribute("mess2").toString();
            rollDAO dao = new rollDAO();           
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
            .high{
                height: 20px;
            }
            #get1{
                margin-left: 130px;
                margin-top: 50px;
                font-size: 12px;
                margin-bottom: -60px;
            }
         </style>
    </head>
    <body>
        <h1><%= mess%></h1>
        <div id="get1">
        <a href="courses?sc=${subName}&sid=${subID}" style=" color: black">Subject Code:</a> ${subName}&emsp; Course: ${cc} &emsp; Instructor: ${ianme}     
        </div>
        <table class="table table-sm" style="text-align: center;">
            <thead style="background-color: pink; text-align: center;">
                <tr>                  
                    <th class="high">Teaching Date</th>                   
                    <th class="high">Slot</th>  
                    <th class="high">Room ID</th> 
                    <th class="high"></th> 
                </tr>
            </thead>
            <tbody>
                <% for (Teaching p : list) {%>
                <tr>
                    <td class="high" style="width: 150px; height: 30px;" ><%= p.getTeachDate() %></td>                   
                    <td class="high" style="width: 270px; height: 30px;"><%= p.getSlot() %></td>  
                    <td class="high" style="width: 270px; height: 30px;"><%= p.getRoomID() %></td>  
                    <td class="high" style="width: 100px; height: 30px; ">
                    <%
                        String messd = "";
                        int check = dao.CountScheID(p.getTeachingScheID());
                        if(check !=0) {%>
                        <span>&#10003;</span>
                        <a href="takeAttendance?tid=<%= p.getTeachingScheID()%>&sc=${subName}&cc=${cc}&iname=${ianme}&sid=${subID}" style="text-decoration: none">Edit Attendance</a>
                        <% } else{%>
                        <a href="takeAttendance?tid=<%= p.getTeachingScheID()%>&sc=${subName}&cc=${cc}&iname=${ianme}&sid=${subID}" style="text-decoration: none; color: red">Take Attendance</a>
                        <% }%>
                    </td>            
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
