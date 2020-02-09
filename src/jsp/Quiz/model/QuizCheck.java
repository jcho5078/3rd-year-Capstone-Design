package jsp.Quiz.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/QuizCheck")
public class QuizCheck extends HttpServlet {
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
		int score = Integer.parseInt(request.getParameter("score"));
		String what = (String)request.getParameter("what");
		
		System.out.println("id = "+id);
		System.out.println("score = "+score);
		System.out.println("what = "+what);
		
		
		QuizDAO Qdao = new QuizDAO();
		int quizCheck;
		try {
			quizCheck = Qdao.updateQUIZ(id, score, what);
			if(quizCheck == 0) {
				out.print("not_usable");
			} else {
				out.print("usable");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
