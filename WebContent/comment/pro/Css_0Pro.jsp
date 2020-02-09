<%@page import="jsp.comment.model.CommentVO"%>
<%@page import="jsp.comment.model.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
    	
    	String msg = "";
    	Boolean result = false;
    	
    	String id = request.getParameter("id");
    	String what = request.getParameter("what");
    	int num = Integer.parseInt(request.getParameter("num"));
    	String content = request.getParameter("content");
    	
    	
    	// 넘어온 what이 De이면 댓글삭제
    	if(what != null && what.equals("De")){
        	CommentDAO cdao = new CommentDAO();
        	result = cdao.deleteComment(num);
    	}
    	// 넘어온 what이 Mo이면 댓글수정
    	else if(what != null && what.equals("Mo")){
    		CommentDAO cdao = new CommentDAO();
        	result = cdao.modifyComment(num, content);
    	}
    	
    	else if(what != null && what.equals("Wr")) {
    		CommentDAO cdao = new CommentDAO();
    		
    		CommentVO cvo = new CommentVO();
    		cvo.setMy_num(num);
    		cvo.setMy_id(id);
    		cvo.setMy_content(content);
    		result = cdao.addComment(cvo);
    	}
    	
    	
    	if(result == true) { 
            msg = "../../MainForm.do?contentPage=ContentView/CSS/Css_0.jsp";
            //msg = "MainForm.do";
        }
        else {
            msg = "../../MainForm.do?contentPage=ContentView/CSS/Css_0.jsp";
        }

     	// sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
    	
    %>

</body>
</html>