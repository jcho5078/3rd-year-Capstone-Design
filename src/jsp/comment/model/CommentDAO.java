package jsp.comment.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jsp.member.model.MemberVO;


public class CommentDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory;
	
	public CommentDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static CommentDAO instance;
    
    // 싱글톤 패턴
	//private CommentDAO(){}
    public static CommentDAO getInstance(){
        if(instance==null)
            instance=new CommentDAO();
        return instance;
    }
	
	
    
    // 댓글 추가
    public Boolean addComment(CommentVO cvo){
    	Boolean result = false;
		try {
			con = dataFactory.getConnection();
			
			con.setAutoCommit(false);
			
			int num = cvo.getMy_num();
			String id = cvo.getMy_id();
			//String pwd = cvo.getMy_pwd();
			String content = cvo.getMy_content();
			System.out.println("num : "+num+"\nid : "+id+"\ncontent : "+content);
			
			
			String query = "insert into t_comment";
			query += "(num,id,content)";
			query += "values(?,?,?)";
			
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			System.out.println("prepareStatement : " + query);
			
			int flag = pstmt.executeUpdate();
			System.out.println("댓글 추가됨");
			if(flag > 0) {
				result = true;
				con.commit();
				System.out.println("result : "+result);
			}
			//pstmt.close();
			
			//result = true;
			
			return result;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt = null; }
				if ( con != null ){ con.close(); con = null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		
	}
	
    public CommentVO getCommentAddNum() {
    	
    	
    	Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentVO cvo = null;
    	
    	try {
    		con = dataFactory.getConnection();
			String query = "select nvl(max(num),0) as num from t_comment";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int num = rs.getInt("num");
				System.out.println(num);
				
				num+=1;
				
				cvo = new CommentVO();
				
				cvo.setMy_num(num);
			}
			
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt = null; }
				if ( con != null ){ con.close(); con = null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
    	
		return cvo;
    }	// end
    
	// 댓글 목록
    public List ListComment() {
		
		List list = new ArrayList();
		
		try {
			
			con = dataFactory.getConnection();
			String query = "select * from t_comment order by num desc";
			
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String content = rs.getString("content");
				Date joinDate = rs.getDate("joinDate");
				
				CommentVO cvo = new CommentVO();
				
				cvo.setMy_num(num);
				cvo.setMy_id(id);
				cvo.setMy_content(content);
				cvo.setMy_joinDate(joinDate);
				list.add(cvo);
				
				
			}
			rs.close();
			pstmt.close();
			con.close();
			
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt = null; }
				if ( con != null ){ con.close(); con = null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		
		
		
		return list;
		
	}
	
    // 댓글 수정
    public Boolean modifyComment(int num, String content) throws SQLException {
    	Connection con = null;
		PreparedStatement pstmt = null;
		Boolean result = false;
		
		try {
			
			con = dataFactory.getConnection();
			
			// 자동 커밋을 false로 한다.
            con.setAutoCommit(false);
			
			String query = "update t_comment set content=? where num=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			
			// 자동 커밋을 false로 한다.
            //con.setAutoCommit(false);


			pstmt.setString(1, content);
			pstmt.setInt(2, num);
			
			int flag = pstmt.executeUpdate();
            if(flag > 0) {
            	result = true;
            	con.commit();
            }
			result = true;

			pstmt.close();
			
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
		return result;
    }
    
    
    // 댓글 삭제
    public Boolean deleteComment(int num) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        Boolean result = false;
 
        try {
            
        	con = dataFactory.getConnection();
        	
        	// 자동 커밋을 false로 한다.
            con.setAutoCommit(false);
            
            String query = "delete from t_comment where num=?";
            
            System.out.println("prepareStatement : " + query);
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, num);
            
            int flag = pstmt.executeUpdate();
            if(flag > 0) {
            	result = true;
            	con.commit();
            }
 
 
        } catch (Exception sqle) {
        	System.out.println("댓글삭제오류");
            try {
                con.rollback(); // 오류시 롤백
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
        
		return result;
    } // end deleteComment
    
	
	
}
