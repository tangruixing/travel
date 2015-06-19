
package cn.travel.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Scenery implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*风景ID*/
	private java.lang.Integer sceId;		/*风景ID*/
	
	private java.lang.String realName;		/*名字*/
	private java.lang.String address;		/*地址*/
	private double longitude;		/*经度*/
	private double latitude;		/*纬度*/
	private java.lang.String logo;		/*logo*/
	private java.lang.String introduction;		/*介绍*/
	private java.lang.String url;		/*网址*/
	private String startTime;
	private String endTime;/*开放时间*/
	private int grade;		/*景区级别*/
	private java.lang.String telphone;		/*景区联系电话*/
	private boolean viwepager;		/*轮播*/
	private boolean suggest;		/*推荐*/
	//columns END

	private Scenery scenery;
	
	
	public Scenery(){
	}

	public Scenery(
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

	public java.lang.Integer getSceId() {
		return sceId;
	}

	public void setSceId(java.lang.Integer sceId) {
		this.sceId = sceId;
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

	public java.lang.String getLogo() {
		return logo;
	}

	public void setLogo(java.lang.String logo) {
		this.logo = logo;
	}

	public java.lang.String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(java.lang.String introduction) {
		this.introduction = introduction;
	}

	public java.lang.String getUrl() {
		return url;
	}

	public void setUrl(java.lang.String url) {
		this.url = url;
	}

	
	
	
	
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public java.lang.String getTelphone() {
		return telphone;
	}

	public void setTelphone(java.lang.String telphone) {
		this.telphone = telphone;
	}

	public boolean isViwepager() {
		return viwepager;
	}

	public void setViwepager(boolean viwepager) {
		this.viwepager = viwepager;
	}

	public boolean isSuggest() {
		return suggest;
	}

	public void setSuggest(boolean suggest) {
		this.suggest = suggest;
	}

	public Scenery getScenery() {
		return scenery;
	}

	public void setScenery(Scenery scenery) {
		this.scenery = scenery;
	}

	
		

}

