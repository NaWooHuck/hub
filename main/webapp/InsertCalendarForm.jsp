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
<link rel="stylesheet" href="./css/InsertCalendarForm.css">
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%
		String date = request.getParameter("date");
		//session.setAttribute("date", date);
		DBConfig db = new DBConfig();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = db.getConnection();
			
		
		
	%>
	
	<%@include file="header.jsp" %>
	
	<div class="box">
    <div id="side-div">a</div>
    <div id="box1">
    	<div id="form">
    		<div id="inform">
		    	<form action="InsertCalendarPro.jsp" method="get" id='form1' onSubmit="return false;">
			    	<div class="subject">제목 : <input id="subject-name" name="subject" type="text"></div>
			    	<div class="content">비고 : <input id="content-name" name="content" type="text"></div>
			    	<div class="part">CPU   : 
			    		<select id="cpu-name" name="cpu">
			    			<option value="">선택하세요</option>
			    			<%
			    				String cpuSql = "SELECT * FROM COMPONENT WHERE PART = 'CPU'";
			    				pstmt = conn.prepareStatement(cpuSql);
			    				rs = pstmt.executeQuery();
			    				
			    				while(rs.next()){
			    					%><option value="<%=rs.getString("PART_NAME")%>"><%=rs.getString("PART_NAME")%></option> <%
			    				}
			    			%>
			    			<input type="text" name="cpu-ea">ea
			    		</select> 
			    	</div>
			    	<div class="part">MB   : 
			    		<select id="mb-name" name="mb">
			    			<option value="">선택하세요</option>
			    			<%
			    				String mbSql = "SELECT * FROM COMPONENT WHERE PART = 'MB'";
			    				pstmt = conn.prepareStatement(mbSql);
			    				rs = pstmt.executeQuery();
			    				
			    				while(rs.next()){
			    					%><option value="<%=rs.getString("PART_NAME")%>"><%=rs.getString("PART_NAME")%></option> <%
			    				}
			    			%>
			    			<input type="text" name="mb-ea">ea
			    			</select> 
			    	</div>
			    	<div class="part">RAM   : 
			    		<select id="ram-name" name="ram">
			    			<option value="">선택하세요</option>
			    			<%
			    				String ramSql = "SELECT * FROM COMPONENT WHERE PART = 'RAM'";
			    				pstmt = conn.prepareStatement(ramSql);
			    				rs = pstmt.executeQuery();
			    				
			    				while(rs.next()){
			    					%><option value="<%=rs.getString("PART_NAME")%>"><%=rs.getString("PART_NAME")%></option> <%
			    				}
			    			%>
			    			<input type="text" name="ram-ea">ea
			    			</select> 
			    	</div>
			    	<div class="part">GPU   : 
			    		<select id="gpu-name" name="gpu">
			    			<option value="">선택하세요</option>
			    			<%
			    				String gpuSql = "SELECT * FROM COMPONENT WHERE PART = 'GPU'";
			    				pstmt = conn.prepareStatement(gpuSql);
			    				rs = pstmt.executeQuery();
			    				
			    				while(rs.next()){
			    					%><option value="<%=rs.getString("PART_NAME")%>"><%=rs.getString("PART_NAME")%></option> <%
			    				}
			    			%>
			    			<input type="text" name="gpu-ea">ea
			    			</select> 
			    	</div>
			    	<div class="part">POWER   : 
			    		<select id="power-name" name="power">
			    			<option value="">선택하세요</option>
			    			<%
			    				String pwSql = "SELECT * FROM COMPONENT WHERE PART = 'POWER'";
			    				pstmt = conn.prepareStatement(pwSql);
			    				rs = pstmt.executeQuery();
			    				
			    				while(rs.next()){
			    					%><option value="<%=rs.getString("PART_NAME")%>"><%=rs.getString("PART_NAME")%></option> <%
			    				}
			    			%>
			    			<input type="text" name="pw-ea">ea
			    			</select> 
			    	</div>
			    	<div class="part">CASE   : 
			    		<select id="case-name" name="case">
			    			<option value="">선택하세요</option>
			    			<%
			    				String csSql = "SELECT * FROM COMPONENT WHERE PART = 'CASE'";
			    				pstmt = conn.prepareStatement(csSql);
			    				rs = pstmt.executeQuery();
			    				
			    				while(rs.next()){
			    					%><option value="<%=rs.getString("PART_NAME")%>"><%=rs.getString("PART_NAME")%></option> <%
			    				}
			    				
		} catch (Exception e){
			e.getMessage();
		} finally {
			if(conn!=null){conn.close();}
			if(pstmt!=null){pstmt.close();}
			if(rs!=null){rs.close();}
		}
			    			%>
			    			<input type="text" name="cs-ea">ea
			    			</select> 
			    	</div>
			    	<div id="button">
			    		<input  type="submit" value="작성" onClick="javascript: chk();">
		    		</div>
		    	</form>
		    </div>	
	    </div>
    </div>
  </div>
  <script>
  	
  	function chk(){
  		
  		if($("#subject-name").val()==null || $("#subject-name").val()=="" ){
  			alert("제목을 입력하세요");
  			$("#subject-name").focus();
  			return false;
  		}
  		
  		if($("#content-name").val()==null || $("#content-name").val()=="" ){
  			alert("비고를 입력하세요");
  			$("#content-name").focus();
  			return false;
  		}
  		
  		if($("#cpu-name").val()=="" || $("#cpu-name").val()==null){
  			if($("#mb-name").val()=="" || $("#mb-name").val()==null){
  				if($("#ram-name").val()=="" || $("#ram-name").val()==null){
  					if($("#gpu-name").val()=="" || $("#gpu-name").val()==null){
  						if($("#power-name").val()=="" || $("#power-name").val()==null){
  							if($("#case-name").val()=="" || $("#case-name").val()==null){
					  			alert("제품을 선택하세요");
					  			return false;
  							}
  						}
  					}
  				}
  			}
  		}
  		document.getElementById('form1').submit();
  	}
  </script>
</body>
</html>