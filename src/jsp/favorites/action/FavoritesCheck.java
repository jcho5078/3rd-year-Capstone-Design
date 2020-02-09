package jsp.favorites.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.member.model.MemberDAO;

@WebServlet("/FavoritesCheck")
public class FavoritesCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FavoritesCheck() {
        super();
    }

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
		String what = (String)request.getParameter("what");
		int play = Integer.parseInt(request.getParameter("play"));
		
		System.out.println("id = "+id);
		
		// 즐겨찾기 삭제
		if(play == 0) {
			FavoritesDAO fdao = new FavoritesDAO();
			boolean result = fdao.deletefavorites(id, what);
			
			if(result == true) {
				out.print("no");
			} else {
				out.print("yes");
			}
		} 
		// 즐겨찾기 추가
		else if(play == 1) {
			
			FavoritesDAO fdao = new FavoritesDAO();
			boolean result = fdao.updatefavorites(id, what);
			
			if(result == true) {
				out.print("no");
			} else {
				out.print("yes");
			}
		}
		// 즐겨찾기 상태
		else if(play == -1) {
			FavoritesDAO fdao = new FavoritesDAO();
			
			FavoritesVO result = fdao.whatfavorites(id, what);
			
			if(result.getWhat() == 1) {
				out.print("yes");
			} else {
				out.print("no");
			}
		}
		
	}
}
