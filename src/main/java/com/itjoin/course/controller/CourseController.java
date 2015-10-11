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

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itjoin.constant.CommonConstant;
import com.itjoin.constant.PageConstant;
import com.itjoin.course.model.Course;
import com.itjoin.course.model.CourseDatailOutputParam;
import com.itjoin.course.model.CourseExt;
import com.itjoin.course.model.CourseParam;
import com.itjoin.course.model.CourseSub;
import com.itjoin.course.model.CourseSubExt;
import com.itjoin.course.model.CourseSubParam;
import com.itjoin.course.repositories.CourseExtRepos;
import com.itjoin.course.repositories.CourseRepos;
import com.itjoin.course.repositories.CourseRepository;
import com.itjoin.course.repositories.CourseSubExtRepos;
import com.itjoin.course.repositories.CourseSubRepos;
import com.itjoin.user.model.User;
import com.itjoin.util.Pagination;

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
    private CourseSubExtRepos courseSubExtRepos;
    
    @Resource
    private CourseRepository courseRepository;

	private static final String PAGE =  "pages/";
  @RequestMapping("/save")
  public   String save(Course course,MultipartHttpServletRequest request,HttpSession session){
	  try {
		  if(StringUtils.isBlank(course.getName())){
			  throw new Exception("课程名字为空");
		  }
		  MultipartFile file = request.getFile("image");
		uploadImages(course,file);
		 User user = (User) session.getAttribute("user");
//		 course.setTeacherId(user.getId());
		 if(StringUtils.isBlank(course.getId())){
			 course.setId(null);
			 course.setCreateTime(new Date());
		 }
		 course.setTeacherId("12");
		 course.setUpdateTime(new Date());
		  courseRepository.save(course);
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return "redirect:list";
  }
  
  
  @RequestMapping("/list")
  public String list(Integer page, Integer rows,HttpSession session,HttpServletRequest request,ModelMap model) throws Exception {
	  try {
		if(page==null){
			  page=0;
		  }
		int intPageSize = rows == null || rows <= 0 ? PageConstant.PAGE_SIZE : rows;
		User user = (User) session.getAttribute("user");
		user = new User();
		user.setId("12");
		Query query = new Query();
		Criteria criteria =  Criteria.where("teacherId").is(user.getId());
		query.addCriteria(criteria);
		query.limit(intPageSize);
		query.skip(page * intPageSize);
		Direction direction = Direction.DESC;
		Sort sort = new Sort(direction, "createTime");
		query.with(sort);
		List<Course> courses = courseRepos.find(query);
		long count = courseRepos.count(new Query(Criteria.where("teacherId").is(user.getId())) );
		model.put("courses", courses);
		model.put("count", count);
		int totalPage = (int) ((count%intPageSize==0) ?(count/intPageSize) : (count/intPageSize+1));
		model.put("totalPage", totalPage);
		model.put("pageNum", page);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return request.getContextPath()+PAGE+"course";
  }
    
  
  @RequestMapping("/get/{id}")
  public @ResponseBody Object show(@PathVariable("id")String id){
	return courseRepository.findOne(id);
  }
    /**
     * <p>
     * 
     * 更新视频审核状态
     * 
     * </p>
     * 
     * @param id
     * @param verifyStatus
     * 
     * @author hz14121005
     * @date 2015-10-6 下午2:40:53
     * @version
     */
    @RequestMapping("/updateVerifyStatus")
    public @ResponseBody  Object updateVerifyStatus(String id, Integer verifyStatus) {
	try {
	    Query query = new Query();
	    ObjectId convertedId = new ObjectId(id);
	    query.addCriteria(Criteria.where("_id").is(convertedId));
	    Update update = new Update();
	    update.set("verifyStatus", verifyStatus);
	    courseRepos.update(query, update);
	    return 1;
	} catch (Exception e) {
	    e.printStackTrace();
	    return 0;
	}
    }
    
    
    
    
    
    @RequestMapping(value = "/deleteByCourseId/{id}", method = RequestMethod.GET)
    @ResponseBody
    public   Object deleteByCourseId(@PathVariable("id") String id) {
	try {
	    Course course =new Course();
	    course.setId(id);
	    courseRepos.deleteById(course);
	    return 1;
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    return 0;
	}
	
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
    public @ResponseBody
    Object viewById(@PathVariable("id") String id) throws Exception {
	CourseDatailOutputParam courseDetailParam = new CourseDatailOutputParam();
	Course course = courseRepos.findById(id);
	CourseParam courseParam = new CourseParam();
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
	List<CourseSub> list = courseSubRepos.find(query2);
	List<CourseSubParam> li = new ArrayList<CourseSubParam>();
	if (list != null && !list.isEmpty()) {
	    for (CourseSub courseSub : list) {
		CourseSubParam courseSubParam = new CourseSubParam();
		PropertyUtils.copyProperties(courseSubParam, courseSub);
		Query query3 = new Query();
		Criteria criteria3 = Criteria.where("subCourseId").is(courseSub.getId());
		query3.addCriteria(criteria3);
		CourseSubExt courseSubExt = courseSubExtRepos.findOne(query3);
		int browseTimes = 0;
		if (courseSubExt != null) {
		    browseTimes = courseSubExt.getBrowseTimes();
		}
		courseSubParam.setBrowseTimes(browseTimes);
		li.add(courseSubParam);
	    }
	}
	courseDetailParam.setCourseSub(li);
	return courseDetailParam;
    }

    @RequestMapping("/updateBySubId")
    public @ResponseBody
    void updateBySubId(@PathVariable("subId") String subId) {
	Query query = new Query();
	Criteria criteria = Criteria.where("subCourseId").is(subId);
	query.addCriteria(criteria);
	CourseSubExt courseSubExt = courseSubExtRepos.findOne(query);
	if (courseSubExt == null) {
	    courseSubExt = new CourseSubExt();
	    courseSubExt.setBrowseTimes(1);
	    courseSubExt.setSubCourseId(subId);
	    courseSubExtRepos.save(courseSubExt);
	} else {
	    courseSubExt.setBrowseTimes(courseSubExt.getBrowseTimes() + 1);
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
    public @ResponseBody
    Object searchByCategoryId(@PathVariable("categoryId") String categoryId, @PathVariable("pageNo") int pageNo) {
	if (pageNo < 0) {
	    pageNo = 0;
	}
	Query query = new Query();
	Criteria criteria = Criteria.where("categoryId").is(categoryId);
	query.addCriteria(criteria);
	query.limit(PageConstant.PAGE_SIZE);
	query.skip(pageNo * PageConstant.PAGE_SIZE);
	Direction direction = Direction.DESC;
	Sort sort = new Sort(direction, "createTime");
	query.with(sort);
	return courseRepos.find(query);
    }

    /**
     * <p>
     * 
     * 根据名字搜索课程
     * 
     * </p>
     * 
     * @param name
     * @param pageNum
     * @return
     * @throws Exception
     * 
     * @author hz14121005
     * @date 2015-10-5 下午4:23:03
     * @version
     */
    @RequestMapping("/searchByName")
    @ResponseBody
    public  Object searchByName(@PathVariable("name") String name, @PathVariable("pageNo") int pageNo) throws Exception {
	if (pageNo < 0) {
	    pageNo = 0;
	}
	Query query = new Query();
	Criteria criteria = Criteria.where("name").is(name);
	query.addCriteria(criteria);
	query.limit(PageConstant.PAGE_SIZE);
	query.skip(pageNo * PageConstant.PAGE_SIZE);
	Direction direction = Direction.DESC;
	Sort sort = new Sort(direction, "createTime");
	query.with(sort);
	List<Course> course = courseRepos.find(query);
	return course;
    }

    /**
     * <p>
     * 
     * 获取最新课程列表
     * 
     * </p>
     * 
     * @param pageNo
     * @return
     * @throws Exception
     * 
     * @author hz14121005
     * @date 2015-10-5 下午4:27:14
     * @version
     */
    @RequestMapping("/getCourseList")
    @ResponseBody
    public Pagination getCourseList(Integer page, Integer rows) throws Exception {
	int intPageSize = rows == null || rows <= 0 ? PageConstant.PAGE_SIZE : rows;
	if (page > 0) {
	    page--;
	}
	Query query = new Query();
	Criteria criteria = new Criteria();
	query.addCriteria(criteria);
	query.limit(intPageSize);
	query.skip(page * intPageSize);
	Direction direction = Direction.DESC;
	Sort sort = new Sort(direction, "createTime");
	query.with(sort);
	List<Course> course = courseRepos.find(query);
	Pagination pagination = new Pagination();
	pagination.setRows(course);
	pagination.setTotal(courseRepos.count(new Query() ));
	return pagination;
    }

    
    
    private String uploadImages(Course course, MultipartFile image) {
				if (image.getSize() <= 0) {
					return null;
				}
				String imageName = image.getOriginalFilename();
				int imgType = imageName.lastIndexOf(".");
				String imgTypeStr = imageName.substring(imgType);
				SimpleDateFormat sdf2 = new SimpleDateFormat(
						"yyyyMMddhhmmssSSS");// 其中yyyyMMddkkmmss是命名格式
				String str2 = sdf2.format(new Date().getTime());
				// 从数据库字典中获取上传文件路径
				 String uploadPath = CommonConstant.COURSE_IMAGE_SRC;
				 String fileName = uploadPath + str2 + imgTypeStr;
				 File f = new File(fileName);
				try {
					FileUtils.copyInputStreamToFile(image.getInputStream(), f);
				} catch (Exception e) {
					e.printStackTrace();
				}
		course.setImageUrl(fileName);
		return fileName;
	}
}
