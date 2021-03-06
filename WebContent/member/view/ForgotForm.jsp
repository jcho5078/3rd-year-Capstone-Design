<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>CoPaYou_회원가입</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
	<script src=https://code.jquery.com/jquery-3.3.1.js></script>
	<link rel="stylesheet" href="../../assets/css/home.css" />
	<link rel="icon" type="image/png" href="../../images/favicon-16x16.png" sizes="16x16">

	<style type="text/css">
		body {
			background-color : #f9f9f9;
			align-content: center;
		}
		* {
    		box-sizing: border-box;
		}
		@media screen and (max-width: 480px) {
			html, body, .main {
			min-width: 320px; }
		}
		@media screen and (max-height: 640px) {
    	html, body {
      		height: auto;
			min-height: 100%; } }
		@media screen and (max-width: 1680px) {
    		body {
      		padding: 6em 3.5em 3.5em 3.5em; } }
		@media screen and (max-width: 736px) {
			body {
			padding: 5em 2em 2em 2em; } }
		@media screen and (max-width: 360px) {
			body {
			padding: 5em 1.25em 1.25em 1.25em; } }
		
		.header {
			width:100%;
		}
		.header a {
  			display: inline-block;
  			text-align: center;
  			padding: 14px;
  			text-decoration: none;
  			font-size: 17px;
  			border-radius: 5px;
  			border:none;
  			opacity: 0.8;
		}

		.header a:hover {
  			opacity: 1;
		}

		.header a.ft_icon {
  			height: 48px;
 			width: 48px;
  			display: block;
  			margin : 0 10px;
  			margin-left: auto;
  			margin-right: auto;
  			/*box-sizing: unset;*/
  			padding:0;
		}
		.main {
			display: block;
			margin: 0 auto;
		}
		.auth-form {
			width: 340px;
   			margin: 0 auto;
		}
		.auth-form-header h1 {
			font-size: 24px;
   			font-weight: 300;
    		letter-spacing: -.5px;
    		display: block;
    		text-align: center;	
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
		.form-control input {
			display: block;
    		width: 100%;
    		color: #24292e;
    		background-color: #fff;
   			background-repeat: no-repeat;
    		background-position: right 8px center;
    		/*border: 1px solid #d1d5da;*/
    		border-radius: 3px;
    		outline: none;
    		padding:6px 8px;

    		min-height: 34px;
    		font-size: 13px;
    		line-height: 20px;
    		
    		margin-top: 5px;
    		margin-bottom: 15px;
		}
		input:focus::-webkit-input-placeholder {color:transparent;}
		input:focus::-moz-input-placeholder {color:transparent;}
		input:focus:-ms-input-placeholder {color:transparent;}
		input:focus:-o-input-placeholder {color:transparent;}

		.form-control .signup-btn {
			margin-top: 40px;
		}
		/*.form-control .signup-btn {
			margin-top: 20px;
			display: block;
			width: 100%;
			text-align: center;
			color: #fff;
    		background-color: #28a745;
    		background-image: linear-gradient(-180deg,#34d058,#28a745 90%);
    		padding: 6px 12px;
    		font-size: 14px;
    		font-weight: 600;
    		line-height: 20px;
    		white-space: nowrap;
    		cursor: pointer;
    		-webkit-user-select: none;
    		-moz-user-select: none;
    		-ms-user-select: none;
    		user-select: none;
    		background-repeat: repeat-x;
    		background-position: -1px -1px;
    		background-size: 110% 110%;
    		border: 1px solid rgba(27,31,35,.2);
    		border-radius: .25em;
    		-webkit-appearance: none;
    		-moz-appearance: none;
    		appearance: none;
		}*/
		/* BG */
#bg {
  -moz-transition: opacity 2s ease-in-out;
  -webkit-transition: opacity 2s ease-in-out;
  -ms-transition: opacity 2s ease-in-out;
  transition: opacity 2s ease-in-out;
  height: 100%;
  left: 0;
  opacity: 0.375;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: -2; }
  #bg div {
    -moz-transition: opacity 3s ease;
    -webkit-transition: opacity 3s ease;
    -ms-transition: opacity 3s ease;
    transition: opacity 3s ease;
    background-size: cover;
    height: 100%;
    left: 0;
    opacity: 0;
    position: absolute;
    top: 0;
    visibility: hidden;
    width: 150%; }
    #bg div.visible {
      -moz-animation: bg 45s linear infinite;
      -webkit-animation: bg 45s linear infinite;
      -ms-animation: bg 45s linear infinite;
      animation: bg 45s linear infinite;
      opacity: 1;
      visibility: visible;
      z-index: -2; }
      #bg div.visible.top {
        z-index: -1; }
      @media screen and (max-width: 1280px) {
        #bg div.visible {
          -moz-animation: bg 29.25s linear infinite;
          -webkit-animation: bg 29.25s linear infinite;
          -ms-animation: bg 29.25s linear infinite;
          animation: bg 29.25s linear infinite; } }
      @media screen and (max-width: 736px) {
        #bg div.visible {
          -moz-animation: bg 18s linear infinite;
          -webkit-animation: bg 18s linear infinite;
          -ms-animation: bg 18s linear infinite;
          animation: bg 18s linear infinite; } }
    #bg div:only-child {
      -moz-animation-direction: alternate !important;
      -webkit-animation-direction: alternate !important;
      -ms-animation-direction: alternate !important;
      animation-direction: alternate !important; }
  body.is-preload #bg {
    opacity: 0; }

