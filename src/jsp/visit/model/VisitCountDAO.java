package jsp.visit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


/**
 * Visit 테이블의 DAO
 * 방문자 관련 처리
 */
public class VisitCountDAO 
{
	private static VisitCountDAO instance;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory;
	
	public VisitCountDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 싱글톤 패턴
	//private VisitCountDAO(){}
	public static VisitCountDAO getInstance(){
		if(instance==null)
			instance=new VisitCountDAO();
		return instance;
	}
	
	/**
	 * 총 방문자 수를 증가
	 */
	public void setTotalCount() throws SQLException, ClassNotFoundException, NamingException
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			// 쿼리 생성
			// 총 방문자 수를 증가시키기 위해 테이블에 현재 날짜 값을 추가
			String query = "insert into visit (v_date) values(sysdate)";
			//StringBuffer sql = new StringBuffer();
			//sql.append("INSERT INTO VISIT (V_DATE) VALUES (sysdate)");
			
			// 커넥션 가져오기
			conn = dataFactory.getConnection();
						
			// 자동 커밋 false
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(query);
			//pstmt = conn.prepareStatement(sql.toString());
			// 쿼리 실행
			pstmt.executeUpdate();
			// 완료 시 커밋
			conn.commit(); 
			
		} catch (SQLException sqle) {
			// 오류 시 롤백
			conn.rollback(); 
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 담는다.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end setTotalCount()
	
	/**
	 * 총 방문자 수를 가져온다.
	 * @return totalCount : 총 방문자 수
	 */
	public int getTotalCount()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		
		try {
			
			// 테이블의 데이터 수를 가져옴
			// 데이터 수 = 총 방문자 수
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) AS TotalCnt FROM VISIT");
			String query = "select count(*) as TotalCnt from visit";
			
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(query);
			//pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// 방문자 수를 변수에 담는다.
			if (rs.next()) 
				totalCount = rs.getInt("TotalCnt");
			
			return totalCount;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 담는다.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end getTotalCount()
	
	/**
	 * 오늘 방문자 수를 가져온다.
	 * @return todayCount : 오늘 방문자
	 */
	public int getTodayCount()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int todayCount = 0;
		
		try {
			
			String query = "select count(*) as TodayCnt from visit where substr(to_char(v_date), 1, 9) = to_date(sysdate, 'YY-MM-DD')";
			
			/*StringBuffer sql = new StringBuffer();
			*sql.append("SELECT COUNT(*) AS TodayCnt FROM VISIT");
			*sql.append(" WHERE substr(to_char(v_date), 1,9) = TO_DATE(sysdate, 'YY-MM-DD')");
			*/
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(query);
			//pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// 방문자 수를 변수에 담는다.
			if (rs.next()) 
				todayCount = rs.getInt("TodayCnt");
			
			return todayCount;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	}// end getTodayCount()
}
