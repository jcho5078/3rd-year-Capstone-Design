package jsp.member.model;

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
import javax.naming.NamingException;
import javax.sql.DataSource;

import jsp.common.util.DBConnection;





public class MemberDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory;
	
	
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static MemberDAO instance;
    
    // 싱글톤 패턴
	//private MemberDAO(){}
    public static MemberDAO getInstance(){
        if(instance==null)
            instance=new MemberDAO();
        return instance;
    }


	// 아이디 중복체크
    public boolean overlappedID(String id) {
    	boolean result = false;
    	
    	try {
			
    		con = dataFactory.getConnection();
    		String query = "select decode(count(*),1,'true','false') as result from t_member where id=?";
    		System.out.println("prepareStatememt : "+query);
    		
    		pstmt = con.prepareStatement(query);
    		pstmt.setString(1, id);
    		ResultSet rs = pstmt.executeQuery();
    		rs.next();
    		
    		result = Boolean.parseBoolean(rs.getString("result"));
    		pstmt.close();
    		
    		return result;
    		
		} catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt = null; }
                if ( con != null ){ con.close(); con = null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }
    
    
    // 로그인 체크 함수
    public boolean LoginCheck(String id, String pwd) {
    	
    	boolean result = false;
    	
    	try {
    		con = dataFactory.getConnection();
    		
    		
    		String query = "select decode(count(*), 1, 'true', 'false') as result from t_member where id=? and pwd=?";
			
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			result = Boolean.parseBoolean(rs.getString("result"));
			System.out.println("result : "+result);
            
            return result;
    		
    		
		} catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt = null; }
                if ( con != null ){ con.close(); con = null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    	
    }
    
    
    
    
	
	/*
	public List ListMember() {
		
		List list = new ArrayList();
		
		try {
			
			con = dataFactory.getConnection();
			String query = "select * from t_member";
			
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				
				MemberVO vo = new MemberVO();
				
				vo.setMy_id(id);
				vo.setMy_pwd(pwd);
				vo.setMy_name(name);
				vo.setMy_email(email);
				vo.setMy_joinDate(joinDate);
				list.add(vo);
				
				
			}
			rs.close();
			pstmt.close();
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
		
	}*/
	

	// 회원추가
	public void addMember(MemberVO memverVO){
		try {
			con = dataFactory.getConnection();
			
			String id = memverVO.getMy_id();
			String pwd = memverVO.getMy_pwd();
			String name = memverVO.getMy_name();
			String email = memverVO.getMy_email();
			
			String query = "insert into t_member";
			query += "(id,pwd,name,email)";
			query += "values(?,?,?,?)";
			
			System.out.println("prepareStatement : " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	/*
	// 회원삭제
	public void delMember(String id, String pwd) {
		try {
			con = dataFactory.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "delete from t_member" + " where id=? and pwd=?";
			
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	
	
	public int deleteMember(MemberVO vo) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String id = vo.getMy_id();
		String pwd = vo.getMy_pwd(); 
        
        String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
        int x = -1;
 
        try {
            // 비밀번호 조회
        	String query1 = "select pwd from t_member where id=?";
        	
            //StringBuffer query1 = new StringBuffer();
            //query1.append("SELECT PWD FROM T_MEMBER WHERE ID=?");
 
            // 회원 삭제
        	String query2 = "delete from t_member where id=?";
        	
            //StringBuffer query2 = new StringBuffer();
            //query2.append("DELETE FROM T_MEMBER WHERE ID=?");
 
            con = dataFactory.getConnection();
 
            // 자동 커밋을 false로 한다.
            con.setAutoCommit(false);
            
            // 1. 아이디에 해당하는 비밀번호를 조회한다.
            System.out.println("prepareStatement : " + query1);
            pstmt = con.prepareStatement(query1);
            //pstmt = con.prepareStatement(query1.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) 
            {
                dbpw = rs.getString("pwd");
                if (dbpw.equals(pwd)) // 입력된 비밀번호와 DB비번 비교
                {
                	pstmt.close();
        			pstmt = null;
        			
                    // 같을경우 회원삭제 진행
        			System.out.println("prepareStatement : " + query2);
                	pstmt = con.prepareStatement(query2);
                    //pstmt = con.prepareStatement(query2.toString());
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    con.commit(); 
                    x = 1; // 삭제 성공
                } else {
                    x = 0; // 비밀번호 비교결과 - 다름
                }
            }
 
            return x;
 
        } catch (Exception sqle) {
        	System.out.println("삭제오류");
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
    } // end deleteMember


	
	
	
	// 로그인시 아이디, 비밀번호 체크 메서드
    public Boolean loginCheck(MemberVO vo) 
    {
    	String id = vo.getMy_id();
    	String pwd = vo.getMy_pwd();
    	
    	try {
			con = dataFactory.getConnection();
			
			String query = "select decode(count(*), 1, 'true', 'false') as result from t_member where id=? and pwd=?";
			
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			Boolean result = Boolean.parseBoolean(rs.getString("result"));
			System.out.println("result : "+result);
            
            return result;
            
		} catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt = null; }
                if ( con != null ){ con.close(); con = null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    	
    } // end loginCheck()


    // 내 정보 확인
    public MemberVO getUserInfo(String sessionid) {
    	
    	
    	Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
    	
    	try {
    		con = dataFactory.getConnection();
			String query = "select * from t_member where id=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sessionid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				
				vo = new MemberVO();
				
				vo.setMy_id(id);
				vo.setMy_pwd(pwd);
				vo.setMy_name(name);
				vo.setMy_email(email);
				vo.setMy_joinDate(joinDate);
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
    	
		return vo;
    }	// end getUserInfo
    
    
    // 회원정보 수정
    public void updateMember(MemberVO vo) throws SQLException {
    	Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			String id = vo.getMy_id();
			String pwd = vo.getMy_pwd();
			String email = vo.getMy_email();
			
			con = dataFactory.getConnection();
			
			String query = "update t_member set email=?, pwd=? where id=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			
			// 자동 커밋을 false로 한다.
            //conn.setAutoCommit(false);


			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			pstmt.setString(3, id);
			
			//rs = pstmt.executeQuery();
			pstmt.executeUpdate();
			// 완료시 커밋
            //con.commit(); 


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
    }
    
    
}
