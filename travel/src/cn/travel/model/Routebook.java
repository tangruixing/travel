
package cn.travel.model;

import java.io.Serializable;

public class Routebook implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*线路预定ID*/
	private java.lang.Integer rouId;		/*线路ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.String leaveTel;		/*报名手机*/
	private java.lang.Integer peopleNum;		/*人数*/
	private java.lang.String leaveName;		/*报名姓名*/
	private java.lang.Float totalPrice;		/*价钱*/
	//columns END

	
	private Route route;
	private User user;
	
	public Routebook(){
	}

	public Routebook(
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
	
		public void setRouId(java.lang.Integer value) {
			this.rouId = value;
		}
		
		public java.lang.Integer getRouId() {
			return this.rouId;
		}
	
		public void setUseid(java.lang.Integer value) {
			this.useid = value;
		}
		
		public java.lang.Integer getUseid() {
			return this.useid;
		}
	
		public void setLeaveTel(java.lang.String value) {
			this.leaveTel = value;
		}
		
		public java.lang.String getLeaveTel() {
			return this.leaveTel;
		}
	
		public void setPeopleNum(java.lang.Integer value) {
			this.peopleNum = value;
		}
		
		public java.lang.Integer getPeopleNum() {
			return this.peopleNum;
		}
	
		public void setLeaveName(java.lang.String value) {
			this.leaveName = value;
		}
		
		public java.lang.String getLeaveName() {
			return this.leaveName;
		}
	
		public void setTotalPrice(java.lang.Float value) {
			this.totalPrice = value;
		}
		
		public java.lang.Float getTotalPrice() {
			return this.totalPrice;
		}

		public Route getRoute() {
			return route;
		}

		public void setRoute(Route route) {
			this.route = route;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

	
}

