package com.bean;

public class RegisterBean {
	private String user_name;
	private String user_email;
	private String mobile;
	private String password;
	
	public String getUserName() {
		return user_name;
	}
	public String getUserEmail() {
		return user_email;
	}
	public String getMobile() {
		return mobile;
	}
	public String getPassword() {
		return password;
	}
	
	public void setUserName(String user_name) {
		this.user_name = user_name;
	}
	public void setUserEmail(String user_email) {
		this.user_email = user_email;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
