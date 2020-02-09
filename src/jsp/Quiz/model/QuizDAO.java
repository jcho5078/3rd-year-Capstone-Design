package jsp.Quiz.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jsp.member.model.MemberVO;


public class QuizDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory;
	
	public QuizDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private static QuizDAO instance;
    
    // 싱글톤 패턴
	//private QuizHtmlDAO(){}
    public static QuizDAO getInstance(){
        if(instance==null)
            instance=new QuizDAO();
        return instance;
    }
    
    
    // 퀴즈 테이블에 아이디 추가
 	public void addquiz(String id) {
 		try {
 			con = dataFactory.getConnection();
 			
 			String query = "insert into t_quiz(id) values(?)";
 			System.out.println(query);
 			
 			pstmt = con.prepareStatement(query);
 			pstmt.setString(1, id);
 			
 			pstmt.executeUpdate();
 			pstmt.close();
 			
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 	}
    
    
    // 점수 저장
    public int updateQUIZ(String id, int score, String what) throws SQLException {
    	Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			int x = 0;
			
			//String query1 = "select "+what+" from t_member where id=?";
			String query1 = "select nvl2("+what+", "+what+", 0) "+what+" from t_quiz where id=?";
			String query2 = "update t_quiz set "+what+"=? where id=?";
			
			
			con = dataFactory.getConnection();
			// 자동 커밋을 false로 한다.
            con.setAutoCommit(false);
			
			// 아이디에 맞는 html 점수 조회
			System.out.println("prepareStatement : " + query1);
			pstmt = con.prepareStatement(query1);
			
			pstmt.setString(1, id);
            rs = pstmt.executeQuery();
			
            if (rs.next()) {
            	pstmt.close();
        		pstmt = null;
        			
        		System.out.println("prepareStatement : " + query2);
        		pstmt = con.prepareStatement(query2);
        		
                pstmt.setInt(1, score);
                pstmt.setString(2, id);
                pstmt.executeUpdate();
                con.commit(); 
                
                x = 1;
            }
            return x;
			
		} catch (Exception sqle) {
			con.rollback(); // 오류 시 롤백
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( con != null ){ con.close(); con=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
    }
    
    
    // 퀴즈 테이블에 아이디에 맞는 값들 삭제
 	public int deletequiz(String id) {
 		Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
         
        int x = 0;
        
 		try {
 			
 			String query1 = "delete from t_quiz where id=?";
         	
             con = dataFactory.getConnection();
  
             // 자동 커밋을 false로 한다.
             con.setAutoCommit(false);
             
             // 1. 아이디에 해당하는 비밀번호를 조회한다.
             System.out.println("prepareStatement : " + query1);
             pstmt = con.prepareStatement(query1);
             pstmt.setString(1, id);
             pstmt.executeUpdate();
             pstmt.close();
             
             con.commit(); 
             x = 1;
 			
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return x;
 	}
 	
 	// HTML 점수 가져오기
 	public QuizVO getHTML(String sessionid) {
 		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QuizVO qvo = null;
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select nvl2(html_0, html_0, 0) html_0, nvl2(html_1, html_1, 0) html_1, nvl2(html_2, html_2, 0) html_2 from t_quiz where id=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sessionid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int html_0 = rs.getInt("html_0");
				int html_1 = rs.getInt("html_1");
				int html_2 = rs.getInt("html_2");
				
				qvo = new QuizVO();
				
				qvo.setHtml_0(html_0);
				qvo.setHtml_1(html_1);
				qvo.setHtml_2(html_2);
			}
			
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement�� �ݴ´�.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt = null; }
				if ( con != null ){ con.close(); con = null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return qvo;
 	}
 	
 	// CSS 점수 가져오기
 	public QuizVO getCSS(String sessionid) {
 		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QuizVO qvo = null;
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select nvl2(css_0, css_0, 0) css_0, nvl2(css_1, css_1, 0) css_1 from t_quiz where id=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sessionid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int css_0 = rs.getInt("css_0");
				int css_1 = rs.getInt("css_1");
				
				qvo = new QuizVO();
				
				qvo.setCss_0(css_0);
				qvo.setCss_1(css_1);
			}
			
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt = null; }
				if ( con != null ){ con.close(); con = null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return qvo;
 	}
    
 	// JAVASCRIPT 점수 가져오기
 	public QuizVO getJAVASCRIPT(String sessionid) {
 		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QuizVO qvo = null;
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select nvl2(javascript_0, javascript_0, 0) javascript_0 from t_quiz where id=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sessionid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int javascript_0 = rs.getInt("javascript_0");
				
				qvo = new QuizVO();
				
				qvo.setJavascript_0(javascript_0);
			}
			
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt = null; }
				if ( con != null ){ con.close(); con = null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return qvo;
 	}
	
}
