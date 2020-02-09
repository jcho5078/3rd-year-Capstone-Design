<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="FirstView.jsp";
%>


<!DOCTYPE HTML>

<html>
<head>
<title>CoPaYou_Main</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/home.css" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="icon" type="image/png" href="images/favicon-16x16.png" sizes="16x16">

<style type="text/css">
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}
/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #9a9ec8; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #9a9eb1; 
}
#myFormheader{
	text-align:center;
	float:right;
	width:50px;
	cursor: move;
  	z-index: 10;
  	background-color: #9a9ec8;
  	color:#fff;
  	border-radius:10px;
}
#myFormClose{
	text-align:center;
	float:right;
	width:30px;
	cursor: pointer;
  	z-index: 10;
  	background-color: #9a9ec8;
  	color:#fff;
  	border-radius:10px;
  	margin-left:5px;
}
#myFormheader:hover, #myFormClose:hover{background-color:#9a9eb1;}
/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
  	position: fixed;
  	bottom: 70px;
  	right: 15px;
  	font-size: 11px;
  	border: none;
  	outline: none;
  	color: #fff !important;
  	border-radius: 4px;
  	background-color: #f67878;
  	cursor: pointer;
  	padding:0 10px;
}
.open-button:hover {
	color:#fff !important;
  	background-color:#f56a6a !important;
}

/* The popup chat - hidden by default */
.chat-popup {
  /*display: none;*/
  position: fixed;
  bottom: 10px;;
  right: 70px;
  border: 3px solid #9a9ec8;
  border-radius:10px;
  z-index: 10001;
  width: 300px;
  height:480px;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  height:100%;
  padding: 10px;
  background-color: white;
  border-radius:10px;
}

/* Full-width textarea */
.form-container textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 10px 0;
  border: none;
  outline:none;
  background: #f1f1f1;
  resize: none;
  min-height: 80px;
  font-size:12px;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
  outline: none;
}

/* Set a style for the submit/send button */
.form-container .btn {
  background-color: white;
  color: #9a93ad !important;
  padding: 0px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
  align-content: center;
  font-size: 12px;
  outline: none;
  color: white;
  box-shadow:inset 0 0 0 2px #9a9ec8;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
.code_bg {
	background-color: #f1f1f1;
	padding: 16px;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12) !important;
}

.code {
	border-left: 3px solid #f56a6a;
	background-color: #fff;
	font-family: Consolas, "courier new";
	font-size: 16px;
	line-height: 1.5;
	padding: 5px 10px;
}

.code span {
	margin: px 0;
}

.code_t {
	color: mediumblue;
}

.code_p, .code_e {
	color: brown;
}

.code_h {
	color: red;
}

.icons>li {
	font-size: 12px;
}


/* top버튼 */
.top {
	display: none;
  	position: fixed;
  	bottom: 15px;
  	right: 15px;
  	z-index: 999;
  	font-size: 12px;
  	border: none;
  	outline: none;
  	background-color: #f67878;
  	color: #fff;
  	cursor: pointer;
  	padding: 12px;
  	border-radius: 4px;
}
      

.top:hover {
  	color:#fff !important;
  	background-color:#f56a6a !important;
}

