<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String num = request.getParameter("NUM");
		String date = request.getParameter("PD_Date");
		
		DBConfig db = new DBConfig();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String name = "";
		
		try{
			conn = db.getConnection();
			
			String sql = "SELECT * FROM EMPLOYEES WHERE NUM= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			rs = pstmt.executeQuery();
			
			if(rs.next())
				name = rs.getString("EMP_NAME");
			
		} catch (Exception e){
			e.getMessage();
		}
	%>
</body>
</html>