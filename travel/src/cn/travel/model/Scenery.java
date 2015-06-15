
package cn.travel.model;

import java.io.Serializable;

public class Scenery implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*风景ID*/
	private java.lang.Integer sceId;		/*风景ID*/
	private java.lang.String realName;		/*名字*/
	private java.lang.String address;		/*名字*/
	private Long longitude;		/*经度*/
	private Long latitude;		/*纬度*/
	private java.lang.String logo;		/*logo*/
	private java.lang.String introduction;		/*介绍*/
	private java.lang.String url;		/*网址*/
	private java.lang.String openDime;		/*开放时间*/
	private java.lang.Integer grade;		/*景区级别*/
	private java.lang.String telphone;		/*景区联系电话*/
	private java.lang.Boolean viwepager;		/*轮播*/
	private java.lang.Boolean suggest;		/*推荐*/
	//columns END

	private Scenery scenery;
	
	
	public Scenery(){
	}

	public Scenery(
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
	
		public void setSceId(java.lang.Integer value) {
			this.sceId = value;
		}
		
		public java.lang.Integer getSceId() {
			return this.sceId;
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
	
		public void setLogo(java.lang.String value) {
			this.logo = value;
		}
		
		public java.lang.String getLogo() {
			return this.logo;
		}
	
		public void setIntroduction(java.lang.String value) {
			this.introduction = value;
		}
		
		public java.lang.String getIntroduction() {
			return this.introduction;
		}
	
		public void setUrl(java.lang.String value) {
			this.url = value;
		}
		
		public java.lang.String getUrl() {
			return this.url;
		}
	
		public void setOpenDime(java.lang.String value) {
			this.openDime = value;
		}
		
		public java.lang.String getOpenDime() {
			return this.openDime;
		}
	
		public void setGrade(java.lang.Integer value) {
			this.grade = value;
		}
		
		public java.lang.Integer getGrade() {
			return this.grade;
		}
	
		public void setTelphone(java.lang.String value) {
			this.telphone = value;
		}
		
		public java.lang.String getTelphone() {
			return this.telphone;
		}
	
		public void setViwepager(java.lang.Boolean value) {
			this.viwepager = value;
		}
		
		public java.lang.Boolean getViwepager() {
			return this.viwepager;
		}
	
		public void setSuggest(java.lang.Boolean value) {
			this.suggest = value;
		}
		
		public java.lang.Boolean getSuggest() {
			return this.suggest;
		}

		public Scenery getScenery() {
			return scenery;
		}

		public void setScenery(Scenery scenery) {
			this.scenery = scenery;
		}

}

