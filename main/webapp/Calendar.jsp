<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="utils.DBConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.day{
		background-color: skyblue;
		border: 1px solid black;
		width: 20px;
	}
</style>
</head>
<body>
	<table>
	안녕하세요
	<%
		LocalDate now = LocalDate.now();
		DBConfig dbc = new DBConfig();
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		int year = now.getYear();
		int month = now.getMonthValue();
		
		int date = 1;       // 일
    int day;            // 요일

    LocalDate firstDate = LocalDate.of(year, month, date); // 해당월 1일 설정
    day = firstDate.getDayOfWeek().getValue();
		
		try{
			conn = dbc.getConnection();
			
			String sql = "SELECT * FROM CALENDAR WHERE ";
			
			
	    
	    for (int i = 0; i < day % 7; i++) {
	    	%>
	    <div></div>
	    <%
	    }
	    
	    for(int i=1; i<=firstDate.lengthOfMonth(); i++) {
	        %><div class="day"><%=date++ %>
	        </div> <%
	        day++;
	    }

		} catch (Exception e){
			
		}
	%>
	</table>
</body>
</html>