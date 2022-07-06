<%-- 
    Document   : register
    Created on : Mar 4, 2022, 4:59:23 PM
    Author     : black
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="shortcut icon" type="image/png" href="image/favi.png"/>
        <link rel="shortcut icon" type="image/png" href="image/favi.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <style>
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);
            *{
                padding: 0px;
                margin:0px;
            }
 
            .register-form {
                width: 360px;
                padding: 8% 0 0;
                margin: auto;
            }
            .form {
                position: relative;
                z-index: 1;
                text-align: center;
                top: 100px;
                background: white;
                max-width: 460px;
                margin: 0 auto 100px;
                padding: 45px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }
            .form input {
                font-family: "Roboto", sans-serif;
                outline: 0;
                background: #f2f2f2;
                width: 100%;
                border: 0;
                margin: 0 0 15px;
                padding: 15px;
                box-sizing: border-box;
                font-size: 14px;
            }
            #submit {
                font-family: "Roboto", sans-serif;
                text-transform: uppercase;
                outline: 0;
                background: tan;
                width: 100%;
                border: 0;
                padding: 15px;
                color: #FFFFFF;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                cursor: pointer;
            }
            .form button:hover,.form button:active,.form button:focus {
                background: tan;
            }
            .form .message {
                margin: 15px 0 0;
                color: #b3b3b3;
                font-size: 12px;
            }
            .form .message a {
                color: tan;
                font-family: serif;
                text-decoration: none;
                font-size: 17px;
            }
            body {
                background: tan; 
                font-family: "Roboto", sans-serif;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;      
            }
            .check{
                color: red;
                margin: 0;
                display: none;
            }
        </style>

    </head>

    <body>
        <div class="form">
            <form action="logUp" method="post" class="register-form">
                <input id="uname" type="text" name="username" value="${unameB}" placeholder="Tên đăng ký"/><p class="check">Hãy nhập tên đăng ký</p><br>
                <input id="pass" type="password" name="pass" value="${passB}" placeholder="Mật khẩu"/>
                <input id="showpass" type="checkbox" onclick="myFunction()" style="margin-left: -480px;"><span style="margin-left:-160px;" class="fa fa-eye" aria-hidden="true"></span>        
                <p class="check">Hãy nhập password</p><br>
                <input id="email" type="text" name="email" value="${emailB}" placeholder="Email"/><p class="check">Hãy nhập email của bạn</p><br>
                <p style="color: red;">${mess}</p>
                <p style="color: green;">${mess1}</p>
                <input id="submit" type="submit" value="Tạo tài khoản">              
                <p class="message">Đã có tài khoản? <a style="font-weight: 400;" href="http://localhost:8080/ProjectPRJ301/login">Đăng nhập</a></p>
                <p class="message">hoặc <a style="color:tan; font-weight: 200; text-decoration: none;" href="Home"> trở về trang chủ</a>
            </form>
        </div>
        <script>
            const form = document.querySelector('form');
            const name = document.getElementById('uname');
            const pass = document.getElementById('pass');
            const email = document.getElementById('email');
            const para = document.querySelector('p');
            form.addEventListener('submit', e => { 
                 if (name.value === '') {
                    e.preventDefault();
                    document.getElementsByTagName("p")[0].style.display = 'block';
                    document.getElementsByTagName("input")[0].style.border = '1px solid red';
                    
                } else {
                    document.getElementsByTagName("p")[0].style.display = 'none';
                    document.getElementsByTagName("input")[0].style.border = '1px solid black';
                }
                if (pass.value === '') {
                    e.preventDefault();
                    document.getElementsByTagName("p")[1].style.display = 'block';
                    document.getElementsByTagName("input")[1].style.border = '1px solid red';
                    
                } else {
                    document.getElementsByTagName("p")[1].style.display = 'none';
                    document.getElementsByTagName("input")[1].style.border = '1px solid black';
                }
                if (email.value === '') {
                    e.preventDefault();
                    document.getElementsByTagName("p")[2].style.display = 'block';
                    document.getElementsByTagName("input")[2].style.border = '1px solid red';
                    
                } else {
                    document.getElementsByTagName("p")[2].style.display = 'none';
                    document.getElementsByTagName("input")[2].style.border = '1px solid black';
                }      
            });
            
            function myFunction() {
                var x = document.getElementById("pass");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }

        </script>

    </body>
</html>
