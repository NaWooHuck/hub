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
			      	<option value="">선택하세요</option>
			        <option value="<%=now.getYear()%>"><%=now.getYear()%>년</option>
			        <option value="<%=now.getYear()-1%>"><%=now.getYear()-1%>년</option>
			        <option value="<%=now.getYear()-2%>"><%=now.getYear()-2%>년</option>
			        <option value="<%=now.getYear()-3%>"><%=now.getYear()-3%>년</option>
			      </select>
			      <select name="month" id="mon">
			      	<option value="">선택하세요</option>
			        <option value="1">1월</option>
			        <option value="2">2월</option>
			        <option value="3">3월</option>
			        <option value="4">4월</option>
			        <option value="5">5월</option>
			        <option value="6">6월</option>
			        <option value="7">7월</option>
			        <option value="8">8월</option>
			        <option value="9">9월</option>
			        <option value="10">10월</option>
			        <option value="11">11월</option>
			        <option value="12">12월</option>
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
							
							while(rs.next()){
								%>
								<div class="date_note">
									<a href="noteForm.jsp?date=<%=dates%>">
									<div class="date_subject"><%=rs.getString("SUBJECT") %></div> 
									<div class="date_content"><%=rs.getString("CONTENT") %></div>
									</a>
								</div>
								<%
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