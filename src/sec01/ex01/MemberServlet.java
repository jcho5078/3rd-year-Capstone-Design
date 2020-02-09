package sec01.ex01;

import sec01.ex01.MemberDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member3")
public class MemberServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handle(request,response);
	}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handle(request,response);
	}
	
	//실행함수
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		
		MemberDAO dao = new MemberDAO(); 
		
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		
		
		if(command != null && command.equals("addMember")) {
			String _id = request.getParameter("id");
			String _pwd = request.getParameter("pwd");
			String _name = request.getParameter("name");
			String _email = request.getParameter("email");
			
			MemberVO vo = new MemberVO();
			vo.setMy_id(_id);
			vo.setMy_pwd(_pwd);
			vo.setMy_name(_name);
			vo.setMy_email(_email);
			dao.addMember(vo);
			
		} else if(command != null && command.equals("delMember")) {
			String id = request.getParameter("id");
			dao.delMember(id);
		} else if(command != null && command.equals("updateMember")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			
			MemberVO vo = new MemberVO();
			vo.setMy_id(id);
			vo.setMy_pwd(pwd);
			vo.setMy_name(name);
			vo.setMy_email(email);
			dao.updateMember(vo);
			
			
			
		}
		
		List list = dao.ListMember();
		
		out.print("<html><body>");
		out.print("<table border=1><tr align='center'bgcolor='lightgreen'>");
		out.print("<td>아이디</td><td>비밀번호</td><td>이름</td><td>이메일</td><td>가입일</td><td>삭제</td><td>수정</td></tr>");
		
		
		for(int i = 0; i<list.size(); i++) {
			MemberVO memberVO = (MemberVO)list.get(i);
			
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
					+"<a href='/proc07/member3?command=delMember&id="+id+"'>삭제</a></td><td>"
					+"<a href='/proc07/memberForm2.jsp?&id="+id+"&pwd="+pwd+"&name="+name+"&email="+email+"'>수정</a></td></tr>");
			
		}
		
		out.print("</table></body></html>");
		out.print("<a href='/proc07/memberForm.html'>새 회원 가입하기</a>");
	}

}
