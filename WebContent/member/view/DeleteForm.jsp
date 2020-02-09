<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
			
			.form-control > input {
				display: block;
				width: 100%;
				margin:10px 0;
			}
			input:focus::-webkit-input-placeholder {color:transparent;}
			input:focus::-moz-input-placeholder {color:transparent;}
			input:focus:-ms-input-placeholder {color:transparent;}
			input:focus:-o-input-placeholder {color:transparent;}
			
			#pwd {margin-bottom:25px;}

		</style>

		<script type="text/javascript">
        
        	// 로그아웃 담당 JSP로 이동
        	function logoutPro(){
            	location.href = "member/pro/LogoutPro.jsp";
        	}

        	// 비밀번호 미입력시 경고창
        	function checkValue(){
            	if(!document.deleteform.password.value){
                	alert("비밀번호를 입력하지 않았습니다.");
                	return false;
            	}
        	}

    	</script>
	</head>
	<body class="is-preload">


		<!-- Section -->
		<section>
			<header class="major">
				<h2>회원탈퇴</h2>
			</header>
			<div class="auth-form" id="signup">
				<form id="frmmember" name="frmmember" method="post" action="MainForm.jsp?contentPage=member/pro/DeletePro.jsp" onsubmit="return checkValue()">
					<div class="auth-form-body">
						<div class="form-control">
											
							<label>비밀번호</label>
							<input type="password" name="pwd" id="pwd" placeholder="Password">

							<input type="button" value="취소" onclick="UserInfoForm()">
        					<input type="submit" value="탈퇴" /> 

						</div>
					</div>
				
				</form>
			</div>
		</section>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/home.js"></script>

	</body>
</html>