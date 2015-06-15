
package cn.travel.model;

import java.io.Serializable;

public class Comment implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*评论ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.Integer sceId;		/*风景ID*/
	private java.lang.Integer score;		/*评分*/
	private java.util.Date createDate;		/*评论时间*/
	private java.lang.String content;		/*内容*/
	//columns END

	private User user;
	private Scenery scenery;
	
	public Comment(){
	}

	public Comment(
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
	
		public void setSceId(java.lang.Integer value) {
			this.sceId = value;
		}
		
		public java.lang.Integer getSceId() {
			return this.sceId;
		}
	
		public void setScore(java.lang.Integer value) {
			this.score = value;
		}
		
		public java.lang.Integer getScore() {
			return this.score;
		}
	
		public void setCreateDate(java.util.Date value) {
			this.createDate = value;
		}
		
		public java.util.Date getCreateDate() {
			return this.createDate;
		}
	
		public void setContent(java.lang.String value) {
			this.content = value;
		}
		
		public java.lang.String getContent() {
			return this.content;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public Scenery getScenery() {
			return scenery;
		}

		public void setScenery(Scenery scenery) {
			this.scenery = scenery;
		}

	
		
}

