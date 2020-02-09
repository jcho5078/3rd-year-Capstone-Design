package jsp.visit.action;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import jsp.visit.model.VisitCountDAO;


/**
 * 방문자 수를 계산하는 클래스
 * web.xml에 listener 등록을 해두었음.
 * 이렇게 할 경우 통캣이 실행되면서 리스너가 실행
 */
public class VisitSessionListener implements HttpSessionListener
{

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		
		// 세션이 새로 생성되면 execute() 실행
		if(sessionEve.getSession().isNew()){
	    	execute(sessionEve);
	    }
	}

	private void execute(HttpSessionEvent sessionEve) 
	{
		VisitCountDAO dao = VisitCountDAO.getInstance();
		
		try {
			// 전체 방문자 수 증가
			dao.setTotalCount();
			// 총 방문자 수
			int totalCount = dao.getTotalCount();
			// 오늘 방문자 수
			int todayCount = dao.getTodayCount();
			
			HttpSession session = sessionEve.getSession();
			
			// 세션에 방문자 수를 담는다.
	        session.setAttribute("totalCount", totalCount); 
	        session.setAttribute("todayCount", todayCount);
			
		} catch (Exception e) {
			System.out.println("\n===== 방문자 카운터 오류 =====\n");
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {}

}
