
package cn.travel.model;

import java.io.Serializable;

public class Hotel implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*酒店ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.String logo;		/*logo*/
	private java.lang.String realName;		/*名字*/
	private java.lang.String address;		/*地址*/
	private Long longitude;		/*经度*/
	private Long latitude;		/*纬度*/
	private java.lang.Integer grade;		/*酒店级别*/
	private java.lang.String picture;		/*图片*/
	private java.lang.String telphone;		/*酒店电话*/
	//columns END

	private User user;
	
	public Hotel(){
	}

	public Hotel(
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
	
		public void setLogo(java.lang.String value) {
			this.logo = value;
		}
		
		public java.lang.String getLogo() {
			return this.logo;
		}
	
		public void setRealName(java.lang.String value) {
			this.realName = value;
		}
		
		public java.lang.String getRealName() {
			return this.realName;
		}
	
		public void setAddress(java.lang.String value) {
			this.address = value;
		}
		
		public java.lang.String getAddress() {
			return this.address;
		}
	
		public void setLongitude(Long value) {
			this.longitude = value;
		}
		
		public Long getLongitude() {
			return this.longitude;
		}
	
		public void setLatitude(Long value) {
			this.latitude = value;
		}
		
		public Long getLatitude() {
			return this.latitude;
		}
	
		public void setGrade(java.lang.Integer value) {
			this.grade = value;
		}
		
		public java.lang.Integer getGrade() {
			return this.grade;
		}
	
		public void setPicture(java.lang.String value) {
			this.picture = value;
		}
		
		public java.lang.String getPicture() {
			return this.picture;
		}
	
		public void setTelphone(java.lang.String value) {
			this.telphone = value;
		}
		
		public java.lang.String getTelphone() {
			return this.telphone;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

	
		
}

