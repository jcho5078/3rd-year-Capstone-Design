package sec01.ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.member.model.MemberVO;

@WebServlet("/viewMembers")
public class ViewServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		List memberList = (List)request.getAttribute("memberList");
		
		out.println("<html><body>");
		out.println("<table border=1><tr align='center' bgcolor='lightgreen'>");
		out.println("<td>아이디</td><td>비밀번호</td><td>이름</td><td>이메일</td><td>가입일</td><td>삭제</td></tr>");
		
		
		for(int i = 0; i<memberList.size(); i++) {
			MemberVO memberVO = (MemberVO)memberList.get(i);
			
			String id = memberVO.getMy_id();
			String pwd = memberVO.getMy_pwd();
			String name = memberVO.getMy_name();
			String email = memberVO.getMy_email();
			Date joinDate = memberVO.getMy_joinDate();
			
			out.print("<tr><td>"+id+"</td><td>"
					+pwd+"</td><td>"
					+name+"</td><td>"
					+email+"</td><td>"
					+joinDate+"</td><td>"
					+"<a href='/proc07/member3?command=delMember&id="+id+"'>삭제</a></td></tr>");
			
		}
		
		out.print("</table></body></html>");
		out.print("<a href='/proc07/memberForm.html'>새 회원 가입하기</a>");
	}

	

}
