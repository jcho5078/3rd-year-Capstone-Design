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
			score = sol*10;
			
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
		var _what = "html_0";
		
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





<title>Quiz_Html_소개</title>
</head>
<body>

<div class="selfchk_list">

    <div class="list fisrt">
      <div class="title">
        <span>1. HTML은 무엇을 의미합니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox pic"><input type="radio" name="selfchk1" value="1"> Hyperlinks and Text Markup Language</label>
        <br><br><label class="chkbox pic"><input type="radio" name="selfchk1" value="2"> Home Tool Markup Language</label>
        <br><br><label class="chkbox pic"><input type="radio" name="selfchk1" value="ok"> Hyper Text Markup Language</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>2. 누가 웹 표준을 만들고 있습니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk2" value="1"> Mozilla</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk2" value="2"> Google</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk2" value="3"> Microsoft</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk2" value="ok"> The World Wide Web Consortium</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>3. 가장 큰 제목에 대해 올바른 HTML요소를 선택하세요.</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk3" value="1"> &lt;heading&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk3" value="ok"> &lt;h1&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk3" value="3"> &lt;h6&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk3" value="4"> &lt;head&gt;</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>4. 줄 바꿈을 삽입하기 위한 올바른 HTML 요소는 무엇입니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk4" value="1"> &lt;break&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk4" value="2"> &lt;lb&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk4" value="ok"> &lt;br&gt;</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>5. 하이퍼 링크를 만들기 위한 올바른 HTML은 무엇입니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk5" value="1"> &lt;a&gt; http://www.google.com &lt;a&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk5" value="2"> &lt;a name="http://www.google.com"&gt; Google.com &lt;a&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk5" value="ok"> &lt;a href="http://www.google.com"&gt; Google.com &lt;a&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk5" value="4"> &lt;a url="http://www.google.com"&gt; Google.com &lt;a&gt;</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>6. 종료 태그를 나타내는 데 사용되는 문자는 무엇입니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk6" value="1"> &lt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk6" value="2"> ^</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk6" value="ok"> /</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk6" value="4"> *</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>7. 텍스트 입력란을 만들기 위한 올바른 HTML은 무엇입니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk7" value="1"> &lt;input type = "textfield"&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk7" value="ok"> &lt;input type = "text"&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk7" value="3"> &lt;textfield&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk7" value="4"> &lt;textinput type = "text"&gt;</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>8. 어떤 HTML 요소가 문서의 제목을 정의합니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk8" value="1"> &lt;head&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk8" value="2"> &lt;meta&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk8" value="ok"> &lt;title&gt;</label>
      </div>
    </div>
    
    <div class="list">
      <div class="title">
        <span>9. HTML5에 적합한 DOCTYPE은 무엇입니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk9" value="1"> &lt;! DOCTYPE HTML PUBLIC "- //W3C//DTD HTML 5.0 // KO" "http://www.google.com"&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk9" value="ok"> &lt;! DOCTYPE html&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk9" value="3"> &lt;! DOCTYPE HTML5&gt;</label>
      </div>
    </div>
    
    <div class="list end">
      <div class="title">
        <span>10. 문서 또는 섹션의 헤더를 지정하는데 사용되는 HTML 요소는 무엇입니까?</span>
      </div>
      <div class="cont">
        <label class="chkbox"><input type="radio" name="selfchk10" value="ok"> &lt;header&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk10" value="2"> &lt;head&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk10" value="3"> &lt;top&gt;</label>
        <br><br><label class="chkbox"><input type="radio" name="selfchk10" value="4"> &lt;section&gt;</label>
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