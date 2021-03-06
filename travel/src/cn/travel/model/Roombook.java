
package cn.travel.model;

import java.io.Serializable;

public class Roombook implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*酒店预订ID*/
	private java.lang.Integer useid;		/*用户编号id*/
	private java.lang.Integer rooId;		/*房型ID*/
	private java.util.Date creatDate;		/*预定时间*/
	private java.util.Date enterDate;		/*入住日期*/
	private java.util.Date leaveDate;		/*离开日期*/
	private java.lang.String realName;		/*名字*/
	private java.lang.Integer roomNum;		/*房间数量*/
	private java.lang.Integer peopleNum;		/*房间数量*/
	private java.lang.String telphone;		/*手机号*/
	private java.lang.String email;		/*邮箱*/
	
	private float money;
	//columns END

	
	private User user;
	private Roomstyle roomstyle;
	
	private String roomStyleName;
	private String hotelName;
	private String userName;
	//
	private int day=1;
	
	public Roombook(){
	}

	public Roombook(
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
	
		public void setRooId(java.lang.Integer value) {
			if(value!=null){
				roomstyle=new Roomstyle();
				roomstyle.setId(value);
			}
			this.rooId = value;
		}
		
		public java.lang.Integer getRooId() {
			return this.rooId;
		}
	
		public void setCreatDate(java.util.Date value) {
			this.creatDate = value;
		}
		
		public java.util.Date getCreatDate() {
			return this.creatDate;
		}
	
		public void setEnterDate(java.util.Date value) {
			this.enterDate = value;
		}
		
		public java.util.Date getEnterDate() {
			return this.enterDate;
		}
	
		public void setLeaveDate(java.util.Date value) {
			this.leaveDate = value;
		}
		
		public java.util.Date getLeaveDate() {
			return this.leaveDate;
		}
	
		public void setRealName(java.lang.String value) {
			this.realName = value;
		}
		
		public java.lang.String getRealName() {
			return this.realName;
		}
	
		public void setRoomNum(java.lang.Integer value) {
			this.roomNum = value;
		}
		
		public java.lang.Integer getRoomNum() {
			return this.roomNum;
		}
	
		public void setTelphone(java.lang.String value) {
			this.telphone = value;
		}
		
		public java.lang.String getTelphone() {
			return this.telphone;
		}
	
		public void setEmail(java.lang.String value) {
			this.email = value;
		}
		
		public java.lang.String getEmail() {
			return this.email;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public Roomstyle getRoomstyle() {
			return roomstyle;
		}

		public void setRoomstyle(Roomstyle roomstyle) {
			this.roomstyle = roomstyle;
		}

		public java.lang.Integer getPeopleNum() {
			return peopleNum;
		}

		public void setPeopleNum(java.lang.Integer peopleNum) {
			this.peopleNum = peopleNum;
		}

		public int getDay() {
			if(this.creatDate!=null&&this.leaveDate!=null){
				day=(int) ((this.leaveDate.getTime()-this.creatDate.getTime())/(1000*3600*24));
			}
			return day<=0?1:day;
		}

		public void setDay(int day) {
			if(day<=0){
				day=1;
			}
			this.day = day;
		}

		public float getMoney() {
			return money;
		}

		public void setMoney(float money) {
			this.money = money;
		}

		public String getRoomStyleName() {
			return roomStyleName;
		}

		public void setRoomStyleName(String roomStyleName) {
			this.roomStyleName = roomStyleName;
		}

		public String getHotelName() {
			return hotelName;
		}

		public void setHotelName(String hotelName) {
			this.hotelName = hotelName;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}
		
		

		
		
		
		
		
	
		
}

