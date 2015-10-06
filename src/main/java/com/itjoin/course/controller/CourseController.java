/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */
package com.itjoin.course.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itjoin.constant.PageConstant;
import com.itjoin.course.model.Course;
import com.itjoin.course.model.CourseDatailOutputParam;
import com.itjoin.course.model.CourseDetailInputParam;
import com.itjoin.course.model.CourseExt;
import com.itjoin.course.model.CourseParam;
import com.itjoin.course.model.CourseSub;
import com.itjoin.course.model.CourseSubExt;
import com.itjoin.course.model.CourseSubParam;
import com.itjoin.course.repositories.CourseExtRepos;
import com.itjoin.course.repositories.CourseRepos;
import com.itjoin.course.repositories.CourseSubExtRepos;
import com.itjoin.course.repositories.CourseSubRepos;

/**
 * <p>
 * 
 * 
 * 
 * </p>
 * 
 * @author hz14121005
 * @date 2015-10-2 下午11:21:42
 * @version
 */
@Controller
@RequestMapping("/course")
public class CourseController {

    @Resource
    private CourseRepos courseRepos;

    @Resource
    private CourseExtRepos courseExtRepos;

    @Resource
    private CourseSubRepos courseSubRepos;
    
    @Resource 
    private  CourseSubExtRepos  courseSubExtRepos;

    /**
     * <p>
     * 
     * 上传保存课程基本信息(目前只允许一节课一个个上传,不允许多个同时上传)
     * 
     * </p>
     * 
     * @param course
     * 
     * @author hz14121005
     * @date 2015-10-4 上午10:44:14
     * @version
     */
    @RequestMapping("/save")
    public @ResponseBody void save(CourseDetailInputParam courseDetailParam) {
	Course c = null;
	if (courseDetailParam.getCourse() != null) {
	    String courseName = courseDetailParam.getCourse().getName();
	    String teacherId = courseDetailParam.getCourse().getTeacherId();
	    Query query = new Query();
	    Criteria criteria = Criteria.where("name").is(courseName).where("teacherId").is(teacherId);
	    query.addCriteria(criteria);
	    c = courseRepos.findOne(query);
	    if (c == null) {
		c = courseRepos.save(courseDetailParam.getCourse());
	    } else {
		courseRepos.updateById(c.getId(), courseDetailParam.getCourse());
	    }
	}
	if (courseDetailParam.getCourseSub() != null) {
	    Query query = new Query();
	    Criteria criteria = Criteria.where("name").is(courseDetailParam.getCourseSub().getName()).where("courseId").is(c.getId());
	    query.addCriteria(criteria);
	    CourseSub sub = courseSubRepos.findOne(query);
	    CourseSub courseSub = courseDetailParam.getCourseSub();
            courseSub.setCourseId(c.getId());
	    if (sub == null) { 
		courseSubRepos.save(courseSub);
	    }else{
		courseSubRepos.updateById(sub.getId(), courseSub);
	    }
	}
    }

    
    /**
     * <p>
     * 
     *更新视频审核状态
     *
     * </p>
     * @param id
     * @param verifyStatus
     *  
     * @author	hz14121005 
     * @date	2015-10-6 下午2:40:53
     * @version      
     */ 
    @RequestMapping("/updateVerifyStatus")
    public @ResponseBody void updateVerifyStatus(@PathVariable("id") String id,int verifyStatus) {
	Course course = courseRepos.findById(id);
	course.setVerifyStatus(verifyStatus);
	courseRepos.updateById(course.getId(), course);
    }

    /**
     * <p>
     * 
     * 查看单个课程的详细信息
     * 
     * </p>
     * 
     * @param id
     * @return
     * 
     * @author hz14121005
     * @date 2015-10-4 上午10:44:40
     * @version
     * @throws NoSuchMethodException 
     * @throws InvocationTargetException 
     * @throws Exception 
     */
    @RequestMapping("/viewById")
    public @ResponseBody Object viewById(@PathVariable("id") String id) throws Exception{
	CourseDatailOutputParam courseDetailParam = new CourseDatailOutputParam();
	Course course = courseRepos.findById(id);
	CourseParam  courseParam=new CourseParam();
	PropertyUtils.copyProperties(courseParam, course);
	Query query = new Query();
	Criteria criteria = Criteria.where("courseId").is(id);
	query.addCriteria(criteria);
	// 每查看课程都要更新浏览次数
	CourseExt courseExt = courseExtRepos.findOne(query);
	if (courseExt == null) {
	    courseExt = new CourseExt();
	    courseExt.setCourseId(id);
	    courseExt.setBrowseTimes(1);
	    courseExtRepos.save(courseExt);
	} else {
	    courseExt.setBrowseTimes(courseExt.getBrowseTimes() + 1);
	    courseExtRepos.updateById(courseExt.getId(), courseExt);
	}
	courseParam.setBrowseTimes(courseExt.getBrowseTimes());
	courseDetailParam.setCourse(courseParam);
	Query query2 = new Query();
	Criteria criteria2 = Criteria.where("courseId").is(id);
	query2.addCriteria(criteria2);
	List<CourseSub>  list=courseSubRepos.find(query2);
	List<CourseSubParam>  li=new ArrayList<CourseSubParam>();
	if(list!=null&&!list.isEmpty()){
	    for(CourseSub courseSub:list){
		CourseSubParam courseSubParam=new CourseSubParam();
		PropertyUtils.copyProperties(courseSubParam, courseSub);
		Query query3 = new Query();
		Criteria criteria3 = Criteria.where("subCourseId").is(courseSub.getId());
		query3.addCriteria(criteria3);
		CourseSubExt courseSubExt=courseSubExtRepos.findOne(query3);
		int browseTimes=0;
		if(courseSubExt!=null){
		    browseTimes=courseSubExt.getBrowseTimes();
		}
		courseSubParam.setBrowseTimes(browseTimes);
		li.add(courseSubParam);
	    }
	}
	courseDetailParam.setCourseSub(li);
	return courseDetailParam;
    }
    