</style>

		<script type="text/javascript">
			$('#text').text("");
		
			// 로그아웃 담당 JSP로 이동
			function logoutPro() {
				location.href = "member/pro/LogoutPro.jsp";
			}

			// 정보수정 담당 JSP로 이동
			function UserInfoForm() {
				location.href = "MainForm.do?contentPage=member/view/UserInfoForm.jsp";
			}

			// HTML, CSS, JAVASCRIPT 등 컨텐츠 순서에 맞게 SlideBar에 css 적용
			function url() {
				var url = window.location.href;
				var what = [ 'Html', 'Css', 'Javascript' ];
				var m = "opener_";
				var under = url.indexOf("_");
				var end = url.lastIndexOf(".jsp");
				var a = url.slice(under + 1, end);

				var n = Number(a);

				for (var i = 0; i < what.length; i++) {
					if (url.match(what[i]) != null)
						m += url.match(what[i]);
				}
				var id = $('#' + m).attr('id');

				$('#' + id).click();
				$('#' + id).next().children('li').eq(n).css("color", "#f56a6a")
						.css("font-weight", "600");

			}
		</script>
    		
    	<script>
      		$( document ).ready( function() {
      			$('.toggle').text("");
        		$( window ).scroll( function() {
          			if ( $( this ).scrollTop() > 20 ) {
            			$( '.top' ).fadeIn();
          			} else {
            			$( '.top' ).fadeOut();
          			}
        		});
        		$( '.top' ).click( function() {
          			$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          			return false;
        		});
      		});
    	</script>
	</head>
	<body class="is-preload" onload="url()">

		<%
        	if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        	{ 
            	// 로그인 화면으로 이동
            	response.sendRedirect("member/view/LoginForm.jsp");
        	}
        	else // 로그인 했을 경우
        	{
    	%>


		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="MainForm.do" class="logo">
										<strong>CoPaYou</strong> coding partner of you
									</a>
									<ul class="icons">
										<li><%=session.getAttribute("sessionID") %> 님</li>
										<li><input type="button" value="내 정보" onclick="UserInfoForm()"/></li>
										<li><input type="button" value="로그아웃" onclick="logoutPro()"/></li>
									</ul>
								</header>

								<%} %>

							<jsp:include page="<%=contentPage%>" />



						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
							<!--
							<section id="search" class="alt">
								<form method="post" action="#">
									<input type="text" name="query" id="query" placeholder="Search" />
								</form>
							</section>
							-->
								
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="MainForm.do">Homepage</a></li>
										<li><a href="MainForm.do?contentPage=FavoritesList.jsp">FAVORITES</a></li>
										<li>
											<span class="opener" id="opener_Html">HTML</span>
											<ul>
												<li><a href="MainForm.do?contentPage=ContentView/HTML/Html_0.jsp">HTML 소개</a></li>
												<li><a href="MainForm.do?contentPage=ContentView/HTML/Html_1.jsp">HTML 편집기</a></li>
												<li><a href="MainForm.do?contentPage=ReadyView.jsp">HTML 기본</a></li>
											</ul>
										</li>
										<li>
											<span class="opener" id="opener_Css">CSS</span>
											<ul>
												<li><a href="MainForm.do?contentPage=ContentView/CSS/Css_0.jsp">CSS 소개</a></li>
												<li><a href="MainForm.do?contentPage=ReadyView.jsp">CSS 구문</a></li>
											</ul>
										</li>
										<li>
											<span class="opener" id="opener_Javascript">JAVASCRIPT</span>
											<ul>
												<li><a href="MainForm.do?contentPage=ContentView/JAVASCRIPT/Javascript_0.jsp">JAVASCIRPT 소개</a></li>
											</ul>
										</li>
										<li>
											<span class="opener" id="opener_Javascript">JQUERY</span>
											<ul>
												<li><a href="MainForm.do?contentPage=ReadyView.jsp">JQUERY 소개</a></li>
											</ul>
										</li>
										<li>
											<span class="opener" id="opener_Javascript">PHP</span>
											<ul>
												<li><a href="MainForm.do?contentPage=ReadyView.jsp">PHP 소개</a></li>
											</ul>
										</li>
										<li><a href="MainForm.do?contentPage=ReadyView.jsp">READY</a></li>
										<li><a href="MainForm.do?contentPage=ReadyView.jsp">READY</a></li>
									</ul>
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Creator</h2>
									</header>
									1312050 Lee Hyeong Jun<br>
									1532023 Jang Jong Ho<br><br>
									<ul class="contact">
										<li class="icon solid fa-envelope">gudwns1109@gmail.com<br>jcho5078@naver.com</li>
										<li class="icon solid fa-phone">010-1234-5678</li>
										<li class="icon solid fa-home">집주소는 대한민국<br>
										어딘가에 위치함 00000-0000</li>
									</ul>
								</section>
								
								<nav>
									<header class="major">
										<h2>Visitor</h2>
									</header>
									<h5>
                           				<span style="display:inline-block; width:50%;">
                           					Total &nbsp;:&nbsp; ${sessionScope.totalCount }
                           				</span>
                              			<span>Today &nbsp;:&nbsp; ${sessionScope.todayCount }</span>
                              		</h5>
                        		</nav>
							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">
										&copy; Lee Hyeong Jun<br>
										&copy; Jang Jong Ho<br>
    									&copy; w3schools.com<br>
    									&copy; html5up.net<br>
    									&copy; codepen.io<br>
    									&copy; opentutorials.org<br>
    								</p>
								</footer>

						</div>
					</div>
					
					<!-- Chatting Area-->
					<button class="open-button" onclick="openForm()">채팅</button>

					<div class="chat-popup" id="myForm">
				  		<div class="form-container">
				  			<div style="float:right;">
				  				<div id="myFormClose" onclick="openForm()">X</div>
				  				<div id="myFormheader">Move</div>
				  			</div>
				    		<h3 style="margin-bottom:1.5em;">Chatting</h3>
				
				    		
				    		<div id="chatPub" style="overflow-y:auto; height:250px;"></div>
				    		<textarea placeholder="메세지를 입력해주세요.." id="msgText" name="msg" required></textarea>
				
				    		<button type="submit" class="btn" onclick="sendPub();">보내기</button>
				    		<h3 id="name" style="display:none;"><%=session.getAttribute("sessionID") %></h3>
				  		</div>
					</div>
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
					<script src="https://cdn.pubnub.com/pubnub-3.4.4.js"></script>
					<script>
						$('#myForm').hide();
						function openForm() {
							$('#myForm').toggle('slow');
						}
						var pubnub = PUBNUB.init({
			    			publish_key: 'pub-c-602a568f-e2a6-4f96-a25d-1b4870d546f0',
			    			subscribe_key: 'sub-c-fcaa02f8-062a-11ea-bc84-32c7c2eb6eff',
			    			ssl: true
			    		});
			    
				
			    		pubnub.subscribe({
			    			channel: 'chat',
			    			message: displayPub
			    		});
			    
			    		pubnub.history({
			    			channel: 'chat',
			    			reverse: true,
			    			count: 100
			    		}, function(status, response){
			    			$.each(status[0], function(i, item){
			    				displayPub(item);
			    			});
			    		});
			
						function displayPub(message){
							var html = '<div style="font-size:1em;">'+'<h5>'+message.username+'</h5>'+message.text+"</div>" + '<hr style="margin:1em 0;">';
							$("#chatPub").append(html).scrollTop(999999);
						}
				
						function sendPub(){
					
							if($("#name").text() == ''){
								alert("정상적인 방법으로 로그인 해주세요.");
								return;
							}
							if($("#msgText").val() == '') return;
							pubnub.publish({
								channel: 'chat',
								message:{
									username: $("#name").text(),
									text: $("#msgText").val()
								}
							});
							$("#msgText").val('').focus();
						}
				
						$(document).ready(function(){
							$("#btn").click(function(){
								sendPub();
							});
							$("#msgText").keyup(function(event){
								if(event.keyCode == 13) sendPub();
							});
						});
					</script>
					<script>
						//Make the DIV element draggagle:
						dragElement(document.getElementById("myForm"));

						function dragElement(elmnt) {
  							var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  							if (document.getElementById(elmnt.id + "header")) {
    							/* if present, the header is where you move the DIV from:*/
    							document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
  							} else {
    							/* otherwise, move the DIV from anywhere inside the DIV:*/
    							elmnt.onmousedown = dragMouseDown;
  							}

  							function dragMouseDown(e) {
    							e = e || window.event;
    							e.preventDefault();
    							// get the mouse cursor position at startup:
    							pos3 = e.clientX;
    							pos4 = e.clientY;
    							document.onmouseup = closeDragElement;
    							// call a function whenever the cursor moves:
    							document.onmousemove = elementDrag;
  							}

  							function elementDrag(e) {
    							e = e || window.event;
    							e.preventDefault();
    							// calculate the new cursor position:
    							pos1 = pos3 - e.clientX;
    							pos2 = pos4 - e.clientY;
    							pos3 = e.clientX;
    							pos4 = e.clientY;
    							// set the element's new position:
    							elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    							elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  							}

  							function closeDragElement() {
    							/* stop moving when mouse button is released:*/
    							document.onmouseup = null;
    							document.onmousemove = null;
  							}
						}
					</script>
			</div>

			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/home.js"></script>

		
		<a class="top">Top</a>
	</body>
</html>