
package cn.travel.model;

import java.io.Serializable;

import cn.model.Constant;

public class Route implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*线路ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.String realName;		/*名字*/
	private java.lang.String logo;		/*logo*/


	private java.lang.String description;		/*描述*/
	
	private float money;		/*人均消费 */
	private int routeType=Constant.ROUTER_PAY;		/*类型 {0:普通游客,1:自由行用户}*/
	
	
	private java.util.Date startDate;		/*出发时间 0*/
	private java.util.Date endDate;		/*结束时间 0*/
	
	
	
	private int numPeople;		/*报名人数 0*/
	
	private java.lang.String suggest;		/*行程建议 1 */
 
	//columns END

	private User user;
	
	public Route(){
	}

	public Route(
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

	public java.lang.String getRealName() {
		return realName;
	}

	public void setRealName(java.lang.String realName) {
		this.realName = realName;
	}

	public java.lang.String getLogo() {
		return logo;
	}

	public void setLogo(java.lang.String logo) {
		this.logo = logo;
	}

	public java.util.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}

	public java.util.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}

	public int getRouteType() {
		return routeType;
	}

	public void setRouteType(int routeType) {
		this.routeType = routeType;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public java.lang.String getDescription() {
		return description;
	}

	public void setDescription(java.lang.String description) {
		this.description = description;
	}

	public int getNumPeople() {
		return numPeople;
	}

	public void setNumPeople(int numPeople) {
		this.numPeople = numPeople;
	}



	public java.lang.String getSuggest() {
		return suggest;
	}

	public void setSuggest(java.lang.String suggest) {
		this.suggest = suggest;

	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

	
		
	
}

