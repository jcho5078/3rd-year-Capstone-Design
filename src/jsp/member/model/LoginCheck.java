package jsp.member.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = (String)request.getParameter("id");
		String pwd = (String)request.getParameter("pwd");
		
		System.out.println("id = "+id);
		System.out.println("pwd = "+pwd);
		
		
		MemberDAO dao = new MemberDAO();
		boolean loginCheck = dao.LoginCheck(id,pwd);
		
		if(loginCheck == false) {
			out.print("not_usable");
		} else {
			out.print("usable");
		}
		
		
	}

}
