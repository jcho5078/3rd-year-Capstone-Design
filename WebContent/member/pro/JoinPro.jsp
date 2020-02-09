<%@page import="jsp.favorites.action.FavoritesDAO"%>
<%@page import="jsp.Quiz.model.QuizDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    
<%-- VO import --%>      
<%@ page import="jsp.member.model.MemberVO" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
<%@ page import="jsp.action.mail.SendEmail" %>
 
<html>
<head>
    <title>회원가입 처리 JSP</title>
    
    <!-- css 파일 분리 -->
    <link rel="stylesheet" href="../../assets/css/home.css" />

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
            color: black;
            text-align: center;
            padding: 14px;
            text-decoration: none;
            font-size: 17px;
            border-radius: 5px;
        }

        .header a:hover {
            background-color: #ddd;
            color: black;
        }

        .header a.ft_icon {
            height: 48px;
            width: 48px;
            display: block;
            margin : 0 10px;
            margin-left: auto;
            margin-right: auto;
            box-sizing: unset;
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
        .auth-form-header label {
            text-align: center;
            margin-top: 10px;
        }
        .auth-form-header .h1 {
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
        .form-control > .data {
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

        .form-control .signup-btn {
            margin-top: 40px;
        }
    </style>
    
    <script type="text/javascript">
        // 로그인 담당 JSP로 이동
        function LoginForm(){
            location.href = "../view/LoginForm.jsp";
        }
    </script>
    
</head>
<body>
    <%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
    	
    	MemberDAO dao = new MemberDAO();
    	QuizDAO qdao = new QuizDAO();
    	FavoritesDAO fdao = new FavoritesDAO();
    	String command = request.getParameter("command");
    	
    	// 회원 가입창에서 전송된 command가 addMember이면 전송된 값들을 받아온다.
    	// 얻어온 값들을 MemberVO객체에 저장 후 MemberDAO의 addMember()안에 있는 SQL문을 이용해 전달
    	if(command != null && command.equals("addMember")){
    		String id = request.getParameter("id");
    		String pwd = request.getParameter("pwd");
    		String name = request.getParameter("name");
    		String email = request.getParameter("email");
    		
    		MemberVO vo = new MemberVO();
    		vo.setMy_id(id);
    		vo.setMy_pwd(pwd);
    		vo.setMy_name(name);
    		vo.setMy_email(email);
    		dao.addMember(vo);
    		qdao.addquiz(id);
    		fdao.addfavorites(id);
    		
    		// 회원 가입 시 이메일 전송
    		MemberDAO dao2 = MemberDAO.getInstance();
            MemberVO member = dao2.getUserInfo(id);
            
         	String email1 = member.getMy_email();
         	String id1 = member.getMy_id();
         
         	SendEmail sendEmail = new SendEmail();
         	sendEmail.to = email1;
            sendEmail.title = id1+"님 CoPaYou에 오신걸 환영합니다~^0^";
            sendEmail.msg = id1 + "님 CoPaYou에 오신걸 환영합니다~ 앞으로 잘 지내보아요~";
            sendEmail.sendMethod();
    	}
    %>
    
    <%-- 자바빈 관련 액션태그 사용
    <jsp:useBean id="memberBean" class="sec01.ex02.MemberVO" />
    <jsp:setProperty property="*" name="memberBean"/> 
    
    <%
        MemberDAO dao = MemberDAO.getInstance();
    
    	// 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
    	// insertMember()는 회원 정보를 T_MEMBER 테이블에 저장한다.
    	//dao.insertMember(memberBean);
		dao.addMember(memberBean);

    %>--%>
    
    <div id="wrap">
        <div class="main">
            <div class="auth-form" id="signup">
                <form action="#" id="frmmember" name="frmmember">   <!--action설정-->
                    <div class="auth-form-header">
                        <label><%=request.getParameter("name") %> 님</label>
                        <label class="h1">회원가입을 축하드립니다</label>
                    </div>
                    <div class="auth-form-body">
                        <div class="form-control">
                            <label>이름</label>
                            <div class="data"><%=request.getParameter("name") %></div>

                            <label>이메일</label>
                            <div class="data"><%=request.getParameter("email") %></div>

                            <label>아이디</label>
                            <div class="data"><%=request.getParameter("id") %></div>

                            <label>비밀번호</label>
                            <div class="data"><%=request.getParameter("pwd") %></div>
                            
                            <div class="btnbtn">
                                <input type="button" name="commit" value="확인" class="signup-btn" onclick="LoginForm()">
                            </div>
                        </div>
                    </div>
                
                </form>
            </div>
        </div>

        
    </div>
</body>
</html>
