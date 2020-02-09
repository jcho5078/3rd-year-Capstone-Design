<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="jsp.comment.model.CommentDAO"%>
<%@page import="jsp.comment.model.CommentVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/home.css" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<link rel="icon" type="image/png" href="../../images/favicon-16x16.png" sizes="16x16">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<title>HTML 소개</title>

<style type="text/css">
* {
    box-sizing: inherit;
}
.code_bg {
	background-color: #f1f1f1;
	padding: 16px;
	margin: 20px 0;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12) !important;
}

.code {
	border-left: 3px solid #f56a6a;;
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

.strong {
	font-weight: 600;
}
.ddd{
	width:100%;
	font-weight:600;
	margin-bottom:10px;
	float:left;	
}

.ddd > input[type="button"]{
	float:right;
}

#text_c {resize:vertical;}

.Quiz {
  	font-size: 12px;
  	border: none;
  	outline: none;
  	background-color: #f67878;
  	color: #fff;
  	cursor: pointer;
  	padding: 12px;
  	border-radius: 4px;
}
.Quiz:hover{
	color:#fff !important;
	background-color:#f56a6a !important;
}

/* 댓글css */
.comleft {
	float:left;
}
.comright{
	float:right;
}
.comright > input[type="button"]{
	border:none;
	padding:5px;
	font-size:5px;
	font:inherit;
	height:initial;
	box-shadow:initial;
}
.commentListForm {margin-bottom:0;}

.commentid {
	display:inline-block;
	font-weight:600;
}
.commentjoindate {
	display:inline-block;
	font-size:12px;
	margin-left:5px;
}
.commentmodify {
	display:inline-block;
}
.commentdelete {
	display:inline-block;
}
.commentcontent {
	margin-top:5px;
}
.commentcontent > textarea {
	border:0;
	overflow-y:hidden;
	background:clear;
	resize:none;
	padding:0.25em 0;
}
.commenthr {
	margin-top:0.25em;
	margin-bottom:0;
	
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

.fav {
	color:#363636;
	opacity: 0.8;
	text-decoration: none;
	cursor:pointer;
	float:right;
	border:0;
	font-size:20px;
}

.fav:hover {
	opacity: 1;
}

</style>
<script>
	window.onload = function(){
		var id = $("#id").val();
		var what = "Html_0";
		var play = -1;
		
		$.ajax({
			type : "post",
			async : false,
			url : "http://localhost:8090/proc07/FavoritesCheck",
			dataType : "text",
			data : {
				id: id,
				what: what,
				play: play
			},
			success : function(data, textStatus){
				
				if(data == 'yes'){
					$('.fav').css({"color":"#f56a6a"});
				} else {
					$('.fav').css({"color":"#363636"});
				}
				
			}	// end success function
		});	// end ajax
		
	}


	var check = 0;
	
	function fav(){
		
		var _id = $("#id").val();
		var _what = "Html_0";
		var _play = 0;
		//var fav = confirm("즐겨찾기");
		
		if(check == 0){
			_play = 1;
			check  = 1;
			
			$.ajax({
				type : "post",
				async : false,
				url : "http://localhost:8090/proc07/FavoritesCheck",
				dataType : "text",
				data : {
					id: _id,
					what: _what,
					play: _play
				},
				success : function(data, textStatus){
					
					if(data == 'yes'){
						$('.fav').css({"color":"#f56a6a"});
					} else {
						$('.fav').css({"color":"#363636"});
					}
					
				}	// end success function
			});	// end ajax
			
			
		} else {
			check = 0;
			
			$.ajax({
				type : "post",
				async : false,
				url : "http://localhost:8090/proc07/FavoritesCheck",
				dataType : "text",
				data : {
					id: _id,
					what: _what,
					play: _play
				},
				success : function(data, textStatus){
					
					if(data == 'no'){
						$('.fav').css({"color":"#f56a6a"});
					} else {
						$('.fav').css({"color":"#363636"});
					}
					
				}	// end success function
			});	// end ajax
		}
		
	}
</script>


<script>
	
	// 퀴즈 버튼 클릭 시
	function quiz(){
    	var url = "ContentView/HTML/Quiz_html/Quiz_Html_0.jsp";
    	var name = "Quiz_html_소개";
    	var option = "width = 800, height = 500, top = 120, left = 350, location = no"
    	window.open(url, name, option);
	}

	// 댓글 작성 시
	function fn_sendComment(){
		var what = "Wr";
		var inputform = document.inputform;
		var text = $('#text_c').val();
		//var text = document.getElementById("text_c");
		
		if(text.value == "" || text.length==0) {
			alert("댓글을 작성해주세요.");
			text.focus();
			return false;//현재 submit이벤트를 중지하는 개념(즉, 전송을 막는다->페이지안넘김)
		}
		else { 
			inputform.method = "post";
			inputform.action = "comment/pro/Html_0Pro.jsp?what="+what;
			inputform.submit(); //form안에 있는 데이터를 action속성의 주소로 전송
		}
	}
	
	// top버튼 작동Query
    $( document ).ready( function() {
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

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");

	String session_id = session.getAttribute("sessionID").toString();

	CommentVO cvo = new CommentVO();
	cvo.setMy_id(session_id);

	CommentDAO cdao = CommentDAO.getInstance();

	cvo = cdao.getCommentAddNum();
	
%>


<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");

	CommentDAO cdao_List = new CommentDAO();
	List list = cdao_List.ListComment();
	
%>
</head>

<body>

	<!-- Content -->
	<section>
		<a class="fa fa-star fav" onclick="fav()"></a>
		<header class="main">
			<h1>HTML 소개</h1>
		</header>

		<hr class="major" />

		<h2>HTML이란 무엇인가?</h2>
		<p class="strong">HTML은 웹페이지를 만들기 위한 표준 마크 업 언어입니다.</p>

		<ul style="line-height: 27px;">
			<li>HTML은 하이퍼 텍스트 마크 업 언어</li>
			<li>HTML은 마크 업을 사용하여 웹 페이지의 구조를 설명합니다.</li>
			<li>HTML 요소는 HTML 페이지의 구성 요소입니다.</li>
			<li>HTML 요소는 태그로 표현됩니다.</li>
			<li>HTML 태그는 "heading", "paragraph", "table" 등과 같은 내용의 레이블을
				표현합니다.</li>
			<li>브라우저는 HTML 태그를 표시하지 않지만이를 사용하여 페이지의 내용을 렌더링합니다.</li>
		</ul>

		<hr class="major" />

		<h2>간단한 HTML 문서</h2>
		<div class="code_bg">
      		<div class="code">
        		<span class="code_t"><</span><span class="code_p">!DOCTYPE <span class="code_h">html</span></span><span class="code_t">></span><br>
        		<span class="code_t"><</span><span class="code_p">html</span><span class="code_t">></span><br>
        		<span class="code_t"><</span><span class="code_p">head</span><span class="code_t">></span><br>
        		&emsp;<span class="code_t"><</span><span class="code_p">title</span><span class="code_t">></span>페이지 제목<span class="code_t"><</span><span class="code_p">title</span><span class="code_t">></span><br>
        		<span class="code_t"><</span><span class="code_p">/head</span><span class="code_t">></span><br>
        		<span class="code_t"><</span><span class="code_p">body</span><span class="code_t">></span><br><br>
      
        		&emsp;<span class="code_t"><</span><span class="code_p">h1</span><span class="code_t">></span>나의 첫 제목<span class="code_t"><</span><span class="code_p">/h1</span><span class="code_t">></span><br>
        		&emsp;<span class="code_t"><</span><span class="code_p">p</span><span class="code_t">></span>나의 첫 단락<span class="code_t"></span><span class="code_p">/p</span><span class="code_t">></span><br><br>
        		<span class="code_t"><</span><span class="code_p">/body</span><span class="code_t">></span><br>
        		<span class="code_t"><</span><span class="code_p">/html</span><span class="code_t">></span>
      		</div>
    	</div>

		<ul style="line-height: 27px;">
			<li><span class="code_e">&lt;!DOCTYPE html&gt;</span>선언은 HTML5가 될이 문서를 정의</li>
			<li><span class="code_e">&lt;html&gt;</span>요소는 HTML 페이지의 루트요소입니다</li>
			<li><span class="code_e">&lt;head&gt;</span>요소는 문서에 대한 메타 정보를 포함</li>
			<li><span class="code_e">&lt;title&gt;</span>요소는 문서에 대한 메타 정보를 포함</li>
			<li><span class="code_e">&lt;body&gt;</span>요소는 문서의 제목을 명시</li>
			<li><span class="code_e">&lt;h1&gt;</span>요소는 큰 제목을 정의</li>
			<li><span class="code_e">&lt;p&gt;</span>요소는 문단을 정의</li>
		</ul>

		<hr class="major" />

		<h2>HTML 태그</h2>
		<p class="strong">HTML 태그는 꺾쇠 괄호로 묶인 요소 이름입니다.</p>

		<ul style="line-height: 27px;">
			<li>HTML 태그는 일반적으로 <span class="code_e">&lt;&emsp;&gt;</span>, <span class="code_e">&lt;/&emsp;&gt;</span> 과 같이 쌍으로 이루어졌습니다.</li>
			<li>쌍의 첫 번째 태그는 시작 태그이고, 두 번째 태그는 종료 태그입니다.</li>
			<li>종료 태그는 시작 태그와 비슷하지만 태그 이름 앞에 슬래시가 삽입되어 있습니다.</li>
		</ul>

		<hr class="major" />

		<h2>간단한 HTML 문서 브라우저 출력</h2>
		<p>웹 브라우저(Chrome, IE, Firefox, Safari)의 목적은 HTML 문서를 읽고 표시하는 것입니다.<br>브라우저는 HTML 태그를 표시하지 않지만 HTML 태그를 사용하여 문서를 표시하는 방법을 결정합니다.</p>

    	<p class="codepen" data-height="265" data-theme-id="0" data-default-tab="html,result" data-user="ertaaa" data-slug-hash="VwwvdeQ" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="VwwvdeQ">
  			<span>See the Pen <a href="https://codepen.io/ertaaa/pen/VwwvdeQ">
  			VwwvdeQ</a> by ertaaa (<a href="https://codepen.io/ertaaa">@ertaaa</a>)
  			on <a href="https://codepen.io">CodePen</a>.</span>
		</p>
		<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
		<br>
		<a href="https://codepen.io/ertaaa/pen/VwwvdeQ" target="_blank" style="border-bottom:none;"><button>편집해보기</button></a>
		
		<hr class="major" />

		<h2>HTML 페이지 구조</h2>
		<p>아래는 HTML 페이지 구조의 시각화입니다.</p>
		<div style="width:99%;border:1px solid grey;padding:3px;margin:0;background-color:#ddd">&lt;html&gt;
			<div style="width:90%;border:1px solid grey;padding:3px;margin:20px">&lt;head&gt;
				<div style="width:90%;border:1px solid grey;padding:5px;margin:20px">&lt;title&gt;Page title&lt;/title&gt;</div>
				&lt;/head&gt;
			</div>
			<div style="width:90%;border:1px solid grey;padding:3px;margin:20px;background-color:#ddd">&lt;body&gt;
				<div style="width:90%;border:1px solid grey;padding:3px;margin:20px;background-color:#fff">
					<div style="width:90%;border:1px solid grey;padding:5px;margin:20px">&lt;h1&gt;This is a heading&lt;/h1&gt;</div>
					<div style="width:90%;border:1px solid grey;padding:5px;margin:20px">&lt;p&gt;This is a paragraph.&lt;/p&gt;</div>
					<div style="width:90%;border:1px solid grey;padding:5px;margin:20px">&lt;p&gt;This is another paragraph.&lt;/p&gt;</div>
				</div>
				&lt;/body&gt;
			</div>
			&lt;/html&gt;
		</div>
		
		<hr class="major" />

		<h2>&lt;! DOCTYPE html &gt;</h2>
		<p class="strong">HTML 태그는 꺾쇠 괄호로 묶인 요소 이름입니다.</p>

		<ul style="line-height: 27px;">
      		<li>이 <span class="code_e">&lt;!DOCTYPE html&gt;</span> 선언은 문서 유형을 나타내며 브라우저가 웹 페이지를 올바르게 표시할 수 있게 도와줍니다.</li>
      		<li>HTML 태그보다 먼저 페이지 상단에 한 번만 나타나야 합니다.</li>
      		<li><span class="code_e">&lt;!DOCTYPE html&gt;</span>선언은 대소 문자를 구분하지 않습니다.</li>
      		<li><span class="code_e">&lt;!DOCTYPE html&gt;</span>HTML5에 대한 선언은 다음과 같습니다.</li>
		</ul>
		<div class="code_bg">
      		<div class="code">
        		<span class="code_t"><</span><span class="code_p">!DOCTYPE <span class="code_h">html</span></span><span class="code_t">></span><br>
      		</div>
    	</div>
		
		<hr class="major" />
		
		<h2>HTML5의 발전과정</h2>
		<ul style="line-height: 27px;">
      		<li><strong>2004년</strong>&nbsp; HTML5 표준 개발 시작</li>
      		<li><strong>2007년</strong>&nbsp; W3C에서 working Group을 결성해 개발진행</li>
      		<li><strong>2008년</strong>&nbsp; 첫 번째 표준 초안 공개</li>
      		<li><strong>2010년</strong>&nbsp; HTML5 표준 초안 Last call 시작</li>
      		<li><strong>2011년</strong>&nbsp; HTML5 표준 개발 Last call 종료</li>
      		<li><strong>2014년</strong>&nbsp; 2014년 10월 8일 HTML5 표준안 발표 (차세대 웹 표준으로 확정</li>
      		<li><strong>2016년</strong>&nbsp; 2016년 11월 1일 HTML5.1 권고안 발표</li>
      		<li><strong>2017년</strong>&nbsp; 2017년 12월 14일 HTML5.2 권고안 발표</li>
    	</ul>
		
		<hr class="major" />
		
		<h2>HTML 소개 Quiz Test</h2>
		<p>HTML 퀴즈로 HTML 스킬을 테스트해 보십시오!</p>
		<a href="javascript:quiz()" target="_self" class="Quiz">Start HTML 소개 Quiz</a>
		
		<hr class="major" />
		
		<!-- 댓글 작성-->
		<div id="CommentForm">
			<div>댓글 <%=list.size() %></div><br>
			<form id="inputform" name="inputform" method="post" action="">
				<div class="ddd">아이디 : <%=session.getAttribute("sessionID") %>
					<input type="hidden" id="num" name="num" value="<%=cvo.getMy_num() %>">
					<input type="hidden" id="id" name="id" value="<%=session.getAttribute("sessionID") %>">
					<input type="button" value="댓글달기" onclick="fn_sendComment();">
				</div>
				<textarea id="text_c" rows="5" cols="80" name="content" placeholder="댓글을 남겨주세요."></textarea>
			</form>
		</div>
		
		
		<%
			for(int i=0; i<list.size(); i++){
				CommentVO cvo_List = (CommentVO)list.get(i);
				
				int num = cvo_List.getMy_num();
				String id = cvo_List.getMy_id();
				String content = cvo_List.getMy_content();
				Date joinDate = cvo_List.getMy_joinDate();
			
				
		%>
			<div class="commentListDiv">
				<form action="" method="post" class="commentListForm" name="commentListForm">
						<input type="hidden" name="commentnum" value="<%=num %>">
						<input type="hidden" name="sessionid" value="<%=session.getAttribute("sessionID") %>">
						<div class="comleft">
							<div class="commentid"><%=id %><input type="hidden" name="commentid" value="<%=id %>"></div>
							<div class="commentjoindate"><%=joinDate %></div>
						</div>
						<div class="comright">
							<input type="hidden" class="commentCan" value="취소">
							<input type="button" class="commentMo" value="수정">
							<input type="button" class="commentDe" value="삭제" onclick="commentDe(<%=num %>,'<%=id %>','<%=session.getAttribute("sessionID") %>')">
						</div>
						<br>
						<div class="commentcontent">
							<textarea name="commentcontent" disabled><%=content %></textarea>
						</div>
				</form>
				<hr size="1" class="commenthr">
			</div>
		
			<br>
		
		<%
			}
		%>
	</section>

	<!-- Scripts -->
	<script src="../../assets/js/jquery.min.js"></script>
	<script src="../../assets/js/browser.min.js"></script>
	<script src="../../assets/js/breakpoints.min.js"></script>
	<script src="../../assets/js/util.js"></script>
	<script src="../../assets/js/home.js"></script>

	<script>
		// 댓글수정창 자동높이 조절
		$(document).ready(function() {
	      $('.commentcontent').on( 'keyup', 'textarea', function (e){
	        $(this).css('height', 'auto' );
	        $(this).height( this.scrollHeight );
	      });
	      $('.commentcontent').find( 'textarea' ).keyup();
	    });
	
	
		/*
		function commentMo(){}
		이런식으로 하면 $(this)가 안되서 밑에 방식으로 했음
		*/
		// 댓글수정 버튼 클릭 시
		$(function(){
			var c = "";		// 수정 취소 시 댓글원본로 되돌리기 위한 변수
			var h;			// 수정 취소 시 댓글원본 높이로 되돌리기 위한 변수
			
			$('.commentMo').click(function(){
				var num = $(this).parent().prev().prev().prev().val();
				var sessionid = $(this).parent().prev().prev().val();
				var id = $(this).parent().prev().children().children().val();
				var text = $(this).parent().next().next().children();
				var content = text.val();
				var hh = text.height();		// 원본댓글 높이
				
				var cancel = $(this).prev();
				var del = $(this).next();
				var what = "Mo";
				
				if(id != sessionid){
					alert(sessionid+" 님께서 작성하신 댓글이 아닙니다.");
				} else {
					//alert(text.prop('disabled'));
					// 댓글 수정입력창 비활성화 시
					if(text.prop('disabled')==true){
						c = content;					// 댓글원본 저장
						h = hh;							// 댓글원본 높이 저장
						text.attr('disabled',false);	// 댓글수정 입력창 활성화
						cancel.prop('type','button');	// 취소버튼 보이기
						del.prop('type','hidden');		// 삭제버튼 숨기기
						text.css({
							"resize":"none",
							"height":"h+1.5em",
							"border":"solid 1px rgba(210, 215, 217, 0.75)",
							"padding":"0.75em 1em 0 1em"
						});
						text.focus();
					}
					// 댓글 수정입력창 활성화 시
					else if(text.prop('disabled')==false){
						var msg = confirm("댓글을 수정합니다.");
						
						// 댓글수정 알림 확인 시 수정, 취소 시 그대로
						if(msg == true){
							location.href = "comment/pro/Html_0Pro.jsp?what="+what+"&num="+num+"&content="+content;
						} else {return false;}

					}	// end elseif
				}	//end else
			});	// end commentMo click
		
			// 댓글수정 취소버튼 클릭 시
			$('.commentCan').click(function(){
				var text = $(this).parent().next().next().children();	// textarea 위치
				var content = text.val();
				var cancel = $(this);
				var del = $(this).next().next();
				
				// 댓글수정 입력창 활성화 시
				if(text.attr('disabled',false)){
					text.val(c);					// 취소 시 원본댓글 텍스트 그대로
					text.attr('disabled',true);		// 댓글수정 입력창 비활성화
					cancel.prop('type','hidden');	// 취소버튼 숨기기
					del.prop('type','button');		// 삭제버튼 보이기
					text.css({
						"resize":"none",
						"height":h,
						"border":"0",
						"padding":"0.25em 0 0 0",
						"overflow-y":"hidden"
					});
				}	// end if
			});	// end commentCan click
			
		});	// function
		
		
		// 댓글삭제버튼 클릭 시
		function commentDe(num, id, sessionID){
			var what = "De";
			if(id!=sessionID){
				alert(sessionID+" 님께서 작성하신 댓글이 아닙니다.");
				return false;
			} else {
				var msg = confirm("댓글을 삭제합니다.");
				
				// 댓글삭제 알림 확인 시 삭제, 취소 시 그대로
				if(msg == true){
					location.href = "comment/pro/Html_0Pro.jsp?what="+what+"&num="+num;
				} else {return false;}
			}	// end else
		}	// end commentDe()
		

	</script>

	
	<a class="top">Top</a>
</body>
</html>