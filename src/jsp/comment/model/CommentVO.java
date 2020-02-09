package jsp.comment.model;

import java.sql.Date;

public class CommentVO {

	private int my_num;
	private String my_id;
	private String my_pwd;
	private String my_content;
	private Date my_joinDate;
	
	
	public int getMy_num() {
		return my_num;
	}
	public void setMy_num(int my_num) {
		this.my_num = my_num;
	}
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
	public String getMy_content() {
		return my_content;
	}
	public void setMy_content(String my_content) {
		this.my_content = my_content;
	}
	public Date getMy_joinDate() {
		return my_joinDate;
	}
	public void setMy_joinDate(Date my_joinDate) {
		this.my_joinDate = my_joinDate;
	}
	
	
}
