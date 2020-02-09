<%@page import="jsp.comment.model.CommentVO"%>
<%@page import="jsp.comment.model.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글</title>
</head>
<body>
<% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
    	
    	
    	String msg = "";
    	CommentDAO cdao = new CommentDAO();
    	//String command = request.getParameter("command");
    	
    	// 회원 가입창에서 전송된 command가 addMember이면 전송된 값들을 받아온다.
    	// 얻어온 값들을 MemberVO객체에 저장 후 MemberDAO의 addMember()안에 있는 SQL문을 이용해 전달
    	//if(command != null && command.equals("addMember")){
    		int num = Integer.parseInt(request.getParameter("num"));
    		String id = request.getParameter("id");
    		String content = request.getParameter("content");
    		
    		CommentVO cvo = new CommentVO();
    		cvo.setMy_num(num);
    		cvo.setMy_id(id);
    		cvo.setMy_content(content);
    		Boolean result = cdao.addComment(cvo);
    	//}
    	
    	if(result == true){
    		msg = "../../MainForm.do?contentPage=ContentView/HTML/Html_0.jsp";
    	} else {
    		msg = "../../MainForm.do?contentPage=ContentView/HTML/Html_0.jsp";
    	}
    	response.sendRedirect(msg);
    %>

</body>
</html>