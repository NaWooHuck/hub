<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="utils.DBConfig" %> 
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/cpzMain.css" />
<title>CompuZoon</title>
</head>
<body>
	<h1>여긴 메인화면</h1>
	
	
	<div>
		<div>
		이름: <%= session.getAttribute("emp_name") %>
		직급: <%= session.getAttribute("emp_position")  %>
		</div>
	</div>
	
	
	 <div class="header">
    <div id="name">컴퓨준</div>
    <div id="log-out">
      <a href="compuzoonLoginForm.jsp"><input type="button" value="log-out"></a>
    </div>
  </div>

  <div class="box">
    <div id="side-div">a</div>
    <div id="box1">a
      <div id="box2">
      <select name="year" id="ye">
        <option value="">2005년</option>
        <option value="">2006년</option>
        <option value="">2007년</option>
        <option value="">2008년</option>
      </select>
      <select name="month" id="mon">
        <option value="">1월</option>
        <option value="">2월</option>
        <option value="">3월</option>
        <option value="">4월</option>
        <option value="">5월</option>
        <option value="">6월</option>
        <option value="">7월</option>
        <option value="">8월</option>
        <option value="">9월</option>
        <option value="">10월</option>
        <option value="">11월</option>
        <option value="">12월</option>
      </select>
    </div>
    <div id="collecter">
        <table>
        <th>SUNDAY</th>
        <th>MONDAY</th>
        <th>TUESDAY</th>
        <th>WENSDAY</th>
        <th>THURSDAY</th>
        <th>FRIDAY</th>
        <th>SATURDAY</th>
        <tr>
        </tr>
        <td></td>
      </table>
        </div>
      </div>
      </div>
	
	
	
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
  	Connection conn = null; 
	Statement stmt = null; 
	ResultSet rs = null;
	
	Exception exception = null;
	
	
	try {
		conn = DBConfig.getConnection(); 
		
		stmt = conn.createStatement();	
	 	rs = stmt.executeQuery("SELECT SUBJECT, CONTENT, PRODUCTION_DATE, CREATION_DATE FROM CALENDAR_EX");
	 		 	
		while(rs.next()) {
		%>
		<div>
		  <ul>
		  	<li><%= rs.getDate("PRODUCTION_DATE")%></li>
		  	<li><%= rs.getString("SUBJECT") %></li>
		  	<li><%= rs.getString("CONTENT") %></li>
		  </ul>
		 </div> 	
		<% 		 		
		} // while 닫기			
	}catch(SQLException se) {
		out.println("접속 실패");
	}
	%>	
</body>
</html>