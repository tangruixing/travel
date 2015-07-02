
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

		public void setId(java.lang.Integer value) {
			this.id = value;
		}
		
		public java.lang.Integer getId() {
			return this.id;
		}
	
		public void setMobile(java.lang.String value) {
			this.mobile = value;
		}
		
		public java.lang.String getMobile() {
			return this.mobile;
		}
	
		public void setPwd(java.lang.String value) {
			this.pwd = value;
		}
		
		public java.lang.String getPwd() {
			return this.pwd;
		}
	
		public void setRole(java.lang.Integer value) {
			this.role = value;
		}
		
		public java.lang.Integer getRole() {
			return this.role;
		}
	
		public void setEmail(java.lang.String value) {
			this.email = value;
		}
		
		public java.lang.String getEmail() {
			return this.email;
		}
	
		public void setRealName(java.lang.String value) {
			this.realName = value;
		}
		
		public java.lang.String getRealName() {
			return this.realName;
		}
	
		public void setSex(java.lang.Integer value) {
			this.sex = value;
		}
		
		public java.lang.Integer getSex() {
			return this.sex;
		}
	
		public void setBirth(java.util.Date value) {
			this.birth = value;
		}
		
		public java.util.Date getBirth() {
			return this.birth;
		}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Mobile",getMobile())
			.append("Pwd",getPwd())
			.append("Role",getRole())
			.append("Email",getEmail())
			.append("RealName",getRealName())
			.append("Sex",getSex())
			.append("Birth",getBirth())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof User == false) return false;
		if(this == obj) return true;
		User other = (User)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

