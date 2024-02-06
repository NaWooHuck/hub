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
<script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<script>
		
		function err(){
			alert(" 재고수량이 적습니다.");
			history.back();
		}	
	
		function clear(){
			alert("작성 완료 하였습니다.");	
			location.href="Main.jsp";
		}
		
	</script>
	<%
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String cpu = request.getParameter("cpu");
		String cpu_ea = request.getParameter("cpu-ea");
		String mb = request.getParameter("mb");
		String mb_ea = request.getParameter("mb-ea");
		String ram = request.getParameter("ram");
		String ram_ea = request.getParameter("ram-ea");
		String gpu = request.getParameter("gpu");
		String gpu_ea = request.getParameter("gpu-ea");
		String power = request.getParameter("pw");
		String power_ea = request.getParameter("pw-ea");
		String cover = request.getParameter("cs");
		String cover_ea = request.getParameter("cs-ea");

		DBConfig db = new DBConfig();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		//try{
			
			
			
			try{
				
				conn = db.getConnection();
			if(cpu!=""){
				String sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, cpu);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<Integer.parseInt(cpu_ea)){
						throw new Exception();
					}
				} 
			}
			if(mb!=""){
				System.out.println("확인bm");
				String sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, mb);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<Integer.parseInt(mb_ea)){
						//System.out.println("확인");
						throw new Exception("MAINBOARD 재고가 부족합니다.");
					}
				} 
			}
			if(ram!=""){
				String sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, ram);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<Integer.parseInt(ram_ea)){
						throw new Exception("RAM 재고가 부족합니다."); 
					}
				} 
			}
			if(gpu!=""){
				String sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, gpu);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<Integer.parseInt(gpu_ea)){
						throw new Exception("GPU 재고가 부족합니다.");
					}
				} 
			}
			if(power!=""){
				String sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, power);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<Integer.parseInt(power_ea)){
						throw new Exception("POWER 재고가 부족합니다.");
					}
				} 
			}
			if(cover!=""){
				String sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, cover);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<Integer.parseInt(cover_ea)){
						throw new Exception("CASE 재고가 부족합니다.");
					}
				} 
			}
			if(cpu!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?) WHERE PART_NAME = ?";
							pstmt = conn.prepareStatement(sqlUpdate);
							pstmt.setString(1, cpu_ea);
							pstmt.setString(2, cpu_ea);
							pstmt.setString(3, cpu);
						
							pstmt.executeUpdate(); 
			}
			if(mb!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setString(1, mb_ea);
						pstmt.setString(2, mb_ea);
						pstmt.setString(3, mb);
					
						pstmt.executeUpdate();
			}
			if(ram!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setString(1, ram_ea);
						pstmt.setString(2, ram_ea);
						pstmt.setString(3, ram);
					
						pstmt.executeUpdate();
			}
			if(gpu!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setString(1, gpu_ea);
						pstmt.setString(2, gpu_ea);
						pstmt.setString(3, gpu);
					
						pstmt.executeUpdate();
			}
			if(power!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setString(1, power_ea);
						pstmt.setString(2, power_ea);
						pstmt.setString(3, power);
					
						pstmt.executeUpdate();
			}
			if(cover!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setString(1, cover_ea);
						pstmt.setString(2, cover_ea);
						pstmt.setString(3, cover);
					
						pstmt.executeUpdate();
			}
			
			String sqlInsert = "INSERT INTO CALENDAR (NAME,SUBJECT,CONTENT,PRODUCTION_DATE,CPU,CPU_EA,MAINBOARD,MAINBOARD_EA,RAM,RAM_EA,GPU,GPU_EA,POWER,POWER_EA,CASE,CASE_EA) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			//String sqlInsert = "INSERT INTO CALENDAR (NAME,SUBJECT,CONTENT,PRODUCTION_DATE,CPU,CPU_EA,MAINBOARD,MAINBOARD_EA) VALUES (?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setString(1, String.valueOf(session.getAttribute("emp_name")));
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, String.valueOf(session.getAttribute("date")));
			pstmt.setString(5, cpu);
			pstmt.setString(6, cpu_ea);
			pstmt.setString(7, mb);
			pstmt.setString(8, mb_ea);
			pstmt.setString(9, ram);
			pstmt.setString(10, ram_ea);
			pstmt.setString(11, gpu);
			pstmt.setString(12, gpu_ea);
			pstmt.setString(13, power);
			pstmt.setString(14, power_ea);
			pstmt.setString(15, cover);
			pstmt.setString(16, cover_ea);
			pstmt.executeUpdate();
			%> <script>clear();</script> <%
			} catch (Exception e){
				%> <script>err();</script> <%	
			}	finally {
				if(conn!=null){conn.close();}
				if(pstmt!=null){pstmt.close();}
				if(rs!=null){rs.close();}
			}
			
	%>
</body>
</html>