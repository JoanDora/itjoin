/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */
package com.itjoin.course.model;

import java.util.Date;

/**
 * <p>
 * 
 * 
 * 
 * </p>
 * 
 * @author hz14121005
 * @date 2015-10-2 下午11:21:28
 * @version
 */
public class Course {

    private String id;

    private String name;

    private String description;

    private int teacherId;

    private String categoryId;//课程种类:1 Java 2 linux

    private int status;//0更新中1更新完毕

    private String imageUrl;

    private int price;

    private Date createTime;

    private Date updateTime;

 

    
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

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public int getTeacherId() {
	return teacherId;
    }

    public void setTeacherId(int teacherId) {
	this.teacherId = teacherId;
    }



    
    public String getCategoryId() {
        return categoryId;
    }


    
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }


    public int getStatus() {
	return status;
    }

    public void setStatus(int status) {
	this.status = status;
    }

    public String getImageUrl() {
	return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
	this.imageUrl = imageUrl;
    }

    public int getPrice() {
	return price;
    }

    public void setPrice(int price) {
	this.price = price;
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
