<%@page import="jsp.Quiz.model.QuizDAO"%>
<%@page import="jsp.Quiz.model.QuizVO"%>
<%@page import="jsp.member.model.MemberVO"%>
<%@page import="jsp.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.*" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>내 정보</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/home.css" />
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<link rel="icon" type="image/png" href="../../images/favicon-16x16.png" sizes="16x16">

		<style type="text/css">
			.icons > li {
				font-size: 12px;
			}
			body {
				background-color : #f9f9f9;
				align-content: center;
			}
			* {
    			box-sizing: border-box;
			}
			
			.main {
				display: block;
				margin: 0 auto;
			}
			.auth-form {
				width: 280px;
   				margin: 0 auto;
			}
			.auth-form-body {
				padding: 20px;
				font-size: 14px;
    			background-color: #fff;
    			border: 1px solid #d8dee2;
    			border-radius: 5px;
			}
			.form-control label {
				display: block;
    			margin-bottom: 7px;
    			text-align: left;
    			font-size:15px;
			}
			.form-control .input-block {
				width: 100%;
				display: block;
			}
			label {
				font-weight: 600;
			}
			.form-control > .data {
				display: block;
    			width: 100%;
    			color: #24292e;
    			background-color: #fff;
   				background-repeat: no-repeat;
    			background-position: right 8px center;
    			border: 1px solid #d1d5da;
    			border-radius: 3px;
    			outline: none;
    			padding:6px 8px;

    			min-height: 34px;
    			font-size: 13px;
    			line-height: 20px;
    		
    			margin-top: 5px;
    			margin-bottom: 15px;
			}
			.btnbtn {
				padding:0;
				margin:45px 0 0 0;
				border:none;
			}
			.btnbtn > input {
				display: block;
				width: 100%;
				margin-top: 5px;
    			margin-bottom: 15px;
			}
			input:focus::-webkit-input-placeholder {color:transparent;}
			input:focus::-moz-input-placeholder {color:transparent;}
			input:focus:-ms-input-placeholder {color:transparent;}
			input:focus:-o-input-placeholder {color:transparent;}

			
			/* 진행 상황*/
			.F_BOX {
				max-width: 450px;
				min-width:280px;
   				margin: 0 auto;
			}
			.progressBar {
				background-color:#f1f1f1!important;
				color:#363636;
			}
			.htmlBar {
				background-color: #3366cc!important;
				text-align: center!important;
				color:#363636;
			}
			.cssBar {
				background-color: #f44336!important;
				text-align: center!important;
				color:#363636;
			}
			.javascriptBar {
				background-color:#ff9900!important;
				text-align:center!important;
				color:#363636;
			}
			
			table th {
				text-align:center;
				font-size:15px;
				padding: 0.45em 0.75em;
			}
			table td{
				text-align:center;
				font-size:13px;
			}
		</style>

		<script type="text/javascript">
        
        	// 로그아웃 담당 JSP로 이동
        	function logoutPro(){
            	location.href = "member/pro/LogoutPro.jsp";
        	}

        	// 정보 담당 JSP로 이동
        	function ModifyForm(){
        		location.href="MainForm.jsp?contentPage=member/view/ModifyForm.jsp";
        	}

        	// 탈퇴 담당 JSP로 이동
        	function DeleteForm(){
        		location.href="MainForm.jsp?contentPage=member/view/DeleteForm.jsp";
        	}


    	</script>
	</head>
	<body class="is-preload">
	<jsp:useBean id="memberVO" class="jsp.member.model.MemberVO" />
    <jsp:setProperty property="*" name="memberVO"/> 
		<%
			request.setCharacterEncoding("utf-8");
    		response.setContentType("text/html;charset=utf-8");
    		
        	String session_id = session.getAttribute("sessionID").toString();
        	
        	MemberVO vo = new MemberVO();
    		vo.setMy_id(session_id);
        
        	// 세션에 저장된 아이디를 가져와서
        	// 그 아이디 해당하는 회원정보를 가져온다.
        	MemberDAO dao = MemberDAO.getInstance();
        	
        
        	MemberVO member = dao.getUserInfo(session_id);
    	%>

		<%
			String sessionid = session.getAttribute("sessionID").toString();
			
			// html
			QuizVO qvo = new QuizVO();
			qvo.setId(sessionid);
			QuizDAO qdao = QuizDAO.getInstance();
			QuizVO getHtml = qdao.getHTML(sessionid);
			
			int sum = getHtml.getHtml_0()+getHtml.getHtml_1()+getHtml.getHtml_2();
			float h_sum = ((float)sum/300)*100;
			
			// css
			QuizVO qvo2 = new QuizVO();
			qvo2.setId(sessionid);
			QuizDAO qdao2 = QuizDAO.getInstance();
			QuizVO getCss = qdao2.getCSS(sessionid);
			
			int sum2 = getCss.getCss_0()+getCss.getCss_1();
			float c_sum = ((float)sum2/200)*100;
			
			// javascript
			QuizVO qvo3 = new QuizVO();
			qvo3.setId(sessionid);
			QuizDAO qdao3 = QuizDAO.getInstance();
			QuizVO getJavascript = qdao3.getJAVASCRIPT(sessionid);
			
			int sum3 = getJavascript.getJavascript_0();
			float j_sum = ((float)sum3/100)*100;
			
			// 소수점 아래 두 자리까지만 표시되게 설정
			String format = "#.##";
			java.text.DecimalFormat df = new java.text.DecimalFormat(format);
			
		%>
		<script>
			$(document).ready(function() {
				// html
				var h_text = $('.htmlBar').text();
				var h_width = h_text.substr(0, h_text.length-1);
				
				if( h_width > 0) {
			      	$('.htmlBar').css({
			      		"width":h_width+"%",
			      		"color":"#fff"
			      	});
				} else if(h_width == 0){
					$('.htmlBar').css({
			      		"width":h_width+"%"
			      	});
				}
				
				// css
				var c_text = $('.cssBar').text();
				var c_width = c_text.substr(0, c_text.length-1);
				
				if(c_width > 0) {
					$('.cssBar').css({
						"width":c_width+"%",
						"color":"#fff"
					});
				} else if(c_width == 0){
					$('.cssBar').css({
			      		"width":c_width+"%"
			      	});
				}
				
				// javascript
				var j_text = $('.javascriptBar').text();
				var j_width = j_text.substr(0, j_text.length-1);
				
				if(j_width > 0) {
					$('.javascriptBar').css({
						"width":j_width+"%",
						"color":"#fff"
					});
				} else if(j_width == 0){
					$('.javascriptBar').css({
			      		"width":j_width+"%"
			      	});
				}
				
		    });
		</script>
		
		<script type="text/javascript">
		// Load google charts
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);

		// Draw the chart and set the chart values
		function drawChart() {
  			var data = google.visualization.arrayToDataTable([
  				['Task', 'Hours per Day'],
  				['Html', <%=sum%>],
  				['Css', <%=sum2%>],
  				['JavaScript', <%=sum3 %>]
			]);

  			// Optional; add a title and set the width and height of the chart
  			var options = {'title':'나의 학습 비중', 'max-width':'100%', 'height':'auto'};

  			// Display the chart inside the <div> element with id="piechart"
  			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  			chart.draw(data, options);
		}
		</script>
		
		<!-- Section -->
		<section>
			<header class="major">
				<h2>내 정보</h2>
			</header>
			<div class="auth-form" id="signup">
				<div class="auth-form-body">
					<div class="form-control">
						<label>이름</label>
						<div class="data"><%=member.getMy_name() %></div>

						<label>이메일</label>
						<div class="data"><%=member.getMy_email() %></div>

						<label>아이디</label>
						<div class="data"><%=member.getMy_id() %></div>

						<label>비밀번호</label>
						<div class="data"><%=member.getMy_pwd() %></div>
													
						<label>가입날짜</label>
						<div class="data"><%=member.getMy_joinDate() %></div>
						
						<div class="btnbtn">
							<input type="button" name="commit" value="정보변경" class="signup-btn" onclick="ModifyForm()">
							<input type="button" name="commit" value="탈퇴하기" class="signup-btn" onclick="DeleteForm()">
						</div>
					</div>
				</div>
			</div>
		</section>
		
		
		<!-- Section -->
		<section>
			<header class="major">
				<h2>진행상황</h2>
			</header>
			
			<div class="F_BOX" id="BOX">
				<div class="auth-form-body">
					<div class="form-control">
						<label>HTML</label>
						<div class="progressBar">
							<div class="htmlBar"><%=df.format(h_sum) %>%</div>
						</div>
						<br>
						<label>CSS</label>
						<div class="progressBar">
							<div class="cssBar"><%=df.format(c_sum) %>%</div>
						</div>
						<br>
						<label>JAVASCRIPT</label>
						<div class="progressBar">
							<div class="javascriptBar"><%=df.format(j_sum) %>%</div>
						</div>
					</div>
					<hr>
					<br><br>
					<div id="piechart"></div>
					<br><br>
					<div>
						<div><strong>총 합점</strong></div>
						<strong>HTML :</strong> <%=sum %> &emsp;<strong>CSS :</strong> <%=sum2 %> &emsp;<strong>JavaScript :</strong> <%=sum3 %>
					</div>
					<br>
					<div>
						<table style="text-align:center;">
  							<tr>
    							<th>Chapter</th>
    							<th>Score</th>
  							</tr>
  							<tr>
    							<td>HTML 소개</td>
    							<td><%=getHtml.getHtml_0() %> 점</td>
  							</tr>
  							<tr>
    							<td>HTML 편집기</td>
    							<td><%=getHtml.getHtml_1() %> 점</td>
  							</tr>
  							<tr>
    							<td>HTML 기본</td>
    							<td><%=getHtml.getHtml_2() %> 점</td>
  							</tr>
  							
  							<tr>
    							<td>CSS 소개</td>
    							<td><%=getCss.getCss_0() %> 점</td>
  							</tr>
  							<tr>
    							<td>CSS 기본</td>
    							<td><%=getCss.getCss_1() %> 점</td>
  							</tr>
  							<tr>
    							<td>JavaScript 소개</td>
    							<td><%=getJavascript.getJavascript_0() %> 점</td>
  							</tr>
  
						</table>
					</div>
				</div>
			</div>
		</section>
		
			
		<!-- Scripts -->
		<script src="../../assets/js/jquery.min.js"></script>
		<script src="../../assets/js/browser.min.js"></script>
		<script src="../../assets/js/breakpoints.min.js"></script>
		<script src="../../assets/js/util.js"></script>
		<script src="../../assets/js/home.js"></script>

	</body>
</html>