@-moz-keyframes bg {
  0% {
    -moz-transform: translateX(0);
    -webkit-transform: translateX(0);
    -ms-transform: translateX(0);
    transform: translateX(0); }
  100% {
    -moz-transform: translateX(-25%);
    -webkit-transform: translateX(-25%);
    -ms-transform: translateX(-25%);
    transform: translateX(-25%); } }

@-webkit-keyframes bg {
  0% {
    -moz-transform: translateX(0);
    -webkit-transform: translateX(0);
    -ms-transform: translateX(0);
    transform: translateX(0); }
  100% {
    -moz-transform: translateX(-25%);
    -webkit-transform: translateX(-25%);
    -ms-transform: translateX(-25%);
    transform: translateX(-25%); } }

@-ms-keyframes bg {
  0% {
    -moz-transform: translateX(0);
    -webkit-transform: translateX(0);
    -ms-transform: translateX(0);
    transform: translateX(0); }
  100% {
    -moz-transform: translateX(-25%);
    -webkit-transform: translateX(-25%);
    -ms-transform: translateX(-25%);
    transform: translateX(-25%); } }

@keyframes bg {
  0% {
    -moz-transform: translateX(0);
    -webkit-transform: translateX(0);
    -ms-transform: translateX(0);
    transform: translateX(0); }
  100% {
    -moz-transform: translateX(-25%);
    -webkit-transform: translateX(-25%);
    -ms-transform: translateX(-25%);
	transform: translateX(-25%); } }
	
	.auth-form-header h1{
		font-size: 2.25em;
  		margin: 0 0 0.2em 0;
	}
	
	
	/*아이디 중복체크 버튼*/
	#PWDline {
		width:100%;
		display:inline-block;
	}
	#PWDlabel {
		margin-bottom:0;
		width:auto;
		display:inline-block;
		float:left;
		margin-right:10px;
	}
	#message {
		float:left;
		font-size:0.9em;
		display:inline-block;
		color:#f56a6a;
	}
	
	#idCheckBtn {
		font-size:0.9em;
		display:inline-block;
		float:right;
		width:100px;
		text-align:center;
		cursor:pointer;
    	color: #fff;
		background-color: #fba7a7 !important;
    	background-repeat: no-repeat;
    	background-position: right 8px center;
    	border: none;
    	border-radius: 3px;
    	outline: none;
	}
	#idCheckBtn:hover {
		background-color:#f56a6a !important;
	}
	</style>
	
	<script type="text/javascript">
		
		// 아이디 중복체크
		function IDcheck(){
			var _id = $("#id").val();
			
			if(_id =='' || _id == null){
				alert("아이디를 입력하세요.");
				return;
			}
			
			$.ajax({
				type : "post",
				async : false,
				url : "http://localhost:8090/proc07/MemberCheck",
				dataType : "text",
				data : {id: _id},
				success : function(data, textStatus){
					
					if(data == 'usable'){
						$('#message').text("*존재하지않는 아이디입니다.");
					} else {
						$('#message').text("*체크 완료");
						$('#idCheckBtn').prop("disabled",true);	// 사용가능한 아이디면 중복체크 버튼 비활성화
					}
					
				}	// end success function
			});	// end ajax
		}	// end IDcheck()
	
	</script>
	
