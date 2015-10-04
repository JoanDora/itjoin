package com.itjoin.user.model;

import java.util.Date;

public class User {

    private String id;

    private String name;

    private String pwd;

    private String phone;

    private String email;
    
    private byte type;//用户种类：0普通用户1管理员

    private Date createTime;

    private Date updateTime;
    
    

    
    public byte getType() {
        return type;
    }

    
    public void setType(byte type) {
        this.type = type;
    }

    public String getId() {
	return id;
    }

    public void setId(String id) {
	this.id = id;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getPwd() {
	return pwd;
    }

    public void setPwd(String pwd) {
	this.pwd = pwd;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public Date getCreateTime() {
	return createTime;
    }

    public void setCreateTime(Date createTime) {
	this.createTime = createTime;
    }

    public Date getUpdateTime() {
	return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
	this.updateTime = updateTime;
    }

}
