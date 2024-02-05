<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="utils.DBConfig" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.text.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		request.setCharacterEncoding("UTF-8");
		
		String empid = request.getParameter("emp_Id");
		String empname = request.getParameter("emp_Name");
		String emppw = request.getParameter("emp_Pw");
		String position = request.getParameter("position");
		
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		
		Exception exception = null;
		
		String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
  		String USER = "semi_project3";
  		String PASSWORD = "123453";

		

		try {
		  	Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		}catch(SQLException se) {
			out.println("접속 실패");
		}
		

		try {
		  	//회원 가입 정보 저장, ID, PW, 직급
			String sql = "INSERT INTO EMPLOYEES_EX (EMP_ID, EMP_NAME, EMP_PW, EMP_POSITION)  VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empid);
			pstmt.setString(2, empname);
			pstmt.setString(3, emppw);
			pstmt.setString(4, position);
			
			pstmt.executeUpdate();   
			
			out.println("<script>location.href='compuzoonLoginForm.jsp'</script>");	
						
		}catch(SQLException se) {
		  System.out.println("DB 입력오류: " + se);
		}
	%>

</body>
</html>



</body>
</html>