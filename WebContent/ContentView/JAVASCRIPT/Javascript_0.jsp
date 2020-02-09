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


<title>JAVASCRIPT 소개</title>

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
		var what = "Javascript_0";
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
		var _what = "Javascript_0";
		var _play = 0;
		
		//var fav = confirm("즐겨찾기");
		
		if(check == 0){
			_play = 1;
			check = 1;
			
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
    	var url = "ContentView/JAVASCRIPT/Quiz_javascript/Quiz_Javascript_0.jsp";
    	var name = "Quiz_Javascript_소개";
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
			inputform.action = "comment/pro/Javascript_0Pro.jsp?what="+what;
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
			<h1>JAVASCRIPT 소개</h1>
		</header>

		<hr class="major" />

		<h2>JavaScript란 무엇인가?</h2>

		<ul style="line-height: 27px;">
			<li>JavaScript는 HTML과 웹의 프로그래밍 언어</li>
			<li>동적으로 컨텐츠를 바꾸고, 멀티미디어를 다루는 등 여러 일을 할 수 있는 객체 기반의 스크립트 언어</li>
			<li>웹 브라우저 내에서 주로 사용하며, 다른 응용 프로그램의 내장 객체에도 접근할 수 있다.</li>
		</ul>

		<hr class="major" />

		<h2>왜 JavaScript를 공부해야하나?</h2>
		<p class="strong">JavaScript는 모든 웹 개발자가 배워야 하는 3 가지 언어 중 하나입니다.</p>
		
		<ul style="line-height: 27px;">
			<li>웹 페이지의 내용을 정의하는 HTML</li>
			<li>웹 페이지의 레이아웃을 지정하는 CSS</li>
			<li>웹 페이지의 동작을 프로그래밍하는 JavaScript</li>
		</ul>
		<p>JavaScript가 사용되는 곳은 웹 페이지뿐이 아닙니다. 
		많은 데스크탑 및 서버 프로그램이 JavaScript를 사용합니다.<br>
		Node.js가 가장 잘 알려져 있습니다. MongoDB 및 CouchDB와 같은 일부 데이터베이스도 프로그래밍 언어로 JavaScript를 사용합니다.</p>
		

		<hr class="major" />
		
		<h2>Java와 JavaScript는 전혀 다르다</h2>
		<p>JavaScript는 1995년 Brendan Eich에 의해 발명되었으며 1997년 ECMA 표준이되었습니다.<br>
		ECMA-262는 표준의 공식 이름입니다. ECMAScript는 언어의 공식 이름입니다.<br><br>
		자바스크립트는 브라우저마다 지원되는 버전이 다릅니다.<br><br>
		자바와 자바스크립트는 직접적인 관련성이 없으며, 이름과 구문 외에는 자바보다 셀프나 스킴과 유사성이 많습니다.</p>
		
		<hr class="major" />
		
		<h2>HTML 내용 변경</h2>
		<p>많은 JavaScript HTML 메소드 중 하나는 getElementById()입니다.<br><br>
		이 예제에서는이 메소드를 사용하여 HTML 요소 (id = "demo"포함)를 "찾기"하고 요소 컨텐츠 ( innerHTML)를 "Hello JavaScript"로 변경합니다.</p>
		
		<p style="color:#f67878;">JavaScript는 큰 따옴표(" ")와 작은 따옴표(' ')를 모두 허용합니다.</p>
		
		<p class="codepen" data-height="265" data-theme-id="0" data-default-tab="html,result" data-user="ertaaa" data-slug-hash="pooqzwq" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="pooqzwq">
  		<span>See the Pen <a href="https://codepen.io/ertaaa/pen/pooqzwq">
  		pooqzwq</a> by ertaaa (<a href="https://codepen.io/ertaaa">@ertaaa</a>)
  		on <a href="https://codepen.io">CodePen</a>.</span>
		</p>
		<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
		<br>
		<a href="https://codepen.io/ertaaa/pen/pooqzwq" target="_blank" style="border-bottom:none;"><button>편집해보기</button></a>
		
		<hr class="major" />
		
		<h2>HTML 요소 감추기</h2>
		
		<p class="codepen" data-height="265" data-theme-id="0" data-default-tab="html,result" data-user="ertaaa" data-slug-hash="mddabqM" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="mddabqM">
  		<span>See the Pen <a href="https://codepen.io/ertaaa/pen/mddabqM">
  		mddabqM</a> by ertaaa (<a href="https://codepen.io/ertaaa">@ertaaa</a>)
  		on <a href="https://codepen.io">CodePen</a>.</span>
		</p>
		<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
		<br>
		<a href="https://codepen.io/ertaaa/pen/mddabqM" target="_blank" style="border-bottom:none;"><button>편집해보기</button></a>
		
		
		<hr class="major" />
		
		<h2>JavaScript 소개 Quiz Test</h2>
		<p>JavaScript 퀴즈로 JavaScript 스킬을 테스트해 보십시오!</p>
		<a href="javascript:quiz()" target="_self" class="Quiz">Start JAVASCRIPT 소개 Quiz</a>
		
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
							location.href = "comment/pro/Javascript_0Pro.jsp?what="+what+"&num="+num+"&content="+content;
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
					location.href = "comment/pro/Javascript_0Pro.jsp?what="+what+"&num="+num;
				} else {return false;}
			}	// end else
		}	// end commentDe()
		

	</script>

	
	<a class="top">Top</a>
</body>
</html>