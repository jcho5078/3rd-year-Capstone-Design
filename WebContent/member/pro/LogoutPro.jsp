<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 
<html>
<head>
    <title>로그아웃 처리</title>
</head>
<body>
    <%
    	//session.setAttribute("sessionID", null);
    	//session.removeAttribute("sessionID");

        session.invalidate(); // 모든세션정보 삭제
        
     	// 로그아웃시 세션에 담긴 아이디 값을 삭제한다.
        //request.getSession().removeAttribute("sessionID");

        response.sendRedirect("../view/LoginForm.jsp"); // 로그인 화면으로 다시 돌아간다.
        
    %>
</body>
</html>
