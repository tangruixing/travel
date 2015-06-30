
package cn.travel.model;

import java.io.Serializable;

public class Message implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*留言ID*/
	
	private java.lang.String content;		/*内容*/
	private java.lang.Integer stats;		/*状态*/
	private java.util.Date createDate;		/*停留天数*/
	//columns END

	private User user;
	private User admin;
	
	
	private java.lang.Integer userId;		/*用户编号id*/
	private java.lang.Integer adminId;		/*用户编号id*/
	public Message(){
	}

	public Message(
		java.lang.Integer id
	){
		this.id = id;
	}

	
		public void setId(java.lang.Integer value) {
			this.id = value;
		}
		
		public java.lang.Integer getId() {
			return this.id;
		}
	
		public void setUserId(java.lang.Integer value) {
			this.userId = value;
		}
		
		public java.lang.Integer getUserId() {
			return this.userId;
		}
	
		public void setAdminId(java.lang.Integer value) {
			this.adminId = value;
		}
		
		public java.lang.Integer getAdminId() {
			return this.adminId;
		}
	
		public void setContent(java.lang.String value) {
			this.content = value;
		}
		
		public java.lang.String getContent() {
			return this.content;
		}
	
		public void setStats(java.lang.Integer value) {
			this.stats = value;
		}
		
		public java.lang.Integer getStats() {
			return this.stats;
		}
	
		public void setCreateDate(java.util.Date value) {
			this.createDate = value;
		}
		
		public java.util.Date getCreateDate() {
			return this.createDate;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public User getAdmin() {
			return admin;
		}

		public void setAdmin(User admin) {
			this.admin = admin;
		}

		
}

