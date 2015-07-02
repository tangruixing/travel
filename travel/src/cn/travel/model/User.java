
package cn.travel.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class User implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*用户编号id*/
	private java.lang.String mobile;		/*手机号*/
	private java.lang.String pwd;		/*密码*/
	private java.lang.Integer role;		/*角色*/
	private java.lang.String email;		/*邮箱*/
	private java.lang.String realName;		/*名字*/
	private java.lang.Integer sex;		/*性别:男1，女2*/
	private java.util.Date birth;		/*出生日期*/
	//columns END
	
	private int message=0;  // 0：用户没有问题  1：留言未回复 2：已回复留言
	public int getMessage() {
		return message;
	}

	public void setMessage(int message) {
		this.message = message;
	}

		
	public User(){
	}

	public User(
		java.lang.Integer id
	){
		this.id = id;
	}
	
	
	
	
		public User(String mobile, String pwd, Integer role) {
		super();
		this.mobile = mobile;
		this.pwd = pwd;
		this.role = role;
	}

		public java.lang.Integer getId() {
			return id;
		}

		public void setId(java.lang.Integer id) {
			this.id = id;
		}

		public java.lang.String getMobile() {
			return mobile;
		}

		public void setMobile(java.lang.String mobile) {
			this.mobile = mobile;
		}

		public java.lang.String getPwd() {
			return pwd;
		}

		public void setPwd(java.lang.String pwd) {
			this.pwd = pwd;
		}

		public java.lang.Integer getRole() {
			return role;
		}

		public void setRole(java.lang.Integer role) {
			this.role = role;
		}

		public java.lang.String getEmail() {
			return email;
		}

		public void setEmail(java.lang.String email) {
			this.email = email;
		}

		public java.lang.String getRealName() {
			return realName;
		}

		public void setRealName(java.lang.String realName) {
			this.realName = realName;
		}

		public java.lang.Integer getSex() {
			return sex;
		}

		public void setSex(java.lang.Integer sex) {
			this.sex = sex;
		}

		public java.util.Date getBirth() {
			return birth;
		}

		public void setBirth(java.util.Date birth) {
			this.birth = birth;
		}


	
}

