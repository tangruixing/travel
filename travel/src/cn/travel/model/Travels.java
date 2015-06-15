
package cn.travel.model;

import java.io.Serializable;

public class Travels implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*游记ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.String title;		/*标题*/
	private java.lang.String content;		/*内容*/
	private java.util.Date publicTime;		/*发布时间*/
	private java.lang.Integer click;		/*浏览量*/
	//columns END
	
	private User user;

	public Travels(){
	}

	public Travels(
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
	
		public void setUseid(java.lang.Integer value) {
			this.useid = value;
		}
		
		public java.lang.Integer getUseid() {
			return this.useid;
		}
	
		public void setTitle(java.lang.String value) {
			this.title = value;
		}
		
		public java.lang.String getTitle() {
			return this.title;
		}
	
		public void setContent(java.lang.String value) {
			this.content = value;
		}
		
		public java.lang.String getContent() {
			return this.content;
		}
	
		public void setPublicTime(java.util.Date value) {
			this.publicTime = value;
		}
		
		public java.util.Date getPublicTime() {
			return this.publicTime;
		}
	
		public void setClick(java.lang.Integer value) {
			this.click = value;
		}
		
		public java.lang.Integer getClick() {
			return this.click;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

	
}

