<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

<style>
* {
    box-sizing: inherit;
}
body{background-color:#f9f9f9;}
.checkbox {
  height : 191px; 
  width : 880px;
  margin: 50px auto 20px;
  background : url(images/ckbox.jpg) no-repeat 0 0;
  text-align: center;
}
.checkbox span {
  display: block;
}
.chkmenu { 
  text-align : center;
}
.chkmenu a {
  display : inline-block;
  border: 2px solid #9a74a8;
  border-radius: 4px;
  color: #363636;
  width : 120px;
  padding: 15px;
  margin : 0 20px;
  text-align : center;
  text-decoration : none;
  cursor : pointer;
}
.chkmenu a:hover {
  background-color : #9a74a8;
  color : white;
  transition: all .2s ease;
}
.chkmenu .chkitem1{
  background-color : #9a74a8;
  color : white;
}

.selfchk_list .list {
  border-top : 1px solid #b2b2b2;
}
.selfchk_list .end {
	border-bottom : 1px solid #e8e8e8;
}
.selfchk_list .list .title {
  border-top : 1px solid #fff;
  border-bottom : 1px solid #fff;
  background : #fff;
  padding : 15px 20px;
  font-size : 15px;
  color : #000;
}
.selfchk_list .list .cont {
  border-top : 1px solid #e8e8e8;
  padding : 25px;
  background : #f8f8f8;
  font-size : 15px;
  color : #3a3a3a;
}
.selfchk_list .list .cont label {
  margin : 10px;
}
.chknext a{
  display : block;
  background-color : #9a74a8;
  border : none;
  border-radius : 4px;
  color : white;
  width : 120px;
  padding : 15px;
  margin : 20px auto;
  text-align : center;
  text-decoration : none;
  cursor : pointer;
}

.btn{
	padding:20px; 0;
	text-align:center;
}
input[type="button"] {
	border:none;
	cursor:pointer;
	background-color:#f67878 !important;
	color:#fff;
	padding:10px 20px;
	margin:0 35px;
	border-radius:4px;
}
input[type="button"]:hover {
	background-color:#f56a6a !important;
}

input[type="text"] {
	width:50px;
	padding:0 15px;
	font-size:25px;
	text-align:center;
	border:none;
	background-color:#f9f9f9;
}
input[type="text"]:focus {
	outline:none;
}
#score_span {
	display:none;
}
</style>

<script>
	
	// 취소 시 창 닫기
	function cancel(){
		self.close();
	}
	
	// 확인 시
	function Check(sessionID){
		var radio_name = [];					// array
		var raido_name_val = {};				// object
		var radio = $("input[type=radio]"); 	// 라디오 정보를 가져옵니다.
		var noCheck = 0;						// 선택 못한 문제 카운트
		var sol = 0;							// 맞춘 개수 카운트
		var score = 0;							// 점수
		
		$.each(radio, function (key, value) { 					// input radio의 name 값을 가져옵니다.
			radio_name.push($(value).attr('name'));
		});
		radio_name = $.unique(radio_name.sort()).sort(); 		// 중복요소 이름을 제거
		
		// 체크 못한 문항 개수 파악, 체크한 답 배열에 담기
		for (var i = 0; i < radio_name.length; i++) {
			//alert($('input[name="' + radio_name[i] + '"]:checked').val());
			if($('input[name="' + radio_name[i] + '"]:checked').val() == undefined){
				noCheck+=1;
			}
			raido_name_val[radio_name[i]] = $('input[name="' + radio_name[i] + '"]:checked').val();
		}
		
		// 만약 체크못한 문항있으면 알려주고 없으면 점수 합
		if(1 <= noCheck){
			alert(noCheck+"개 선택 못했습니다.");
		} else if(noCheck == 0){
			for (var i = 0; i < radio_name.length; i++) {
				//alert(raido_name_val[radio_name[i]]);
				if(raido_name_val[radio_name[i]] == 'ok'){
					sol+=1;
				}
			}
			score = sol*20;
			
			if(score < 60){
				alert("아쉽습니다. 점수는 "+score+"점 입니다. 다시 도전하세요!");
				location.reload();
				$('html').scrollTop(0);
			} else {
				//alert("축하드립니다. 점수는 "+score+"점 입니다.");
				$('#SCORE').val(score);
				$('#score_span').css({"display":"inline-block"});
				$('#SAVE').prop('type','button');
				$('#name_all_save').prop('type','hidden');
			}
		} else {
			alert("알 수 없는 오류입니다. 창을 닫습니다.");
			self.close();
		}
	}
	
	// 저장 버튼 클릭 시
	function Save(sessionID){
		var _score = $('#SCORE').val();
		var _what = "javascript_0";
		
		// 점수 저장
		$.ajax({
			type : "post",
			async : false,
			url : "http://localhost:8090/proc07/QuizCheck",
			dataType : "text",
			data : {
				id: sessionID,
				score: _score,
				what: _what
			},
			success : function(data, textStatus){
							
				if(data == 'usable'){
					alert("점수가 저장되었습니다.");
					self.close();
				}
							
			}	// end success function
		});	// end ajax
		
	}
	
</script>





<title>Quiz_Javascript_소개</title>
</head>
<body>

<div class="selfchk_list">

    <div class="list fisrt">
      <div class="title">
        <span>1. JavaScript의 설명으로 옳지 않은 것은?</span>
      </div>
      <div class="cont">
        <label class="chkbox pic"><input type="radio" name="selfchk1" value="1"> JavaScript는 HTML과 웹의 프로그래밍 언어</label>
        <br><br><label class="chkbox pic"><input type="radio" name="selfchk1" value="2"> 동적으로 컨텐츠를 바꾸는 등 여러 일을 할 수 있는 객체 기반의 스크립트 언어</label>
        <br><br><label class="chkbox pic"><input type="radio" name="selfchk1" value="ok"> 다른 응용 프로그램의 내장 객체에 접근할 수 없다.</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>2. JavaScript로 웹 페이지의 동작을 프로그래밍 할 수 있나?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk2" value="ok"> 그렇다</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk2" value="2"> 아니다</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>3. Java와 JavaScript는 같은 언어이다.</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk3" value="1"> 그렇다</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk3" value="ok"> 아니다</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>4. JavaScript는 큰 따옴표만 사용가능하다.</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk4" value="1"> 그렇다</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk4" value="ok"> 아니다</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>5. 다음 중 HTML 요소를 숨길 수 있는 것은?</span><br><br>
        <div>&emsp;&lt;p id="demo"&gt; 저를 숨겨주세요 &lt;p&gt;</div>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk5" value="1"> document.getElementById('p').style.display='none'</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk5" value="2"> document.getElementById('id').style.display='none'</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk5" value="ok"> document.getElementById('demo').style.display='none'</label>
      </div>
    </div>
    
    <div class="btn">
    	<input type="button" value="취소" onclick="cancel()">
    	<input type="button" value="확인" id="name_all_save" onclick="Check('<%=session.getAttribute("sessionID") %>')">
    	<span id="score_span"><input type="text" id="SCORE" readonly> 점</span>
    	<input type="hidden" value="저장" id="SAVE" onclick="Save('<%=session.getAttribute("sessionID") %>')">
	</div>
</div>

</body>
</html>