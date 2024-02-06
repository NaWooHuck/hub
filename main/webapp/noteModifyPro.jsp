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
			alert("수정 완료 하였습니다.");	
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
		String power = request.getParameter("power");
		String power_ea = request.getParameter("pw-ea");
		String cover = request.getParameter("case");
		String cover_ea = request.getParameter("cs-ea");
		String num = (String) session.getAttribute("num");
		
		DBConfig db = new DBConfig();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
			
			
			
			try{
				
				int cpuea =0;
				int mbea =0;
				int ramea =0;
				int gpuea =0;
				int powerea =0;
				int coverea =0;
				
				conn = db.getConnection();
				
				String sqlSelect = "SELECT * FROM CALENDAR WHERE NUM =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, num);
				rs = pstmt.executeQuery();
				
				rs.next();
				
				
				if(rs.getString("CPU")!=null){
					if(rs.getString("CPU").equals(cpu)){
						if(rs.getInt("CPU_EA") != Integer.parseInt(cpu_ea)){
							cpuea = Integer.parseInt(cpu_ea) - rs.getInt("CPU_EA");
						}
					} else {
						cpuea = Integer.parseInt(rs.getString("CPU"));
					}
				}				
				if(rs.getString("MAINBOARD")!=null){
					if(rs.getString("MAINBOARD").equals(mb)){
						if(rs.getInt("MAINBOARD_EA") != Integer.parseInt(mb_ea)){
							mbea = Integer.parseInt(mb_ea) - rs.getInt("MAINBOARD_EA");
						}
					} else {
						mbea = Integer.parseInt(mb_ea);
					}
				}
				if(rs.getString("RAM")!=null){
					if(rs.getString("RAM").equals(ram)){
						if(rs.getInt("RAM_EA") != Integer.parseInt(ram_ea)){
							ramea = Integer.parseInt(ram_ea) - rs.getInt("RAM_EA");
						}
					} else {
						ramea = Integer.parseInt(ram_ea);
					}
				}
				if(rs.getString("GPU")!=null){
					if(rs.getString("GPU").equals(gpu)){
						if(rs.getInt("GPU_EA") != Integer.parseInt(gpu_ea)){
							gpuea = Integer.parseInt(gpu_ea) - rs.getInt("GPU_EA");
						}
					} else {
						gpuea = Integer.parseInt(gpu_ea);
					}
				}
				if(rs.getString("POWER")!=null){						
					if(rs.getString("POWER").equals(power)){
						if(rs.getInt("POWER_EA") != Integer.parseInt(power_ea)){
							powerea = Integer.parseInt(power_ea) - rs.getInt("POWER_EA");
						}
					} else {
						powerea = Integer.parseInt(power_ea);
					}
				}
				if(rs.getString("CASE")!=null){	
					if(rs.getString("CASE").equals(cover)){
						if(rs.getInt("COVER_EA") != Integer.parseInt(cover_ea)){
							coverea = Integer.parseInt(cover_ea) - rs.getInt("COVER_EA");
						}
					} else {
						coverea = Integer.parseInt(cover_ea);
					}
				}

			if(cpu!=""){
				sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, cpu);
				rs = pstmt.executeQuery();
				if(rs.next()){
					if(rs.getInt("PART_EA")<cpuea){
						throw new Exception();
					}
				} 
			}
			if(mb!=""){
				sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, mb);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<mbea){
						throw new Exception("MAINBOARD 재고가 부족합니다.");
					}
				} 
			}
			if(ram!=""){
				sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, ram);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<ramea){
						throw new Exception("RAM 재고가 부족합니다."); 
					}
				} 
			}
			if(gpu!=""){
				sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, gpu);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<gpuea){
						throw new Exception("GPU 재고가 부족합니다.");
					}
				} 
			}
			if(power!=""){
				sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, power);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<powerea){
						throw new Exception("POWER 재고가 부족합니다.");
					}
				} 
			}
			if(cover!=""){
				sqlSelect = "SELECT * FROM COMPONENT WHERE PART_NAME =?";
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, cover);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("PART_EA")<coverea){
						throw new Exception("CASE 재고가 부족합니다.");
					}
				} 
			}

			if(cpu!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?) WHERE PART_NAME = ?";
							pstmt = conn.prepareStatement(sqlUpdate);
							pstmt.setInt(1, cpuea);
							pstmt.setInt(2, cpuea);
							pstmt.setString(3, cpu);
						
							pstmt.executeUpdate(); 
			}

			if(mb!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setInt(1, mbea);
						pstmt.setInt(2, mbea);
						pstmt.setString(3, mb);
					
						pstmt.executeUpdate();
			}
			if(ram!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setInt(1, ramea);
						pstmt.setInt(2, ramea);
						pstmt.setString(3, ram);
					
						pstmt.executeUpdate();
			}
			if(gpu!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setInt(1, gpuea);
						pstmt.setInt(2, gpuea);
						pstmt.setString(3, gpu);
					
						pstmt.executeUpdate();
			}
			if(power!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setInt(1, powerea);
						pstmt.setInt(2, powerea);
						pstmt.setString(3, power);
					
						pstmt.executeUpdate();
			}
			if(cover!=""){
						String sqlUpdate = "UPDATE COMPONENT SET PART_EA= (PART_EA-?), PRODUCTION_EA = (PRODUCTION_EA+?)  WHERE PART_NAME = ?";
						pstmt = conn.prepareStatement(sqlUpdate);
						pstmt.setInt(1, coverea);
						pstmt.setInt(2, coverea);
						pstmt.setString(3, cover);
					
						pstmt.executeUpdate();
			}

			
			String sql = "SELECT * FROM CALENDAR WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			pstmt = null;
			String sqlInsert = "UPDATE CALENDAR SET NAME=?,SUBJECT=?,CONTENT=?,CPU=?,CPU_EA=?,MAINBOARD=?,MAINBOARD_EA=?,RAM=?,RAM_EA=?,GPU=?,GPU_EA=?,POWER=?,POWER_EA=?,CASE=?,CASE_EA=? WHERE NUM=?";
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setString(1, rs.getString("NAME"));
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, cpu);
			pstmt.setInt(5, (rs.getInt("CPU_EA")+cpuea));
			pstmt.setString(6, mb);
			pstmt.setInt(7, (rs.getInt("MAINBOARD_EA")+mbea));
			pstmt.setString(8, ram);
			pstmt.setInt(9, (rs.getInt("RAM_EA")+ramea));
			pstmt.setString(10, gpu);
			pstmt.setInt(11, (rs.getInt("GPU_EA")+gpuea));
			pstmt.setString(12, power);
			pstmt.setInt(13, (rs.getInt("POWER_EA")+powerea));
			pstmt.setString(14, cover);
			pstmt.setInt(15, (rs.getInt("CPU_EA")+coverea));
			pstmt.setString(16, num);
			pstmt.executeUpdate();
			%> <script>clear();</script> <%
			} catch (Exception e){
				e.getStackTrace();
				%> <script>err();</script> <%	
				
			}	finally {
				if(conn!=null){conn.close();}
				if(pstmt!=null){pstmt.close();}
				if(rs!=null){rs.close();}
			}
			
	%>
</body>
</html>