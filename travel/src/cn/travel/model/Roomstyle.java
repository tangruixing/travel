
package cn.travel.model;

import java.io.Serializable;

public class Roomstyle implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*房型ID*/
	private java.lang.String realName;		/*名称*/
	private java.lang.Integer bedStyle;		/*床型  {1:'大床',2:'双人床',3:'单床',4:'多人床'}*/
	private java.lang.Integer limitPerson;		/*最多可入住人数 */
	private java.lang.Integer breakfast;		/*早餐 {1:'双份',2:'多份',3:'不含',4:'单份'}*/
	private java.lang.Integer broadband;		/*宽带*/
	private float area;							/*面积*/
	private java.lang.Integer cancel;		/*取消政策*/
	private java.lang.Float price;		/*价格*/
	private java.lang.Integer number;		/*数量*/
	private java.lang.String picture;		/*图片*/
	private java.lang.String introduce;		/*介绍*/
	//columns END

	private Hotel hotel;
	private java.lang.Integer hotId;		/*酒店ID*/
	private String hotname;
	
	public Roomstyle(){
	}

	public Roomstyle(
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
	
		public void setHotId(java.lang.Integer value) {
			if(value!=null){
				this.hotel=new Hotel();
				this.getHotel().setId(value);			
			}
			this.hotId = value;
		}
		
		public java.lang.Integer getHotId() {
			return this.hotId;
		}
	
		public void setRealName(java.lang.String value) {
			this.realName = value;
		}
		
		public java.lang.String getRealName() {
			return this.realName;
		}
	
		public void setBedStyle(java.lang.Integer value) {
			this.bedStyle = value;
		}
		
		public java.lang.Integer getBedStyle() {
			return this.bedStyle;
		}
	
		public void setLimitPerson(java.lang.Integer value) {
			this.limitPerson = value;
		}
		
		public java.lang.Integer getLimitPerson() {
			return this.limitPerson;
		}
	
		public void setBreakfast(java.lang.Integer value) {
			this.breakfast = value;
		}
		
		public java.lang.Integer getBreakfast() {
			return this.breakfast;
		}
	
		public void setBroadband(java.lang.Integer value) {
			this.broadband = value;
		}
		
		public java.lang.Integer getBroadband() {
			return this.broadband;
		}
	
		public void setCancel(java.lang.Integer value) {
			this.cancel = value;
		}
		
		public java.lang.Integer getCancel() {
			return this.cancel;
		}
	
		public void setPrice(java.lang.Float value) {
			this.price = value;
		}
		
		public java.lang.Float getPrice() {
			return this.price;
		}
	
		public void setNumber(java.lang.Integer value) {
			this.number = value;
		}
		
		public java.lang.Integer getNumber() {
			return this.number;
		}
	
		public void setPicture(java.lang.String value) {
			this.picture = value;
		}
		
		public java.lang.String getPicture() {
			return this.picture;
		}
	
		public void setIntroduce(java.lang.String value) {
			this.introduce = value;
		}
		
		public java.lang.String getIntroduce() {
			return this.introduce;
		}

	

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public String getHotname() {
		return hotname;
	}

	public void setHotname(String hotname) {
		this.hotname = hotname;
	}

	public float getArea() {
		return area;
	}

	public void setArea(float area) {
		this.area = area;
	}

}

