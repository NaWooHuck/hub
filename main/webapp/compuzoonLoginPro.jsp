<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="utils.DBConfig" %> 
<%@ page import="java.sql.*" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 인증</title>
</head>
<body>

	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String emp_id = request.getParameter("emp_Id");
		String emp_pw = request.getParameter("emp_Pw");
		
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		Statement stmt = null;
		ResultSet rs = null;	
				
		try {
			conn = DBConfig.getConnection(); 
			
		}catch(SQLException se) {
			out.println("접속 실패");
		}
		
		//아이디 비밀번호 체크
		String emp_num="";
		String emp_name="";
		String emp_pos="";
		
		try {
			stmt = conn.createStatement();	// 2-1. Statement 생성
			rs = stmt.executeQuery("SELECT * FROM EMPLOYEES	WHERE EMP_ID='" + emp_id + "' AND EMP_PW='" + emp_pw + "'");
			
			if(rs.next()) { 
	
			  emp_num = rs.getString("EMP_NUM");
			  emp_name = rs.getString("EMP_NAME");
			  emp_pos = rs.getString("EMP_POS");
			  
			  session.setAttribute("emp_num", emp_num);
			  session.setAttribute("emp_name", emp_name);
			  session.setAttribute("emp_pos", emp_pos);
			  
				out.println("<script>location.href='Main.jsp'</script>");
				
				
			} else { 
			  	out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');</script>");	
				out.println("<script>location.href='compuzoonLoginForm.jsp?num='</script>");
			}
			
		}catch(SQLException se) {
			System.out.println("se: " + se);
		}
%>



</body>
</html>