<%@ page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String num = request.getParameter("NUM");
		String pd_date = request.getParameter("PD_Date");
		String name = request.getParameter("NAME");
		String subject = request.getParameter("SUBJECT");
		String content = request.getParameter("CONTENT");
		String cpu = request.getParameter("CPU");
		String cpu_ea = request.getParameter("CPU_EA");
		String mb = request.getParameter("MB");
		String mb_ea = request.getParameter("MB_EA");
		String ram = request.getParameter("RAM");
		String ram_ea = request.getParameter("RAM_EA");
		String gpu = request.getParameter("GPU");
		String gpu_ea = request.getParameter("GPU_EA");
		String power = request.getParameter("POWER");
		String power_ea = request.getParameter("POWER_EA");
		String cover = request.getParameter("COVER");
		String cover_ea = request.getParameter("COVER_EA");
		
		DBConfig db = new DBConfig();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = db.getConnection();
			
			String sql = "INSERT INTO CALENDAR('NAME','SUBJECT','CONTENT','PRODUCTION_DATE','CPU','CPU_EA','MAINBOARD','MAINBOARD_EA',"
					+ "'RAM','RAM_EA','GPU','GPU_EA','POWER','POWER_EA','CASE','CASE_EA'" 
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, pd_date);
			pstmt.setString(5, cpu);
			pstmt.setInt(6, Integer.parseInt(cpu_ea));
			pstmt.setString(7, mb);
			pstmt.setInt(8, Integer.parseInt(mb_ea));
			pstmt.setString(9, ram);
			pstmt.setInt(10, Integer.parseInt(ram_ea));
			pstmt.setString(11, gpu);
			pstmt.setInt(2, Integer.parseInt(gpu_ea));
			pstmt.setString(13, power);
			pstmt.setInt(14, Integer.parseInt(power_ea));
			pstmt.setString(15, cover);
			pstmt.setInt(16, Integer.parseInt(cover_ea));
			pstmt.executeUpdate();
			
		} catch (Exception e){
			e.getMessage();
		}
	%>
</body>
</html>