package sec01.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.Session;



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
		
	}
	
	
	
	// 회원추가
	public void addMember(MemberVO memverVO) {
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
	
	// 회원삭제
	public void delMember(String id) {
		try {
			con = dataFactory.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "delete from t_member" + " where id=?";
			
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		try {
			con = dataFactory.getConnection();
			Statement stmt = con.createStatement();
			
			String id = vo.getMy_id();
			String pwd = vo.getMy_pwd();
			String name = vo.getMy_name();
			String email = vo.getMy_email();
			
			String query = "update t_member set pwd=?, name=?, email=?" + " where id=?";
			
			System.out.println("preapreStatement : " + query);
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			
			
			pstmt.executeUpdate();
			pstmt.close();
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
