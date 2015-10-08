package com.itjoin.admin.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import com.itjoin.base.QueryField;
import com.itjoin.base.QueryType;
@Document(collection = "adminUser")
public class Admin implements Serializable{
       
	/**
	 * 
	 */
	private static final long serialVersionUID = -1476012733636593919L;
	
	@Id
	//用户Id
	private String  id;

	
    @QueryField(type = QueryType.EQUALS, attribute = "phone")
	@Indexed(unique = true)
	//手机号码
	private String phone;
   
	//用户名
	private String userName;
	
	 @QueryField(type = QueryType.EQUALS, attribute = "loginPwd")
	//登录密码
	private String loginPwd;
	
	//支付密码
	private String payPwd;

	//性别(1 表示男人 ,0 表示女人)
	private String sex;

	private String email;
	
	private String role="0";//角色（0代表普通用户，1代表超级管理员)
	
	private String deleted="0";
	

	
	
	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getPayPwd() {
		return payPwd;
	}

	public void setPayPwd(String payPwd) {
		this.payPwd = payPwd;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	
	
}
