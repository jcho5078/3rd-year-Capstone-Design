<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE HTML>

<html>
	<head>
		<title>CoPaYou_로그인</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src=https://code.jquery.com/jquery-3.3.1.js></script>
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<link rel="icon" type="image/png" href="../../images/favicon-16x16.png" sizes="16x16">

		<script type="text/javascript">
			function checkValue(){
				inputForm = eval("document.loginInfo");
				var r = false;
				
				if(!inputForm.id.value){
					alert("아이디를 입력하세요");
					inputForm.id.focus();
					return false;
				}
				else if(!inputForm.password.value){
					alert("비밀번호를 입력하세요");
					inputForm.password.focus();
					return false;
				}
				else {
					/*
					loginInfo.method = "post";
					loginInfo.action = "../pro/LoginPro.jsp";
					loginInfo.submit();
					*/
					
					var _id = $("#id").val();
					var _pwd = $("#password").val();

					$.ajax({
						type : "post",
						async : false,
						url : "http://localhost:8090/proc07/LoginCheck",
						dataType : "text",
						data : {
							id: _id,
							pwd: _pwd
						},
						success : function(data, textStatus){
							
							if(data == 'usable'){
								r = true;
								/*
								session.setAttribute("sessionID", id);
								$("#signup-form").attr("method", "post");
								$("#signup-form").attr("action", "../../MainForm.jsp");
								$("#signup-form").submit();
								*/
							} else {
								$('#message').text("아이디 혹은 비밀번호를 확인하세요.");
								setTimeout(function(){
									$('#message').text("");
								},3500);
							}
							
						}	// end success function
					});	// end ajax
					
					if(r == true){
						
						//sessionStorage.setItem('sessionID', _id);		// 현재 세션에 저장이 안되서 LoginPro.jsp에서 페이지 넘어가게함
						loginInfo.method = "post";
						loginInfo.action = "../pro/LoginPro.jsp";
						loginInfo.submit();
					}
					
				}	// end else
			}	// end checkValue

		</script>
		<style>
			#message {
				color:#f56a6a;
				height:2.75em;
				margin-top:0.2em;
			}
			#signup-form .in-form input[type="button"],
  			#signup-form .in-form input[type="submit"] {
    			width: 8.85em;
    			margin: 1em 0 0 0;
    		}
    		form .message {display:none;}
			.forgotPWD {margin:0.5em 0 0 0;}
			.forgotPWD a {border:none; color:rgba(255, 255, 255, 0.35); font-size:0.8em;}
			@media screen and (max-width: 480px) {
				#signup-form input[type="password"] {
					width:18em;
				}
			}
		</style>
	</head>
	<body class="is-preload">
		
		<!-- Header -->
			<header id="header">
				<h1>CoPaYou</h1>
				<p>온라인으로 웹을 시작할 때 공부하기 좋은 간단한 온라인 사이트입니다.<br>CoPaYou를 통해 당신만의 세계를 만들어 보세요.</p>
			</header>

		<!-- Signup Form -->
			<form id="signup-form" name="loginInfo" method="post" action="../pro/LoginPro.jsp">	
				<input type="text" name="id" id="id" placeholder="ID" />
				<input type="password" name="password" id="password" placeholder="Password" />
				<div class="in-form">
					<p class="forgotPWD"><a href="ForgotForm.jsp">비밀번호 찾기</a></p>
					<input type="button" value="로그인" id="main-form-submit" onclick="checkValue()"/>
					<a href="JoinForm.jsp"><input type="button" value="회원가입" id="main-form-button"/></a>
					<input type="hidden" name="command" value="loginCheck" />
				</div>
				<div id="message"></div>
			</form>
		<!-- Footer -->
			<footer id="footer">
				<ul class="icons">
					<li><a href="#" class="icon brands fa-google"><span class="label">Google</span></a></li>
					<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
					<li><a href="#" class="icon brands fa fa-codepen"><span class="label">CodePen</span></a></li>
					<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Lee Hyeong Jun</li><li>&copy; Jang Jong Ho</li><li>&copy; html5up.net</li><li>&copy; w3schools.com</li>
				</ul>
			</footer>
			
		<!-- Scripts -->
			<script src="../../assets/js/main.js"></script>
	</body>
</html>