</head>
<body>
	<div class="header"><a class="ft_icon" href="LoginForm.jsp"><img src="../../images/CoPaYou_icon.png" width="48" height="48"></a></div>
	<div class="main">
		<div class="auth-form" id="signup">
			<form action="../pro/ForgotPro.jsp" id="frmmember" name="frmmember">	<!-- 임시 폼태그 -->
				<div class="auth-form-header">
					<h1>비밀번호 찾기</h1>
				</div>
				<p></p>
				<div class="auth-form-body">
					<div class="form-control">
						<div id="PWDline">
							<label id="PWDlabel">비밀번호를 잊어버렸나요?</label><div id="message"></div>
							<div id="idCheckBtn" onclick="IDcheck()">아이디 유무확인</div>
						</div>
						<input type="text" name="id" id="id" placeholder="가입한 아이디 입력">
						<input type="text" name="email" id="togetmail" placeholder="메일 받을 이메일 입력">
						<div id="storeId" style="display: none;"></div><div id="storeEmail" style="display: none;"></div>
						<input type="button" name="commit" value="이메일 전송" onclick="sendMail();">
					</div>
				</div>
			</form>
		</div>

	</div>
	<div class="footer"></div>
	<script src="assets/js/bg.js"></script>
	<script type="text/javascript">
		function sendMail(){
			var frmmember = document.frmmember;
			var check = $("#message").text();
			if(check =='' || check == null || check == "*존재하지않는 아이디입니다."){
				alert("아이디 유무를 확인해주세요.");
				return;
			}else{
				var id = $('#id').val();
				$('#storeId').text(id);
				var email = $('#email').val();
				$('#storeEmail').text(email);
				
				var storeId = $('#storeId');
				var storeEmail = $('#storeEmail');
				
				frmmember.method = "post";
				frmmember.action = "../pro/ForgotPro.jsp";
				frmmember.submit();
			}
		}
	</script>
