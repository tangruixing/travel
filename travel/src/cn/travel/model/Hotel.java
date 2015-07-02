
package cn.travel.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Hotel implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*酒店ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.String logo;		/*logo*/
	private java.lang.String realName;		/*名字*/
	private java.lang.String address;		/*地址*/
	private double longitude;		/*经度*/
	private double latitude;		/*纬度*/
	private java.lang.Integer grade;		/*酒店级别*/
	private java.lang.String picture;		/*图片集*/
	private java.lang.String telphone;		/*酒店电话*/
	private String introduction;
	//columns END

	private User user;
	
	private Set<Roomstyle> roomstyles=new HashSet<Roomstyle>(0);
	
	
	public Hotel(){
	}

	public Hotel(
		java.lang.Integer id
	){
		this.id = id;
	}

	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public java.lang.Integer getUseid() {
		return useid;
	}

	public void setUseid(java.lang.Integer useid) {
		this.useid = useid;
	}

	public java.lang.String getLogo() {
		return logo;
	}

	public void setLogo(java.lang.String logo) {
		this.logo = logo;
	}

	public java.lang.String getRealName() {
		return realName;
	}

	public void setRealName(java.lang.String realName) {
		this.realName = realName;
	}

	public java.lang.String getAddress() {
		return address;
	}

	public void setAddress(java.lang.String address) {
		this.address = address;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public java.lang.Integer getGrade() {
		return grade;
	}

	public void setGrade(java.lang.Integer grade) {
		this.grade = grade;
	}

	public java.lang.String getPicture() {
		return picture;
	}

	public void setPicture(java.lang.String picture) {
		this.picture = picture;
	}

	public java.lang.String getTelphone() {
		return telphone;
	}

	public void setTelphone(java.lang.String telphone) {
		this.telphone = telphone;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Roomstyle> getRoomstyles() {
		return roomstyles;
	}

	public void setRoomstyles(Set<Roomstyle> roomstyles) {
		this.roomstyles = roomstyles;
	}

	
	
	

	
		
		
}

