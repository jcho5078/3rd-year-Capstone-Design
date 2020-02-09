<%@page import="jsp.member.model.MemberDAO"%>
<%@page import="jsp.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정 처리</title>
</head>
<body>
	<jsp:useBean id="memberVO" class="jsp.member.model.MemberVO" />
	<jsp:setProperty property="*" name="memberVO"/>

	<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		MemberDAO dao = new MemberDAO();
		//String command = request.getParameter("command");
	    	
	    //if (command != null && command.equals("modify")) {

			String session_id = session.getAttribute("sessionID").toString();
			String pwd = request.getParameter("pwd").toString();
			String name = request.getParameter("name");
    		String email = request.getParameter("email");

			MemberVO vo = new MemberVO();
			vo.setMy_id(session_id);
			vo.setMy_pwd(pwd);
			vo.setMy_name(name);
			vo.setMy_email(email);

			// 세션에 저장된 아이디를 가져와서
			// 그 아이디 해당하는 회원정보를 가져온다.
			//MemberDAO dao = MemberDAO.getInstance();

			dao.updateMember(vo);
		//}
	%>

	<!-- Section -->
	<section>
		<header class="major">
			<h2>정보 수정</h2>
		</header>
		
		<div>정보가 수정되었습니다.</div>
		<input type="button" value="메인으로" onclick="javascript:window.location='MainForm.jsp'"/>
	</section>
</body>
</html>