    @RequestMapping("/updateBySubId")
    public @ResponseBody void updateBySubId(@PathVariable("subId") String subId) {
	Query query = new Query();
	Criteria criteria = Criteria.where("subCourseId").is(subId);
	query.addCriteria(criteria);
	CourseSubExt courseSubExt=courseSubExtRepos.findOne(query);
	if(courseSubExt==null){
	    courseSubExt=new CourseSubExt();
	    courseSubExt.setBrowseTimes(1);
	    courseSubExt.setSubCourseId(subId);
	    courseSubExtRepos.save(courseSubExt);
	}else{
	    courseSubExt.setBrowseTimes(courseSubExt.getBrowseTimes()+1);
	    courseSubExtRepos.updateById(courseSubExt.getId(), courseSubExt);
	}
    }
    

    /**
     * <p>
     * 
     * 根据课程种类获取所有的课程
     * 
     * </p>
     * 
     * @param categoryId
     * @return
     * 
     * @author hz14121005
     * @date 2015-10-4 上午10:45:05
     * @version
     */
    @RequestMapping("/searchByCategoryId")
    public @ResponseBody Object searchByCategoryId(@PathVariable("categoryId") String categoryId, @PathVariable("pageNo") int pageNo) {
	if (pageNo < 0) {
	    pageNo = 0; 
	}
	Query query = new Query();
	Criteria criteria = Criteria.where("categoryId").is(categoryId);
	query.addCriteria(criteria);
	query.limit(PageConstant.PAGE_SIZE);
	query.skip(pageNo * PageConstant.PAGE_SIZE);
	Direction direction = Direction.DESC;
	Sort sort = new Sort(direction, "CreateTime");
	query.with(sort);
	return courseRepos.find(query);
    }
    
    
    /**
     * <p>
     * 
     *根据名字搜索课程
     *
     * </p>
     * @param name
     * @param pageNum
     * @return
     * @throws Exception
     *  
     * @author	hz14121005 
     * @date	2015-10-5 下午4:23:03
     * @version      
     */ 
    @RequestMapping("/searchByName")
    public @ResponseBody Object searchByName(@PathVariable("name") String name, @PathVariable("pageNo") int pageNo) throws Exception{
	if (pageNo < 0) {
	    pageNo = 0; 
	}
	Query query = new Query();
	Criteria criteria = Criteria.where("name").is(name);
	query.addCriteria(criteria);
	query.limit(PageConstant.PAGE_SIZE);
	query.skip(pageNo * PageConstant.PAGE_SIZE);
	Direction direction = Direction.DESC;
	Sort sort = new Sort(direction, "CreateTime");
	query.with(sort);
	List<Course> course = courseRepos.find(query);
	return course;
    }
    
    /**
     * <p>
     * 
     *获取最新课程列表
     *
     * </p>
     * @param pageNo
     * @return
     * @throws Exception
     *  
     * @author	hz14121005 
     * @date	2015-10-5 下午4:27:14
     * @version      
     */ 
    @RequestMapping("/NewCourseList")
    public @ResponseBody Object getNewCourseList( @PathVariable("pageNo") int pageNo) throws Exception{
	if (pageNo < 0) {
	    pageNo = 0; 
	}
	Query query = new Query();
	Criteria criteria =new Criteria();
	query.addCriteria(criteria);
	query.limit(PageConstant.PAGE_SIZE);
	query.skip(pageNo * PageConstant.PAGE_SIZE);
	Direction direction = Direction.DESC;
	Sort sort = new Sort(direction, "CreateTime");
	query.with(sort);
	List<Course> course = courseRepos.find(query);
	return course;
    }
    
    
    

}
