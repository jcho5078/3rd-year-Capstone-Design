<%@page import="jsp.member.model.MemberDAO"%>
<%@page import="jsp.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<body>
	<% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
    	
    	
    	
    	String id = request.getParameter("id");
    	session.setAttribute("sessionID", id);
        String msg = "../../MainForm.do";
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
    	
    	
    	
    	/*
    	MemberDAO dao = new MemberDAO();
    	String command = request.getParameter("command");
    	
    	String id ="";
    	String pwd = "";
    	String msg = "";
    	Boolean result = false;
    	
    	// 회원 가입창에서 전송된 command가 addMember이면 전송된 값들을 받아온다.
    	// 얻어온 값들을 MemberVO객체에 저장 후 MemberDAO의 addMember()안에 있는 SQL문을 이용해 전달
    	if(command != null && command.equals("loginCheck")){
    		id = request.getParameter("id");
    		pwd = request.getParameter("password");
    		
    		MemberVO vo = new MemberVO();
    		vo.setMy_id(id);
    		vo.setMy_pwd(pwd);
    		
    		result = dao.loginCheck(vo);
    	}
    	
    	if(result == true)    // 로그인 성공
        { 
            // 세션에 현재 아이디 세팅
            session.setAttribute("sessionID", id);
            msg = "../../MainForm.do";
            //msg = "MainForm.do";
        }
        else    // 아이디가 틀릴경우
        {
            msg = "../view/LoginForm.jsp?msg=-1";
        }
        
    	
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
        */
    %>

    
</body>
</html>


