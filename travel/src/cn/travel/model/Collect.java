
package cn.travel.model;

import java.io.Serializable;

public class Collect implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*收藏Id*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.Integer rouId;		/*线路ID*/
	private java.lang.Integer sceId;		/*风景ID*/
	private java.lang.Integer colType;		/*收藏类型*/
	private java.util.Date creatDate;		/*收藏时间*/
	//columns END
	
	private User user;
	private Route route;
	private Scenery scenery;

	public Collect(){
	}

	public Collect(
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
	
		public void setRouId(java.lang.Integer value) {
			this.rouId = value;
		}
		
		public java.lang.Integer getRouId() {
			return this.rouId;
		}
	
		public void setSceId(java.lang.Integer value) {
			this.sceId = value;
		}
		
		public java.lang.Integer getSceId() {
			return this.sceId;
		}
	
		public void setColType(java.lang.Integer value) {
			this.colType = value;
		}
		
		public java.lang.Integer getColType() {
			return this.colType;
		}
	
		public void setCreatDate(java.util.Date value) {
			this.creatDate = value;
		}
		
		public java.util.Date getCreatDate() {
			return this.creatDate;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public Route getRoute() {
			return route;
		}

		public void setRoute(Route route) {
			this.route = route;
		}

		public Scenery getScenery() {
			return scenery;
		}

		public void setScenery(Scenery scenery) {
			this.scenery = scenery;
		}

		
	
	
}