<script>//bg Setting
	(function() {

"use strict";

var	$body = document.querySelector('body');

// Methods/polyfills.

	// classList | (c) @remy | github.com/remy/polyfills | rem.mit-license.org
		!function(){function t(t){this.el=t;for(var n=t.className.replace(/^\s+|\s+$/g,"").split(/\s+/),i=0;i<n.length;i++)e.call(this,n[i])}function n(t,n,i){Object.defineProperty?Object.defineProperty(t,n,{get:i}):t.__defineGetter__(n,i)}if(!("undefined"==typeof window.Element||"classList"in document.documentElement)){var i=Array.prototype,e=i.push,s=i.splice,o=i.join;t.prototype={add:function(t){this.contains(t)||(e.call(this,t),this.el.className=this.toString())},contains:function(t){return-1!=this.el.className.indexOf(t)},item:function(t){return this[t]||null},remove:function(t){if(this.contains(t)){for(var n=0;n<this.length&&this[n]!=t;n++);s.call(this,n,1),this.el.className=this.toString()}},toString:function(){return o.call(this," ")},toggle:function(t){return this.contains(t)?this.remove(t):this.add(t),this.contains(t)}},window.DOMTokenList=t,n(Element.prototype,"classList",function(){return new t(this)})}}();

	// canUse
		window.canUse=function(p){if(!window._canUse)window._canUse=document.createElement("div");var e=window._canUse.style,up=p.charAt(0).toUpperCase()+p.slice(1);return p in e||"Moz"+up in e||"Webkit"+up in e||"O"+up in e||"ms"+up in e};

	// window.addEventListener
		(function(){if("addEventListener"in window)return;window.addEventListener=function(type,f){window.attachEvent("on"+type,f)}})();

// Play initial animations on page load.
	window.addEventListener('load', function() {
		window.setTimeout(function() {
			$body.classList.remove('is-preload');
		}, 100);
	});

// Slideshow Background.
	(function() {

		// Settings.
			var settings = {

				// Images (in the format of 'url': 'alignment').
					images: {
						'../../images/sign_bg01.jpg': 'center',
						'../../images/sign_bg02.jpg': 'center',
						'../../images/sign_bg03.jpg': 'center'
					},

				// Delay.
					delay: 6000

			};

		// Vars.
			var	pos = 0, lastPos = 0,
				$wrapper, $bgs = [], $bg,
				k, v;

		// Create BG wrapper, BGs.
			$wrapper = document.createElement('div');
				$wrapper.id = 'bg';
				$body.appendChild($wrapper);

			for (k in settings.images) {

				// Create BG.
					$bg = document.createElement('div');
						$bg.style.backgroundImage = 'url("' + k + '")';
						$bg.style.backgroundPosition = settings.images[k];
						$wrapper.appendChild($bg);

				// Add it to array.
					$bgs.push($bg);

			}

		// Main loop.
			$bgs[pos].classList.add('visible');
			$bgs[pos].classList.add('top');

			// Bail if we only have a single BG or the client doesn't support transitions.
				if ($bgs.length == 1
				||	!canUse('transition'))
					return;

			window.setInterval(function() {

				lastPos = pos;
				pos++;

				// Wrap to beginning if necessary.
					if (pos >= $bgs.length)
						pos = 0;

				// Swap top images.
					$bgs[lastPos].classList.remove('top');
					$bgs[pos].classList.add('visible');
					$bgs[pos].classList.add('top');

				// Hide last image after a short delay.
					window.setTimeout(function() {
						$bgs[lastPos].classList.remove('visible');
					}, settings.delay / 2);

			}, settings.delay);

	})();

// Signup Form.
	(function() {

		// Vars.
			var $form = document.querySelectorAll('#signup-form')[0],
				$submit = document.querySelectorAll('#signup-form input[type="submit"]')[0],
				$message;

		// Bail if addEventListener isn't supported.
			if (!('addEventListener' in $form))
				return;

		// Message.
			$message = document.createElement('span');
				$message.classList.add('message');
				$form.appendChild($message);

			$message._show = function(type, text) {

				$message.innerHTML = text;
				$message.classList.add(type);
				$message.classList.add('visible');

				window.setTimeout(function() {
					$message._hide();
				}, 3000);

			};

			$message._hide = function() {
				$message.classList.remove('visible');
			};

		// Events.
		// Note: If you're *not* using AJAX, get rid of this event listener.
			$form.addEventListener('submit', function(event) {

				event.stopPropagation();
				event.preventDefault();

				// Hide message.
					$message._hide();

				// Disable submit.
					$submit.disabled = true;

				// Process form.
				// Note: Doesn't actually do anything yet (other than report back with a "thank you"),
				// but there's enough here to piece together a working AJAX submission call that does.
					window.setTimeout(function() {

						// Reset form.
							$form.reset();

						// Enable submit.
							$submit.disabled = false;

						// Show message.
							$message._show('success', 'Thank you!');
							//$message._show('failure', 'Something went wrong. Please try again.');

					}, 750);

			});

	})();

})();
</script>
</body>
</html>