<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="utils.DBConfig"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
<link rel="stylesheet" href="./css/Main.css">
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<%
		String empname = (String) session.getAttribute("emp_name");
	
		if (empname == null || empname.isEmpty()) {
    	response.sendRedirect("compuzoonLoginForm.jsp");
		}
	%>
		<div class="box">
		  <div id="side-div">a</div>
		</div>
</body>
</html>