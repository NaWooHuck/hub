<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/reset.css">
	<style>
		.header{
			height: 70px;
			display: flex;
			text-align: center;
			position: relative;
			justify-content: center;
			align-items: center;
			margin-bottom: 10px;
		}
		
		.header #name{
			font-size: 30px;
		}
		
		#line{
			border-bottom: 1px solid #777;	
		}
		
		.header #log-out{
			background-color: orange;
			position: absolute;
			right: 10px;
			bottom: 0;
		}
		
		.header #emp_name{
			position: absolute;
			right: 10px;
		}
		
		.header #emp_pos{
			position: absolute;
			top: 7px;
			right: 10px;
		}
	</style>
</head>
<body>
	<div class="header">
    <div id="name">컴퓨준</div>
   	<div id="emp_name"><%= session.getAttribute("emp_name") %></div>
   	<div id="emp_pos"><%= session.getAttribute("emp_pos") %></div>
    <div id="log-out">
      <a href="#"><input type="button" value="log-out"></a>
    </div>
  </div>
	
	<div id="line"></div>
</body>
</html>