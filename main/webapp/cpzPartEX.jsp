<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="utils.DBConfig" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="./css/cpzPart.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<!-- 화살표 위 아래 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script defer src="./js/jquery-3.7.1.min.js"></script>

<title>CompuZoon</title>
</head>

<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 24
}
</style>


<body>

	<h1>재고 페이지</h1>

<%
		//한글 처리
		request.setCharacterEncoding("UTF-8");

		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String setMpart = "";
		
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		Statement stmt = null;
		ResultSet rs = null;	
				
		
		String cpzMpart = request.getParameter("m-part");
		String cpzSpart = request.getParameter("s-part");
		
		try {
			conn = DBConfig.getConnection(); 
			
		}catch(SQLException se) {
			out.println("접속 실패");
		}
%>

<div class="section-container">
		<div class="cpz-select-part">
			<form action="./cpzPartEX.jsp" method="get">
													
			<!-- 드롭박스 1 -->
											  <!-- getMpart(this) 다중 셀렉트 -->
			<select id="m-part" name="m-part" onchange="getMpart(this)">
				<option value="ALL" selected>ALL</option>
 				<option value="CPU">CPU</option>
				<option value="MAINBOARD">MAINBOARD</option>
				<option value="GPU">GPU</option>
				<option value="RAM">RAM</option>
				<option value="POWER">POWER</option>
				<option value="CASE">CASE</option>
			</select>
											  <!-- getSpart(this) 셀렉트 값 확인용 -->
			<select id="s-part" name="s-part" onchange="getSpart(this)">
				<option value="ALL" >ALL</option>
			</select>
			
			<!-- 드롭박스 2 -->
				<input type="submit" value="Search" />			
			</form>
		</div>

	<div class="section-div">
		<div>
			Part
		</div>
		<div>
			Part_Name
		</div>
		<div>
			EA
		</div>
		<div>
			생산대기
		</div>
	</div>	


<%
	//재고 페이지 진입시 선택 값 없음 / 전체 ALL 일시 -> COMPONENT 테이블 전체 검색
	if(cpzMpart == null || cpzMpart.equals("ALL")) {
		try {
			String insertQuery = "SELECT PART, PART_NAME, PART_EA, PRODUCTION_EA FROM COMPONENT ORDER BY PART";
			pstmt = conn.prepareStatement(insertQuery);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			%>
				<div class="part-Detail">
					<div>
						<span><%=rs.getString("PART")%></span>
					</div>
					<div>
						<span><%=rs.getString("PART_NAME")%></span>
					</div>	
					<div class="item-wrap">
						<div class="item-minus">
							<span class="material-symbols-outlined">expand_circle_down</span>
						</div>
							<span><%=rs.getInt("PART_EA")%></span>
						<div class="item-plus">
							<span class="material-symbols-outlined">expand_circle_up</span>
						</div>
					</div>
					<div>
						<span><%=rs.getInt("PRODUCTION_EA")%></span>
					</div>			
				</div>
			<%
			}
			
		}catch(SQLException se) {
			System.out.println("se: " + se);
		}
	}

%>

			<!-- 검색 결과 상세 -->		

<%
		System.out.println(cpzMpart);	//값 확인
		System.out.println(cpzSpart);	//값 확인
		
		//2번째 셀렉트박스 미선택시 해당 파트 전체 검색
		 if(cpzSpart == null || cpzSpart.equals("ALL")) {
		   
		   try {
			    pstmt = conn.prepareStatement("SELECT PART, PART_NAME, PART_EA, PRODUCTION_EA FROM COMPONENT WHERE PART = ? ");
			    pstmt.setString(1, cpzMpart);
			    
			    rs = pstmt.executeQuery();
			    while(rs.next()) {
						 %>
							<div class="part-Detail">
								<div>
									<span><%=rs.getString("PART")%></span>
								</div>
								<div>
									<span><%=rs.getString("PART_NAME")%></span>
								</div>	
								<div class="item-wrap">
									<div class="item-minus">
										<span class="material-symbols-outlined">expand_circle_down</span>
									</div>
										<span><%=rs.getInt("PART_EA")%></span>
									<div class="item-plus">
										<span class="material-symbols-outlined">expand_circle_up</span>
									</div>
								</div>
								<div>
									<span><%=rs.getInt("PRODUCTION_EA")%></span>
								</div>			
							</div>
							 
						<%
						}
					}catch(SQLException se) {
						System.out.println("se: " + se);
					}
		 }  
		    
		try {
			String insertQuery = "SELECT PART, PART_NAME, PART_EA, PRODUCTION_EA FROM COMPONENT	WHERE PART = ? AND MANUFACTURER = ? ";
			pstmt = conn.prepareStatement(insertQuery);
			pstmt.setString(1, cpzMpart);
			pstmt.setString(2, cpzSpart);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			 %>
				<div class="part-Detail">
					<div>
						<span><%=rs.getString("PART")%></span>
					</div>
					<div>
						<span><%=rs.getString("PART_NAME")%></span>
					</div>
						<div class="item-wrap">
							<div class="item-minus">
								<span class="material-symbols-outlined">expand_circle_down</span>
							</div>
								<span><%=rs.getInt("PART_EA")%></span> 
							<div class="item-plus">
								<span class="material-symbols-outlined">expand_circle_up</span>
							</div>
						</div>
					</div>
					<div>
						<span><%=rs.getInt("PRODUCTION_EA")%></span>
					</div>			
				</div>
			<%
			}
		}catch(SQLException se) {
			System.out.println("se: " + se);
		}
%>
</div>
	
<script>
//다중 셀렉트
//제품 추가 필요시 추가 작성 필요
function getMpart(option) {
  	var mpart_all = ["ALL"];	// 전체 검색 값이므로 변경 X
  	var mpart_cpu = ["ALL", "INTEL","AMD"];
  	var mpart_mainboard = ["ALL", "ASUS","GIGABYTE","MSI"];
  	var mpart_gpu = ["ALL", "NVIDIA","AMD"];
  	var mpart_ram = ["ALL", "SAMSUNG","SK","MICRON"];
  	var mpart_power = ["ALL", "SEASONIC","MICRONICS"];
  	var mpart_case = ["ALL", "LIANLI","ABKO","THERMALTAKE"];
  	var target = document.getElementById("s-part");
  	
  	if(option.value =="ALL") 		     var s_part = mpart_all; // 전체 검색 값이므로 변경 X
  	else if(option.value =="CPU") 		 var s_part = mpart_cpu;
  	else if(option.value == "MAINBOARD") var s_part = mpart_mainboard;
  	else if(option.value == "GPU")		 var s_part = mpart_gpu;
  	else if(option.value == "RAM") 		 var s_part = mpart_ram;
  	else if(option.value == "POWER") 	 var s_part = mpart_power;
  	else if(option.value == "CASE") 	 var s_part = mpart_case;
  	
  	target.options.length = 0;

  	for ( x in s_part) {
  	  var opt = document.createElement("option");
  	  opt.value = s_part[x];
  	  opt.innerHTML = s_part[x];
  	  target.appendChild(opt);
  	}
}
</script>

<script>
//셀렉트 옵션 값 확인
function getSpart(option) {
	var cpzElement2 = document.querySelector('#s-part');
	var spartValue = cpzElement2.options[cpzElement2.selectedIndex].value;
	console.log(spartValue);
}
</script>



<script>
//클릭시 값 증가
function 

//클릭시 값 감소

//이후 DB에 값 전달?..
</script>


</body>
</html>