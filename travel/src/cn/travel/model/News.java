
package cn.travel.model;

import java.io.Serializable;

public class News implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*新闻ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.String title;		/*标题*/
	private java.lang.String subTitle;		/*子标题*/
	private java.lang.String author;		/*作者*/
	private java.lang.String summary;		/*摘要*/
	private java.lang.String content;		/*内容*/
	private java.util.Date publicTime;		/*发布时间*/
	private java.lang.String click;		/*浏览量*/
	private boolean hot;		/*热门 {0:'否',1:'是'}*/
	//columns END

	private User user;
	
	public News(){
	}

	public News(
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
	
		public void setSubTitle(java.lang.String value) {
			this.subTitle = value;
		}
		
		public java.lang.String getSubTitle() {
			return this.subTitle;
		}
	
		public void setAuthor(java.lang.String value) {
			this.author = value;
		}
		
		public java.lang.String getAuthor() {
			return this.author;
		}
	
		public void setSummary(java.lang.String value) {
			this.summary = value;
		}
		
		public java.lang.String getSummary() {
			return this.summary;
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
	
		public void setClick(java.lang.String value) {
			this.click = value;
		}
		
		public java.lang.String getClick() {
			return this.click;
		}
	
	

		public boolean isHot() {
			return hot;
		}

		public void setHot(boolean hot) {
			this.hot = hot;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

	
}

