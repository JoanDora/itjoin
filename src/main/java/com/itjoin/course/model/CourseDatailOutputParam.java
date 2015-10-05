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

import java.util.List;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz14121005 
 * @date	2015-10-5 下午2:49:40
 * @version      
 */
public class CourseDatailOutputParam {
    
    private CourseParam course;

    private List<CourseSubParam> courseSub;

    public CourseParam getCourse() {
	return course;
    }

    public void setCourse(CourseParam course) {
	this.course = course;
    }

    public List<CourseSubParam> getCourseSub() {
	return courseSub;
    }

    public void setCourseSub(List<CourseSubParam> courseSub) {
	this.courseSub = courseSub;
    }
    
}
 