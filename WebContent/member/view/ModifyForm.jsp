<%@page import="jsp.member.model.MemberVO"%>
<%@page import="jsp.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정하기</title>

<link rel="stylesheet" href="assets/css/home.css" />
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
			}
			.form-control .input-block {
				width: 100%;
				display: block;
			}
			label {
				font-weight: 600;
			}
			.form-control > .data, .form-control > input {
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
			

		</style>
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
		<script>
			// 정보확인 담당 JSP로 이동
			function UserInfoForm(){
				location.href="MainForm.jsp?contentPage=member/view/UserInfoForm.jsp";
			}
			
			// 정보수정 담당 JSP로 이동
			function ModifyPro(){
				var frmmember = document.frmmember;
				var id = document.getElementById("id");
				var pwd = document.getElementById("pwd").toString();
				var name = document.getElementById("name");
				var email = document.getElementById("email");
				
				var re0 = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;	// 이름 (한,영) 혼용x
				var re1 = /^[a-zA-Z0-9]{4,12}$/; // 패스워드가 적합한지 검사할 정규식
				var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	// 이메일이 적합한지 검사할 정규식
				
				/*이름 확인*/
				if(name.value == "" || name.length==0) {
					alert("이름을 입력해주세요.");
					name.focus();
					return false;//현재 submit이벤트를 중지하는 개념(즉, 전송을 막는다->페이지안넘김)
				}
				if(!check(re0, name, "적합하지 않은 이름 형식입니다.")) {
					return false;
				}

				/*이메일 확인*/
				if(email.value == "" || email.length == 0) {
					alert("이메일을 입력해주세요.");
					email.focus();
					return false;
				}
				if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
					return false; 
				}

				/*아이디 확인*/
				if(id.value == "" || id.length == 0) {
					alert("아이디를 입력해주세요.");
					id.focus();
					return false;
				}
				if(!check(re1, id, "적합하지 않은 아이디 형식입니다.")) {
					return false; 
				}

				/*비밀번호 확인*/
				if(pwd.value == "" || pwd.length == 0) {
					alert("비밀번호를 입력해주세요.");
					pwd.focus();
					return false;
				}
				if(pwd.value == "" || !check(re1, pwd, "적합하지 않은 비밀번호 형식입니다.")) {
					return false;
				}
				
				else {
					frmmember.mathod = "post";
					frmmember.action = "MainForm.jsp?contentPage=member/pro/ModifyPro.jsp";
					frmmember.submit();
				}
				
			}
			
			function check(re, what, message) {
	       		if(re.test(what.value)) {
	           		return true;
	       		}
	       		alert(message);
	       		what.value = "";
	       		what.focus();
	       		//return false;
	   		}
			
			// 탈퇴담당 JSP로 이동
			function DeleteForm(){
				location.href="MainForm.jsp?contentPage=member/view/DeleteForm.jsp";
			}
			
			
			
			
			function checkValue() {
	            if(!document.userInfo.password.value){
	                alert("비밀번호를 입력하세요.");
	                return false;
	            }
	        }


		</script>

</head>
<body>
	<!-- Section -->
	<section>
		<header class="major">
			<h2>정보 수정</h2>
		</header>
		<div class="auth-form" id="signup">
			<form method="post" action="MainForm.jsp?contentPage=member/pro/ModifyPro.jsp" id="frmmember" name="frmmember">
				<div class="auth-form-body">
					<div class="form-control">
						<label>이름 (변경불가)</label>
						<div class="data"><%=member.getMy_name() %><input type="hidden" id="name" name="name" value="<%=member.getMy_name() %>"></div>

						<label>이메일</label>
						<input type="text" id="email" name="email" value="<%=member.getMy_email() %>">
					
						<label>아이디 (변경불가)</label>
						<div class="data"><%=member.getMy_id() %><input type="hidden" id="id" name="id" value="<%=member.getMy_id() %>"></div>

						<label>비밀번호</label>
						<input type="text" id="pwd" name="pwd" value="<%=member.getMy_pwd() %>">
													
						<label>가입날짜 (변경불가)</label>
						<div class="data"><%=member.getMy_joinDate() %></div>

						<div class="btnbtn">
							<input type="button" value="취소" onclick="UserInfoForm()">
							<input type="button" name="commit" value="수정하기" onclick="ModifyPro()">
						</div>
					
					</div>
				</div>
			</form>
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