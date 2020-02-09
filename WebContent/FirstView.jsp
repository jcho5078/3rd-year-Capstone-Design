<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="../../images/favicon-16x16.png" sizes="16x16">

<style>
	header p {
		font-family:Arial, Helvetica, sans-serif;
		font-weight:600;
	}
	* {
  box-sizing: border-box;
}

/* The actual timeline (the vertical ruler) */
.timeline {
  position: relative;
  max-width: 1200px;
  margin: 0 auto;
}

/* The actual timeline (the vertical ruler) */
.timeline::after {
  content: '';
  position: absolute;
  width: 6px;
  background-color: #f56a6a;
  top: 0;
  bottom: 0;
  left: 50%;
  margin-left: -3px;
}

/* Container around content */
.container {
  padding: 10px 40px;
  position: relative;
  background-color: inherit;
  width: 50%;
}

/* The circles on the timeline */
.container::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  right: -13px;
  background-color: white;
  border: 4px solid #f56a6a;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

/* Place the container to the left */
.left {
  left: 0;
}

/* Place the container to the right */
.right {
  left: 50%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  right: 30px;
  border: medium solid #ff8080;
  border-width: 10px 0 10px 10px;
  border-color: transparent transparent transparent #ff8080;
}

/* Add arrows to the right container (pointing left) */
.right::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
  border: medium solid #ff8080;
  border-width: 10px 10px 10px 0;
  border-color: transparent #ff8080 transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
  left: -13px;
}

/* The actual content */
.time_content {
  padding: 20px 30px;
  background-color: #ff8080;
  position: relative;
  border-radius: 6px;
  color:#fff;
}

/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .timeline::after {
  	left: 31px;
  }
  
  /* Full-width containers */
  .container {
  	width: 100%;
  	padding-left: 70px;
  	padding-right: 25px;
  }
  
  /* Make sure that all arrows are pointing leftwards */
  .container::before {
  	left: 60px;
  	border: medium solid #ff8080;
  	border-width: 10px 10px 10px 0;
  	border-color: transparent #ff8080 transparent transparent;
  }

  /* Make sure all circles are at the same spot */
  .left::after, .right::after {
  	left: 15px;
  }
  
  /* Make all right containers behave like the left ones */
  .right {
  	left: 0%;
  }
}

</style>

