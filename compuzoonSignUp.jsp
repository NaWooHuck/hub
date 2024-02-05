<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
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
        
        .signup-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
	
        .signup-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }
        
        .signup-form button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        
        .signup-form select {
        	width: 100%;
        	height: 30px;
        	text-align: center;
        	text-size: 20px;
        }
        
        #btn {
            background-color: #0101DF;
            color: #fff;
            padding: 10px;
            margin-top: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        #btn:hover {
            background-color: #08088A;
        }
        
    </style>
	
	<script defer src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>

<div class="signup-container">	
    <h1>CompuZoon SignUp</h1>
    <form class="signup-form" action="compuzoonSignUpPro.jsp" method="post" id="form1" onsubmit="return false">
        아이디 <input type="text" id="emp_Id" name="emp_Id" ><br>
        이름 <input type="text" id="emp_Name" name="emp_Name" ><br>
        비밀번호 <input type="password" id="emp_Pw" name="emp_Pw" ><br>
        권한 <select type="position" id="position" name="position" >
        		<option value=""></option>
        		<option value="staff">staff</option>
        		<option value="Manager">Manager</option>
        		<option value="Master">Master</option>
        	</select>
        <br>
        <input id="btn" type="submit" value="가입" onClick="javascript:checkBox();">
    </form>
 </div>
 <script>
		function checkBox() {
		  if (!$('#emp_Id').val()) {	
		    alert('아이디 입력하세요');	
		    $('#emp_Id').focus();	
		    return;
		  }
		  
		  if (!$('#emp_Name').val()) {
		    alert('이름을 입력하세요.');	
		    $('#emp_Name').focus();	
		    return;
		  }
		  if (!$('#emp_Pw').val()) {
		    alert('암호를 입력하세요.');	
		    $('#emp_Pw').focus();	
		    return;
		  }
		  if (!$('#position').val()) {	
		    alert('직급을 선택하세요');	
		    $('#position').focus();	
		    return;
		  }
		  document.getElementById('form1').submit();
		}
    </script>
    
    
</body>
</html>