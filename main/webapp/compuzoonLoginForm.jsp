<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>CompuZoon Login</title>
    <style>
         @font-face {
        font-family: 'SOYOMapleBoldTTF';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
}
        * {font-family:'SOYOMapleBoldTTF' ;}
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #1b1b1b;
        }

        .login-form {
            background-color: #2b2b2b;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        .login-form h2 {
            color: #ffffff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: none; /* 라벨 숨김 처리 */
            margin-bottom: 5px;
            color: #ffffff;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            background-color: #333333;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .form-group input::placeholder {
            color: #999999; /* 플레이스홀더 색상 지정 */
        }

        .form-group button,
        .form-group a {
            display: inline-block;
            width: 48%; /* 버튼 너비 조정 */
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
        }

        .form-group button {
          width: 100%;
          height: 48px;
          border: 0;
          outline: none;
          border-radius: 40px;
          background: linear-gradient(to left, rgb(14, 73, 60), rgba(0, 196, 26, 0.801));
          color: white;
          font-size: 1.2em;
          letter-spacing: 2px;
        }

        .form-group a {
          width: 90%;
          height: 25px;
          border: 0;
          outline: none;
          border-radius: 40px;
          background: linear-gradient(to left,  rgb(8, 62, 240),rgba(23, 21, 54, 0.829));
          color: white;
          font-size: 1.2em;
          letter-spacing: 2px;
          margin-top: 15px;
         
        }
        
       
      

    </style>
</head>
<body>

<div class="login-form">
    <h2>CompuZoon Login</h2>
    <form action="compuzoonLoginPro.jsp" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="emp_Id" placeholder="Username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="emp_Pw" placeholder="Password" required>
        </div>
        <div class="form-group">
            <button type="submit">Sign in</button>
            <a href="compuzoonSignUp.jsp">Sign up</a>
        </div>
    </form>
</div>

</body>
</html>