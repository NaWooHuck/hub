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
<link rel="stylesheet" href="./css/Main.css">
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
 	
 	<%@ include file="header.jsp" %>
	
	<%
		String empname = (String) session.getAttribute("emp_name");
	
		if (empname == null || empname.isEmpty()) {
    	response.sendRedirect("compuzoonLoginForm.jsp");
		}
		
		String ye = request.getParameter("year");
		String mo = request.getParameter("month");
		
		int year;
		int month;
		LocalDate now = LocalDate.now();
		
		if(ye==null){
			year = now.getYear();
			month = now.getMonthValue();
			
		} else {
			year = Integer.parseInt(ye);
			month = Integer.parseInt(mo);
		}
		
		DBConfig dbc = new DBConfig();
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		int date = 1;       // 일
		int day;            // 요일
		
		LocalDate firstDate = LocalDate.of(year, month, date); // 해당월 1일 설정
		day = firstDate.getDayOfWeek().getValue();
		
		
	%>
  <div class="box">
    <div id="side-div">a</div>
    <div id="box1">
      <div id="box2">
      	<div>
      		<form action="Main.jsp" method="get">
			      <select name="year" id="ye">
			      <%System.out.println(String.valueOf(now.getYear()-1).equals(ye)); %>
			      	<option value="">선택하세요</option>
			      	<option value="<%=now.getYear()+2%>" <%=String.valueOf(now.getYear()+2).equals(ye) ? "selected" : null %>><%=now.getYear()+2%>년</option>
			      	<option value="<%=now.getYear()+1%>" <%=String.valueOf(now.getYear()+1).equals(ye) ? "selected" : null %>><%=now.getYear()+1%>년</option>
			        <option value="<%=now.getYear()%>" <%=String.valueOf(now.getYear()).equals(ye) ? "selected" : null %>><%=now.getYear()%>년</option>
			        <option value="<%=now.getYear()-1%>" <%=String.valueOf(now.getYear()-1).equals(ye) ? "selected" : null %>><%=now.getYear()-1%>년</option>
			        <option value="<%=now.getYear()-2%>" <%=String.valueOf(now.getYear()-2).equals(ye) ? "selected" : null %>><%=now.getYear()-2%>년</option>
			        <option value="<%=now.getYear()-3%>" <%=String.valueOf(now.getYear()-3).equals(ye) ? "selected" : null %>><%=now.getYear()-3%>년</option>
			      </select>
			      <select name="month" id="mon">
			      	<option value="">선택하세요</option>
			        <option value="1" <%=String.valueOf("1").equals(mo) ? "selected" : null %>>1월</option>
			        <option value="2" <%=String.valueOf("2").equals(mo) ? "selected" : null %>>2월</option>
			        <option value="3" <%=String.valueOf("3").equals(mo) ? "selected" : null %>>3월</option>
			        <option value="4" <%=String.valueOf("4").equals(mo) ? "selected" : null %>>4월</option>
			        <option value="5" <%=String.valueOf("5").equals(mo) ? "selected" : null %>>5월</option>
			        <option value="6" <%=String.valueOf("6").equals(mo) ? "selected" : null %>>6월</option>
			        <option value="7" <%=String.valueOf("7").equals(mo) ? "selected" : null %>>7월</option>
			        <option value="8" <%=String.valueOf("8").equals(mo) ? "selected" : null %>>8월</option>
			        <option value="9" <%=String.valueOf("9").equals(mo) ? "selected" : null %>>9월</option>
			        <option value="10" <%=String.valueOf("10").equals(mo) ? "selected" : null %>>10월</option>
			        <option value="11" <%=String.valueOf("11").equals(mo) ? "selected" : null %>>11월</option>
			        <option value="12" <%=String.valueOf("12").equals(mo) ? "selected" : null %>>12월</option>
			      </select>
			      <input type="submit" value="검색">
			    </form>
		    </div>
    </div>
    <div id="collecter">
        <div class="day">SUNDAY</div>
        <div class="day">MONDAY</div>
        <div class="day">TUESDAY</div>
        <div class="day">WENSDAY</div>
        <div class="day">THURSDAY</div>
        <div class="day">FRIDAY</div>
        <div class="day">SATURDAY</div>
        <%				
				try{
					conn = dbc.getConnection();
					
					
					
			    
			    for (int i = 0; i < day % 7; i++) {
			    	%>
			    	<div class="none"></div>
			    	<%
			    }
			    
			    for(int i=1; i<=firstDate.lengthOfMonth(); i++) {
		       
			    	String dates = "";
						if(month<10 && date<10){
							dates = String.valueOf(year)+"-0"+String.valueOf(month)+"-0"+String.valueOf(date);
							}	else if(month<10) {
								dates = String.valueOf(year)+"-0"+String.valueOf(month)+"-"+String.valueOf(date);
							} else if(date<10){
								dates = String.valueOf(year)+"-"+String.valueOf(month)+"-0"+String.valueOf(date);
						}
						
						
							
						String sql = "SELECT * FROM CALENDAR WHERE TO_CHAR(PRODUCTION_DATE,'YYYY-MM-DD') LIKE ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, dates);
						rs = pstmt.executeQuery();
				
		    		%><div class="date">
								<div class="date_num">   <%=   date %>
									<a href="InsertCalendarForm.jsp?date=<%=dates %>&name=<%=session.getAttribute("emp_name")%>" class="material-symbols-outlined" id="add">add</a>
							</div>
							
							<%
							date++;

							for(int j =0; j<2; j++){
								if(rs.next()){
								%>
								
								<div class="date_note">
									<a href="noteForm.jsp?NUM=<%=rs.getString("NUM")%>&&date=<%=dates%>">
									<div class="date_subject"><%=rs.getString("SUBJECT") %></div> 
									<div class="date_content"><%=rs.getString("CONTENT") %></div>
									</a>
								</div>
								<%
								}
							}
							%>
	        </div> <%
	        day++;
	    }

		} catch (Exception e){
			
		} finally{
			if(conn != null){conn.close();}
			if(pstmt != null){pstmt.close();}
		}
        %>
        
        <script>
        $(document).ready(function(){
					/*	let i =1;
        	  $(".date_num:nth-child("+i+")").mouseover(function(){
        	    	$(".date_num:nth-child("+i+") .material-symbols-outlined").removeClass("hide");

							console.log("확인");
        	  });

        	  $(".collecter .date:nth-child("+i+")").mouseout(function(){
        		  	$(".date_num:nth-child("+i+") .material-symbols-outlined").addClass("hide");

        		  console.log("확인2");
        	  });
        });*/
        
        	
        </script>
    </div>
   </div>
  </div>
</body>

</html>
