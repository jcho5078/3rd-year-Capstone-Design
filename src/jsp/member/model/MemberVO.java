package jsp.member.model;

import java.sql.Date;

public class MemberVO {
	
	private String my_id;
	private String my_pwd;
	private String my_name;
	private String my_email;
	private Date my_joinDate;
	
	private int my_html;
	
	
	
	public String getMy_id() {
		return my_id;
	}
	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}
	public String getMy_pwd() {
		return my_pwd;
	}
	public void setMy_pwd(String my_pwd) {
		this.my_pwd = my_pwd;
	}
	public String getMy_name() {
		return my_name;
	}
	public void setMy_name(String my_name) {
		this.my_name = my_name;
	}
	public String getMy_email() {
		return my_email;
	}
	public void setMy_email(String my_email) {
		this.my_email = my_email;
	}
	public Date getMy_joinDate() {
		return my_joinDate;
	}
	public void setMy_joinDate(Date my_joinDate) {
		this.my_joinDate = my_joinDate;
	}
	public int getMy_html() {
		return my_html;
	}
	public void setMy_html(int my_html) {
		this.my_html = my_html;
	}
	
	


}
