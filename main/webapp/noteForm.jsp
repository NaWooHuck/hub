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
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/Main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%
		String num = request.getParameter("NUM");
		//session.setAttribute("date", date);
		DBConfig db = new DBConfig();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = db.getConnection();
			
	%>
	
	<%@ include file="header.jsp" %>
	
	<%
			String sql = "SELECT * FROM CALENDAR WHERE NUM = ?";
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			rs.next();
	%>
	
	<div class="box">
    <div id="side-div">a</div>
    <div>
    	<div>
    		<input type="button" value="수정" onclick="location.href='noteModify.jsp?num=<%=num%>'">
    	</div>
    	<div>
    		<div>제목:<%=rs.getString("SUBJECT") %></div>
    		<div>비고:<%=rs.getString("CONTENT") %></div>
    		<form>
    		<div>사용한 재고
  <%	if(rs.getString("CPU")!=null){
  			%><div>CPU: <%=rs.getString("CPU")%>     <%=rs.getString("CPU_EA")%>ea</div><%
  		}
    	if(rs.getString("MAINBOARD")!=null){
      	%><div>CPU: <%=rs.getString("MAINBOARD")%>     <%=rs.getString("MAINBOARD_EA")%>ea</div><%
      }
    	if(rs.getString("RAM")!=null){
          	%><div>CPU: <%=rs.getString("RAM")%>     <%=rs.getString("RAM_EA")%>ea</div><%
      }
   		if(rs.getString("GPU")!=null){
      	%><div>CPU: <%=rs.getString("GPU")%>     <%=rs.getString("GPU_EA")%>ea</div><%
      }
   		if(rs.getString("POWER")!=null){
      	%><div>CPU: <%=rs.getString("POWER")%>     <%=rs.getString("POWER_EA")%>ea</div><%
      }
   		if(rs.getString("CASE")!=null){
      	%><div>CPU: <%=rs.getString("CASE")%>     <%=rs.getString("CASE_EA")%>ea</div><%
      }
	  %>
    			<div></div>
    		</div>
    		</form>
  <%
  		
		} catch (Exception e){
			
		}
	%>
			</div>
    </div>
  </div>
</body>
</html>

	