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

/**
 * <p>
 * 
 * 
 * 
 * </p>
 * 
 * @author hz14121005
 * @date 2015-10-4 上午9:48:25
 * @version
 */
public class CourseSubExt {

    private String id;

    private String subCourseId;

    private int browseTimes;

    public String getId() {
	return id;
    }

    public void setId(String id) {
	this.id = id;
    }

    public String getSubCourseId() {
	return subCourseId;
    }

    public void setSubCourseId(String subCourseId) {
	this.subCourseId = subCourseId;
    }

    public int getBrowseTimes() {
	return browseTimes;
    }

    public void setBrowseTimes(int browseTimes) {
	this.browseTimes = browseTimes;
    }

}
