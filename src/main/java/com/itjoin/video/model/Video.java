/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.video.model; 

import java.util.Date;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年9月30日 上午9:51:04
 * @version      
 */
public class Video {
	   private String id;

	    private String courseId;
	  
	    private String name;
	    private String description;

	    private Integer serial; //序号，第几节

	    private String url;//视频文件的url
	    
        private String timeLen;//时长
	    private Date createTime;

	    private Date updateTime;

    
    
    
    
    
    public String getDescription() {
			return description;
		}


		public void setDescription(String description) {
			this.description = description;
		}


	public String getTimeLen() {
			return timeLen;
		}


		public void setTimeLen(String timeLen) {
			this.timeLen = timeLen;
		}


	public String getCourseId() {
			return courseId;
		}


		public void setCourseId(String courseId) {
			this.courseId = courseId;
		}


		public Integer getSerial() {
			return serial;
		}


		public void setSerial(Integer serial) {
			this.serial = serial;
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


	public String getName() {
        return name;
    }

    
    public void setName(String name) {
        this.name = name;
    }

    


    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getUrl() {
        return url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    
    
    

}
 