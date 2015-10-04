/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */
package com.itjoin.comment.model;

import java.util.Date;

/**
 * <p>
 * 
 * 
 * 
 * </p>
 * 
 * @author hz14121005
 * @date 2015-10-2 下午10:46:15
 * @version
 */
public class Comment {

    private String id;
    
    private int level;//级别:0好1中2差

    private String content;

    private String userId;
    
    private String courseId;
    
    private String userName;

    private Date CreateTime;

    
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }

    
    public String getContent() {
        return content;
    }

    
    public void setContent(String content) {
        this.content = content;
    }

    
    public String getUserId() {
        return userId;
    }

    
    public void setUserId(String userId) {
        this.userId = userId;
    }

    
    public String getCourseId() {
        return courseId;
    }

    
    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    
    public String getUserName() {
        return userName;
    }

    
    public void setUserName(String userName) {
        this.userName = userName;
    }

    
    public Date getCreateTime() {
        return CreateTime;
    }

    
    public void setCreateTime(Date createTime) {
        CreateTime = createTime;
    }

  
}
