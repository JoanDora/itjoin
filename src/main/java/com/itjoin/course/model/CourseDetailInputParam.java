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
 * @date 2015-10-5 下午1:46:53
 * @version
 */
public class CourseDetailInputParam {

    private Course course;

    private CourseSub courseSub;

    
    public Course getCourse() {
        return course;
    }

    
    public void setCourse(Course course) {
        this.course = course;
    }

    
    public CourseSub getCourseSub() {
        return courseSub;
    }

    
    public void setCourseSub(CourseSub courseSub) {
        this.courseSub = courseSub;
    }

 

}
