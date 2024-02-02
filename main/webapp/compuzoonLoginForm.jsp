<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>CompuZoon Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
        }

        .login-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .login-form button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .login-form button:hover {
            background-color: #45a049;
        }
        
        #signup {
            background-color: #0101DF;
            color: #fff;
            padding: 10px;
            margin-top: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        
        #signup:hover {
        	background-color: #08088A;
        }
    </style>
    
</head>
<body>
	<div class="login-container">
    <h2>CompuZoon Login</h2>
    <form class="login-form" action="compuzoonLoginPro.jsp" method="post">
        <input type="text" id="emp_Id" name="emp_Id" placeholder="아이디" required>
        <input type="password" id="emp_Pw" name="emp_Pw" placeholder="비밀번호" required>
        <button type="submit">로그인</button>
    </form>
    	<button id="signup" onClick="location.href='compuzoonSignUp.jsp'">회원가입</button>
</div>
</body>
</html>