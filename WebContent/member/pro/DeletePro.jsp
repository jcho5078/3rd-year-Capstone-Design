<%@page import="jsp.favorites.action.FavoritesDAO"%>
<%@page import="jsp.member.model.MemberVO"%>
<%@page import="jsp.member.model.MemberDAO"%>
<%@page import="jsp.Quiz.model.QuizDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 삭제</title>
</head>
<body>

<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
        String id = session.getAttribute("sessionID").toString(); 
        String pwd = request.getParameter("pwd").toString();
        
        // 세션에서 아이디를, DeleteForm.jsp에서 입력받은 비밀번호를 가져온다.
        // 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
        //MemberDAO dao = MemberDAO.getInstance();
        MemberDAO dao = new MemberDAO();
        MemberVO vo = new MemberVO();
		vo.setMy_id(id);
		vo.setMy_pwd(pwd);
        int check = dao.deleteMember(vo);
        
        QuizDAO qdao = new QuizDAO();
        int check2 = qdao.deletequiz(id);
        
        FavoritesDAO fdao = new FavoritesDAO();
        int check3 = fdao.deleteCehckFavorites(id);
        
        if(check == 1 && check2 == 1 && check3 == 1){
        	//request.getSession().removeAttribute("sessionID");
        	//session.setAttribute("sessionID", null);
        	session.removeAttribute("sessionID");
            //session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
    %>
        <br><br>
        <p style="text-align:center;"><b><font size="4" color="gray">회원정보가 삭제되었습니다.</font></b></p>
        <br><br><br>
    
        <input type="button" value="확인" onclick="javascript:window.location='member/view/LoginForm.jsp'" style="display:block; margin:0 auto;">
    
    <%    
         // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
        } else if(check != 1){
    %>
        <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
    <%
        } 
    %>


</body>
</html>