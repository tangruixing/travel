
package cn.travel.model;

import java.io.Serializable;

public class Route implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*线路ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.String realName;		/*名字*/
	private java.lang.String logo;		/*logo*/
	private java.util.Date startDate;		/*出发时间*/
	private java.util.Date endDate;		/*结束时间*/
	private java.lang.Integer routeType;		/*类型*/
	private java.lang.Float money;		/*价钱*/
	private java.lang.String description;		/*描述*/
	private java.lang.Integer numPeople;		/*报名人数*/
	private java.lang.Boolean suggest;		/*推荐*/
	private java.lang.String content;		/*行程建议*/
	//columns END

	private User user;
	
	public Route(){
	}

	public Route(
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
	
		public void setRealName(java.lang.String value) {
			this.realName = value;
		}
		
		public java.lang.String getRealName() {
			return this.realName;
		}
	
		public void setLogo(java.lang.String value) {
			this.logo = value;
		}
		
		public java.lang.String getLogo() {
			return this.logo;
		}
	
		public void setStartDate(java.util.Date value) {
			this.startDate = value;
		}
		
		public java.util.Date getStartDate() {
			return this.startDate;
		}
	
		public void setEndDate(java.util.Date value) {
			this.endDate = value;
		}
		
		public java.util.Date getEndDate() {
			return this.endDate;
		}
	
		public void setRouteType(java.lang.Integer value) {
			this.routeType = value;
		}
		
		public java.lang.Integer getRouteType() {
			return this.routeType;
		}
	
		public void setMoney(java.lang.Float value) {
			this.money = value;
		}
		
		public java.lang.Float getMoney() {
			return this.money;
		}
	
		public void setDescription(java.lang.String value) {
			this.description = value;
		}
		
		public java.lang.String getDescription() {
			return this.description;
		}
	
		public void setNumPeople(java.lang.Integer value) {
			this.numPeople = value;
		}
		
		public java.lang.Integer getNumPeople() {
			return this.numPeople;
		}
	
		public void setSuggest(java.lang.Boolean value) {
			this.suggest = value;
		}
		
		public java.lang.Boolean getSuggest() {
			return this.suggest;
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

	
}

