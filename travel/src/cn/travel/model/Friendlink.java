
package cn.travel.model;

import java.io.Serializable;

public class Friendlink implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*友情链接编号*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.String realName;		/*名称*/
	private java.lang.String url;		/*友情链接URL*/
	private java.lang.String logo;		/*logo*/
	private java.lang.String summary;		/*简介*/
	private java.lang.Integer grade;		/*友好程度*/
	//columns END
	
	private User user;
	

	public Friendlink(){
	}

	public Friendlink(
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
	
		public void setUrl(java.lang.String value) {
			this.url = value;
		}
		
		public java.lang.String getUrl() {
			return this.url;
		}
	
		public void setLogo(java.lang.String value) {
			this.logo = value;
		}
		
		public java.lang.String getLogo() {
			return this.logo;
		}
	
		public void setSummary(java.lang.String value) {
			this.summary = value;
		}
		
		public java.lang.String getSummary() {
			return this.summary;
		}

		public java.lang.Integer getGrade() {
			return grade;
		}

		public void setGrade(java.lang.Integer grade) {
			this.grade = grade;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public java.lang.String getRealName() {
			return realName;
		}

		public void setRealName(java.lang.String realName) {
			this.realName = realName;
		}
	
		
		
		
		

}

