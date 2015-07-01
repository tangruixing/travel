
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
	
	private String username;
	private String routeName;
	
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	public java.lang.Integer getRouId() {
		return rouId;
	}
	public void setRouId(java.lang.Integer rouId) {
		this.rouId = rouId;
	}
	public java.lang.Integer getUseid() {
		return useid;
	}
	public void setUseid(java.lang.Integer useid) {
		this.useid = useid;
	}
	public java.lang.String getLeaveTel() {
		return leaveTel;
	}
	public void setLeaveTel(java.lang.String leaveTel) {
		this.leaveTel = leaveTel;
	}
	public java.lang.Integer getPeopleNum() {
		return peopleNum;
	}
	public void setPeopleNum(java.lang.Integer peopleNum) {
		this.peopleNum = peopleNum;
	}
	public java.lang.String getLeaveName() {
		return leaveName;
	}
	public void setLeaveName(java.lang.String leaveName) {
		this.leaveName = leaveName;
	}
	public java.lang.Float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(java.lang.Float totalPrice) {
		this.totalPrice = totalPrice;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	
	

		
		
	
}

