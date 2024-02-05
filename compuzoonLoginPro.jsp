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
		int result = 0;
		String emp_name="";
		String emp_position="";
		
		try {
			stmt = conn.createStatement();	// 2-1. Statement 생성
			rs = stmt.executeQuery("SELECT COUNT(*) AS CNT FROM EMPLOYEES_EX	WHERE EMP_ID='" + emp_id + "' AND EMP_PW='" + emp_pw + "'");
			
			while(rs.next()) {
				result = rs.getInt("CNT");
			
			}
			if(result ==1) { 
				rs = stmt.executeQuery("SELECT EMP_NAME, EMP_POSITION 	FROM EMPLOYEES_EX	WHERE EMP_ID= '" + emp_id+ "'");
				
				while(rs.next()) {
				  emp_name = rs.getString("EMP_NAME");
				  emp_position = rs.getString("EMP_POSITION");
				  
				  session.setAttribute("emp_name", emp_name);
				  session.setAttribute("emp_position", emp_position);
				}

				out.println("<script>location.href='compuzoonMain.jsp'</script>");
				
				
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