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


<title>CSS 소개</title>

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
	border-left: 3px solid #a37ec2;
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
		var what = "Css_0";
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
		var _what = "Css_0";
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
    	var url = "ContentView/CSS/Quiz_css/Quiz_Css_0.jsp";
    	var name = "Quiz_css_소개";
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
			inputform.action = "comment/pro/Css_0Pro.jsp?what="+what;
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
			<h1>CSS 소개</h1>
		</header>

		<hr class="major" />

		<h2>CSS란 무엇인가?</h2>

		<ul style="line-height: 27px;">
			<li>CSS는 HTML 문서의 스타일을 설명하는 언어다.</li>
			<li>CSS는 HTML 요소를 표시하는 방법을 설명한다.</li>
			<li>CSS는 많은 작업을 절약한다. 여러 웹 페이지의 레이아웃을 동시에 제어할 수 있다.</li>
		</ul>
		
		<hr class="major" />
		
		<h2>왜 CSS를 사용하는가?</h2>
		<p class="strong">CSS는 다양한 장치와 화면 크기에 대한 디스플레이의 설계, 레이아웃 및 변형을 포함하여 웹 페이지의 스타일을 정의하는 데 사용된다.</p>
		
		<hr class="major" />
		
		<h2>CSS는 큰 문제를 해결!</h2>
		
		<p>
			HTML은 결코 웹 페이지를 포맷하기 위한 태그를 포함하지 않았습니다!<br>
			HTML은 다음과 같이 웹 페이지의 내용을 설명하기 위해 만들어졌습니다.<br><br>
			
			&emsp;&lt;h1&gt;이것은 제목입니다.&lt;/h1&gt;<br>
			&emsp;&lt;p&gt;이것은 단락입니다.&lt;/p&gt;<br><br>
			
			HTML 3.2 사양에 &lt;font&gt;와 같은 태그와 색상 속성을 추가하자, 웹 개발자들에게 악몽을 불러 일으켰다.<br>
			모든 페이지에 글꼴과 색 정보가 추가되는 대형 웹사이트의 개발은 길고 값비싼 과정이 되었다.<br><br>
			
			이 문제를 해결하기 위해 W3C (World Wide Web Consortium)는 CSS를 만들었습니다.<br><br>
			
			CSS가 HTML 페이지에서 스타일 서식을 제거했습니다!
		</p>
		
		<hr class="major" />
		
		<h2>CSS는 많은 작업을 저장합니다!</h2>
		<ul style="line-height: 27px;">
			<li>스타일 정의는 일반적으로 외부 .css 파일에 저장됩니다.</li>
			<li>외부 스타일 시트 파일을 사용하면 하나의 파일 만 변경하여 전체 웹 사이트의 모양을 변경할 수 있습니다!</li>
		</ul>
		
		<hr class="major" />
		
		<h2>CSS 편집해보기</h2>
		
		<p class="codepen" data-height="265" data-theme-id="default" data-default-tab="css,result" data-user="ertaaa" data-slug-hash="XWWyPVP" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="XWWyPVP">
  			<span>See the Pen <a href="https://codepen.io/ertaaa/pen/XWWyPVP">
  			XWWyPVP</a> by ertaaa (<a href="https://codepen.io/ertaaa">@ertaaa</a>)
  			on <a href="https://codepen.io">CodePen</a>.</span>
		</p>
		<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
		<br>
		<a href="https://codepen.io/ertaaa/pen/XWWyPVP" target="_blank" style="border-bottom:none;"><button>편집해보기</button></a>
		
		<hr class="major" />
		
		
		<h2>CSS 소개 Quiz Test</h2>
		<p>CSS 퀴즈로 CSS 스킬을 테스트해 보십시오!</p>
		<a href="javascript:quiz()" target="_self" class="Quiz">Start CSS 소개 Quiz</a>
		
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
							location.href = "comment/pro/Css_0Pro.jsp?what="+what+"&num="+num+"&content="+content;
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
					location.href = "comment/pro/Css_0Pro.jsp?what="+what+"&num="+num;
				} else {return false;}
			}	// end else
		}	// end commentDe()
		

	</script>

	
	<a class="top">Top</a>
</body>
</html>