<title>CoPaYou_Main</title>
</head>
<body>
	<!-- Banner -->
	<section id="banner">
		<div class="content">
			<header>
				<h1>
					Welcome to our<br /> CoPaYou
				</h1>
				<p>웹을 시작할 때 공부하기 좋은 간단한 온라인 사이트</p>
			</header>
			<p>CoPaYou에 오신 것을 환영합니다.
				CoPaYou는 온라인으로 웹 기술을 배우는 교육용 웹 사이트입니다.
				콘텐츠에는 HTML, CSS, JavaScript, JQuery, PHP 등 다양한 교육용 자료를 제공합니다.
				CodePen을 통해 일반적인 실행 및 사용자에게 소스코드가 어떻게 실행결과로 나타나는지를 즉시 확인할 수 있습니다.
				지금부터 당신만의 웹 사이트를 만들어 보세요.</p>
			<ul class="actions">
				<li><a href="MainForm.do?contentPage=ContentView/HTML/Html_0.jsp" class="button big">시작하기</a></li>
			</ul>
		</div>
		<span class="image object">
			<div class="code_bg">
				<div class="code">
					<span class="code_t"><</span><span class="code_p">!DOCTYPE <span
						class="code_h">html</span></span><span class="code_t">></span><br> <span
						class="code_t"><</span><span class="code_p">html</span><span
						class="code_t">></span><br> <span class="code_t"><</span><span
						class="code_p">head</span><span class="code_t">></span><br>
					&emsp;<span class="code_t"><</span><span class="code_p">title</span><span
						class="code_t">></span>페이지 제목<span class="code_t"><</span><span
						class="code_p">title</span><span class="code_t">></span><br>
					<span class="code_t"><</span><span class="code_p">/head</span><span
						class="code_t">></span><br> <span class="code_t"><</span><span
						class="code_p">body</span><span class="code_t">></span><br>
					<br> &emsp;<span class="code_t"><</span><span class="code_p">h1</span><span
						class="code_t">></span>나의 첫 제목<span class="code_t"><</span><span
						class="code_p">/h1</span><span class="code_t">></span><br>
					&emsp;<span class="code_t"><</span><span class="code_p">p</span><span
						class="code_t">></span>나의 첫 단락<span class="code_t"></span><span
						class="code_p">/p</span><span class="code_t">></span><br>
					<br> <span class="code_t"><</span><span class="code_p">/body</span><span
						class="code_t">></span><br> <span class="code_t"><</span><span
						class="code_p">/html</span><span class="code_t">></span>
				</div>
			</div>
		</span>
	</section>

	<!-- Section -->
	<section>
		<header class="major">
			<h2>TUTORIALS</h2>
		</header>
		<div class="features">
			<article>
				<span class="icon"><img src="images/html-logo.png"></span>

				<div class="content">
					<h3>HTML</h3>
					<p>&emsp;HTML은 웹 페이지의 표준 마크 업 언어이며, 이것을 사용하면 자신의 웹 사이트를 만들 수 있습니다. HTML은 배우기 쉽습니다! 지금 시작하세요.</p>
				</div>
			</article>
			<article>
				<span class="icon"><img src="images/css-logo.png"></span>

				<div class="content">
					<h3>CSS</h3>
					<p>&emsp;CSS는 HTML 문서의 스타일을 정의하는 언어이며, 이것은 HTML 요소를 표시하는 방법을 설명한다. 기본부터 시작하세요!</p>
				</div>
			</article>
			<article>
				<span class="icon"><img src="images/js-logo.png"></span>

				<div class="content">
					<h3>JAVASCRIPT</h3>
					<p>&emsp;JAVASCRIPT는 HTML과 웹의 프로그래밍 언어이며, 이것은 배우기 쉽고 자신의 웹 사이트를 조금 더 고급스럽게 만들 수 있습니다.</p>
				</div>
			</article>
			<article>
				<span class="icon"><img src="images/php-logo.png"></span>

				<div class="content">
					<h3>PHP</h3>
					<p>&emsp;PHP는 서버 스크립팅 언어이며, 동적 및 대화형 웹 페이지를 만들기 위한 강력한 도구이다.
					 마이크로소프트의 ASP와 같은 경쟁사들에 비해 널리 사용되고, 자유롭고, 효율적인 대안이다.</p>
				</div>
			</article>
		</div>
	</section>
	
	<!-- Section -->
	<section>
		<header class="major">
			<h2>TIMELINE</h2>
		</header>
		<div class="timeline">
  			<div class="container left">
    			<div class="time_content">
      				<h2>19_11_22</h2>
      				<p>디자인 최종 수정<br>오류 디버깅 및 최종 테스트<br>PPT 자료 준비</p>
    			</div>
  			</div>
  			<div class="container right">
    			<div class="time_content">
      				<h2>19_11_15</h2>
      				<p>채팅기능 추가<br>컨텐츠 퀴즈 관련 개발<br>퀴즈 점수에 따른 진행도 시각화</p>
    			</div>
  			</div>
  			<div class="container left">
    			<div class="time_content">
      				<h2>19_11_08</h2>
      				<p>컨텐츠 및 댓글 입력 및 수정, 삭제 개발</p>
    			</div>
  			</div>
  			<div class="container right">
    			<div class="time_content">
      				<h2>19_11_01</h2>
      				<p>회원가입, 수정, 탈퇴 등 회원처리 개발<br>
      				웹 템플릿 적용 및 디자인 수정</p>
    			</div>
  			</div>
  			<div class="container left">
    			<div class="time_content">
      				<h2>19_10_18</h2>
      				<p>아이템에 맞는 웹 템플릿 물색</p>
    			</div>
  			</div>
  			<div class="container right">
    			<div class="time_content">
      				<h2>19_10_11</h2>
      				<p>캡스톤 디자인 아이템 기획</p>
    			</div>
  			</div>
		</div>
	</section>

</body>
</html>