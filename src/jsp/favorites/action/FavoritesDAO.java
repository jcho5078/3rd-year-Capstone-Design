package jsp.favorites.action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jsp.member.model.MemberVO;


public class FavoritesDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory;
	
	public FavoritesDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private static FavoritesDAO instance;
    
    // 싱글톤 패턴
    public static FavoritesDAO getInstance(){
        if(instance==null)
            instance=new FavoritesDAO();
        return instance;
    }
	
    // 즐겨찾기 테이블에 아이디 추가
  	public void addfavorites(String id) {
  		try {
  			con = dataFactory.getConnection();
  			
  			String query = "insert into t_favorites(id) values(?)";
  			System.out.println(query);
  			
  			pstmt = con.prepareStatement(query);
  			pstmt.setString(1, id);
  			
  			pstmt.executeUpdate();
  			pstmt.close();
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  	}
  	
  	
  	// 즐겨찾기 추가
  	public Boolean updatefavorites(String id, String what) {
  		boolean result = false;
  		
  		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "update t_favorites set "+what+"=1 where id=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			
			// 자동 커밋을 false로 한다.
            //conn.setAutoCommit(false);


			pstmt.setString(1, id);
			
			//rs = pstmt.executeQuery();
			pstmt.executeUpdate();
			// 완료시 커밋
            //con.commit(); 


			pstmt.close();
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( con != null ){ con.close(); con=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
  		
		return result;
  	}
  	
  	
  	// 즐겨찾기 삭제
   	public Boolean deletefavorites(String id, String what) {
   		boolean result = false;
   		
   		Connection con = null;
 		PreparedStatement pstmt = null;
 		
 		try {
 			
 			con = dataFactory.getConnection();
 			
 			String query = "update t_favorites set "+what+"=0 where id=?";
 			System.out.println("prepareStatement : " + query);
 			
 			pstmt = con.prepareStatement(query);
 			
 			// 자동 커밋을 false로 한다.
             //conn.setAutoCommit(false);


 			pstmt.setString(1, id);
 			
 			//rs = pstmt.executeQuery();
 			pstmt.executeUpdate();
 			// 완료시 커밋
             //con.commit(); 


 			pstmt.close();
 			
 		} catch (Exception sqle) {
 			throw new RuntimeException(sqle.getMessage());
 		} finally {
 			try{
 				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
 				if ( con != null ){ con.close(); con=null;	}
 			}catch(Exception e){
 				throw new RuntimeException(e.getMessage());
 			}
 		}
   		
 		return result;
   	}
  	
   	// 즐겨찾기 확인
   	public FavoritesVO whatfavorites(String id, String what) {
   		
   		Connection con = null;
 		PreparedStatement pstmt = null;
 		FavoritesVO fvo = null;
 		
 		try {
 			
 			con = dataFactory.getConnection();
 			
 			String query = "select nvl2("+what+","+what+", 0) "+what+" from t_favorites where id=?";
 			System.out.println("prepareStatement : " + query);
 			
 			pstmt = con.prepareStatement(query);
 			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int _what = rs.getInt(what);
				
				fvo = new FavoritesVO();
				fvo.setWhat(_what);
			}
 			
 		} catch (Exception sqle) {
 			throw new RuntimeException(sqle.getMessage());
 		} finally {
 			try{
 				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
 				if ( con != null ){ con.close(); con=null;	}
 			}catch(Exception e){
 				throw new RuntimeException(e.getMessage());
 			}
 		}
   		
 		return fvo;
   	}
   	
  	
  	// 즐겨찾기 불러오기
  	public FavoritesVO getListFavorites(String id) {
  		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FavoritesVO fvo = null;
    	
    	try {
    		con = dataFactory.getConnection();
			String query = "select nvl2(html_0, html_0, 0) html_0, "
					+ "nvl2(html_1, html_1, 0) html_1, "
					+ "nvl2(html_2, html_2, 0) html_2, "
					+ "nvl2(css_0, css_0, 0) css_0, "
					+ "nvl2(css_1, css_1, 0) css_1, "
					+ "nvl2(javascript_0, javascript_0, 0) javascript_0 "
					+ "from t_favorites where id=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int html_0 = rs.getInt("html_0");
				int html_1 = rs.getInt("html_1");
				int html_2 = rs.getInt("html_2");
				int css_0 = rs.getInt("css_0");
				int css_1 = rs.getInt("css_1");
				int javascript_0 = rs.getInt("javascript_0");
				
				fvo = new FavoritesVO();
				
				fvo.setHtml_0(html_0);
				fvo.setHtml_1(html_1);
				fvo.setHtml_2(html_2);
				fvo.setCss_0(css_0);
				fvo.setCss_1(css_1);
				fvo.setJavascript_0(javascript_0);
				System.out.println(html_0+"/"+html_1+"/"+html_2+"/"+css_0+"/"+css_1+"/"+javascript_0+"/");
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
    	
		return fvo;
  		
  	}
  	
  	
  	
  	// 즐겨찾기 테이블에 아이디에 맞는 값들 삭제
  	public int deleteCehckFavorites(String id) {
  		Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
          
         int x = 0;
         
  		try {
  			
  			String query1 = "delete from t_favorites where id=?";
          	
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
  	
  	
}
