<%-- 
    Document   : kingMoon
    Created on : Mar 15, 2022, 11:22:44 PM
    Author     : black
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="models.MoonKing"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                background-image: url(image/cool.png);
                font-size: 16px;
            }
            #back{
                overflow-y:auto;
                background-image:url(image/demoWeb.png);
                background-repeat:no-repeat;
                background-attachment:fixed;
            }

            .title{
                font-family: sans-serif;
            }
            .image{
                width: 70px;
            }
            .new{
                margin-left: 550px;
                margin-bottom: -20px;
            }
            .container {
                width: 300px;
                margin-left: 50px;
                margin-top: 20px;
                font-weight: bold;
            }
            ul {
                list-style-type: none;
            }
            body {
                font-family: Verdana,sans-serif;
            }

            .month {
                padding: 70px 25px;
                width: 100%;
                background: #CC0000 ;
            }

            .month ul {
                margin: 0;
                padding: 0;
            }

            .month ul li {
                color: white;
                font-size: 20px;
                text-transform: uppercase;
                letter-spacing: 3px;
            }

            .month .prev {
                float: left;
                padding-top: 10px;
            }

            .month .next {
                float: right;
                padding-top: 10px;
            }

            .weekdays {
                margin: auto;
                padding: 10px 0;
                background-color: #ddd;
            }

            .weekdays li {
                display: inline-block;
                width: 13%;
                color: #666;
                text-align: center;
            }

            .days {
                margin: auto;
                padding: 10px 0;
                background: #eee;
                margin: 0;
            }

            .days li {
                list-style-type: none;
                display: inline-block;
                width: 13%;
                text-align: center;
                margin-bottom: 5px;
                font-size:12px;
                color: #777;
            }

            .days li .active {
                padding: 5px;
                background: #CC0000;
                color: white !important
            }
            #tri{
                background-color: pink;
                text-align: center;
            }
            .follow{
                padding: 50px ;                                          
            }
            #table1{
                text-align: center;
                margin-left: 600px;
                margin-top: -300px;
                margin-bottom: 50px;
            }
            #bton{
                margin-left: 300px;
            }
            .head{
                margin-left: 400px;
                font-family: Times new roman;
                font-size: 20px;
            }
            .pack{
                margin-top: 30px;                
                font-weight: 600;
            }

        </style>
        <%
            ArrayList<MoonKing> listK = (ArrayList<MoonKing>) request.getAttribute("listK");
            ArrayList<Integer> listY = (ArrayList<Integer>) request.getAttribute("listY");
            DateTimeFormatter fmt2 = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            int year = Integer.parseInt(request.getAttribute("year").toString());
        %>
    </head>
    <body>
        <div id="back" >
            <div>
                <img src="image/baee.png" style="margin-top:-185px; width: 150px; margin-bottom: -300px; margin-left: 330px;">
                <p class="new" style="font-size: 50px;">Mình Đẹp</p>
                <p class="new" style="color: red; font-size: 15px; margin-left: 750px; margin-top: 7px;">NEWS</p>
            </div>

            <div style="margin-top: 50px;">              
                <%@include file="homeBarTwo.jsp" %>              
            </div>
            <div class="follow">
                <h5 class="head" style="font-weight: 600; margin-left: 410px;">
                    <img src="image/blood.png" style="width: 50px;">Theo dõi chu kỳ kinh nguyệt
                </h5>
                <p class="head" id="2" >Theo dõi chu kỳ đều đặn theo ngày và tháng </p>
                <br>
                <form id="form1" action="kinhNguyetCuaToi" method="post">
                    Ngày bắt đầu: <input type='date' name='startDate'><br>                   
                    <input class="btn btn-outline-success" id="bton" type="submit" value="Cập nhật"><br>
                    Ngày kết thúc: <input type='date' name='endDate'>
   
                </form>
                <br><br>
                <p style="color: red;">${mess}</p>
                <p class="pack">
                Ngày dự kiến chu kì tiếp: ${next}<br><br>
                Khoảng ngày dễ đậu thai: ${nsafe1} - ${nsafe2} <br><br>
                Khoảng ngày an toàn:   ${safe1} - ${safe2}    <br><br>
            </p>  
            </div>  
            
            <div id="table1">
                <form action="kinhNguyetCuaToi">
                    <select name="yearBt">
                        <% for (int a : listY) {%>
                        <option value="<%= a%>" <%= year==a?"selected":""%>><%= a%></option>
                        <% } %>
                        </select>&emsp;<button>Xem</button>
                </form>
                <%if(listY.size()>0){%>
                <table border="2" >
                    <thead>
                        <tr id="tri">
                            <th>Tháng</th>
                            <th>Ngày bắt đầu</th>
                            <th>Ngày kết thúc</th>
                            <th>Kéo dài (ngày)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (MoonKing p : listK) {%>
                        <tr>
                            <td style="text-align: center;width: 50px; height:50px"><%= p.getStartDate().getMonth().getValue()%></td>
                            <td style="text-align: center;width: 150px"><%= p.getStartDate().format(fmt2)%></td>
                            <td style="text-align: center;width: 150px"><%= p.getEndDate().format(fmt2)%></td>
                            <td style="text-align: center;width: 80px"><%Period different = Period.between(p.getStartDate(), p.getEndDate());%><%= different.getDays()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                    <%}else{%>
                    Chưa có lưu trữ chu kỳ nào
                    <%}%>
            </div><br><br>
                    <p></p><br><br>
            
        <%@include file="backpage.jsp" %>
    </body>
</html>
