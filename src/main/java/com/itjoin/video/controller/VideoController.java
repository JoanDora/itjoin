/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.video.controller; 

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itjoin.constant.CommonConstant;
import com.itjoin.constant.PageConstant;
import com.itjoin.course.repositories.CourseRepository;
import com.itjoin.exception.CommonException;
import com.itjoin.util.XXTeaUtil;
import com.itjoin.video.model.Video;
import com.itjoin.video.repositories.VideoRepos;
import com.itjoin.video.repositories.VideoRepository;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年9月30日 上午9:49:27
 * @version      
 */
@Controller
@RequestMapping("/video")
public class VideoController {
    
    private static final String PAGE = "pages/";
	@Resource
    private VideoRepos videoRepos;
    @Resource
    private VideoRepository videoRepository;
    
    @Resource
    private CourseRepository courseRepository;
    
    @SuppressWarnings("null")
    @RequestMapping(value="/save",method=RequestMethod.POST)
    public String save(Video video,HttpSession session) throws CommonException{
    	String url =null;
    	if(StringUtils.isBlank(video.getUrl())){
    		url = (String) session.getAttribute("videoPath");
    	}
     if(StringUtils.isBlank(url)){
    	 throw new CommonException("视频文件未上传");
     }
     if(StringUtils.isBlank(video.getCourseId())){
    	 throw new CommonException("上传失败，未绑定课程");
     }
     if(StringUtils.isBlank(video.getName())){
    	 throw new CommonException("上传失败，课程名称不能为空");
     }
     
     //加密
     
     video.setUrl(url);
     Video oldVideo = null;
     if(StringUtils.isBlank(video.getId())){
    	 video.setId(null);
     }else{
	 oldVideo = videoRepos.findById(video.getId());
     }
     String fileName = (String) session.getAttribute("fileName");
     video.setFileName(fileName);
     Query query = new Query();
   Criteria criteria =  Criteria.where("courseId").is(video.getCourseId());
   query.addCriteria(criteria);
   
   if(oldVideo!=null){
       List<Video> videos = videoRepos.find(query);
       if(videos==null || videos.size()==0){
    	   video.setSerial(1);
       }else{
    	   Collections.sort(videos);
    	   video.setSerial(videos.get(videos.size()-1).getSerial()+1);
       }
   }else{
       video.setSerial(oldVideo.getSerial());
   }
   
	videoRepos.save(video);
	return "redirect:list/"+video.getCourseId();
    }
    
    
    
    
    
    
    @RequestMapping("/list/{courseId}")
    public String getAllSubVideo(@PathVariable("courseId")String courseId,Integer page, Integer rows,HttpSession session,HttpServletRequest request,ModelMap model) {
  	  try {
  		if(page==null){
  			  page=0;
  		  }
  		int intPageSize = rows == null || rows <= 0 ? PageConstant.PAGE_SIZE : rows;
  		Query query = new Query();
  		Criteria criteria =  Criteria.where("courseId").is(courseId);
  		query.addCriteria(criteria);
  		query.limit(intPageSize);
  		query.skip(page * intPageSize);
  		Direction direction = Direction.DESC;
  		Sort sort = new Sort(direction, "updateTime");
  		query.with(sort);
  		List<Video> videos = videoRepos.find(query);
  		long count = videoRepos.count(new Query(Criteria.where("courseId").is(courseId)) );
  		model.put("videos", videos);
  		model.put("count", count);
  		int totalPage = (int) ((count%intPageSize==0) ?(count/intPageSize) : (count/intPageSize+1));
  		model.put("totalPage", totalPage);
  		model.put("pageNum", page);
  		model.put("courseId", courseId);
  	} catch (Exception e) {
  		e.printStackTrace();
  	}
  	return request.getContextPath()+PAGE+"video";
    }
    
    @RequestMapping("/find/{courseId}")
    public String findVideos(@PathVariable("courseId")String courseId,Integer page, Integer rows,HttpServletRequest request,ModelMap model) {
  	  try {
  		if(page==null){
  			  page=0;
  		  }
  		int intPageSize = rows == null || rows <= 0 ? PageConstant.PAGE_SIZE : rows;
  		Query query = new Query();
  		Criteria criteria =  Criteria.where("courseId").is(courseId);
  		query.addCriteria(criteria);
  		query.limit(intPageSize);
  		query.skip(page * intPageSize);
  		Direction direction = Direction.DESC;
  		Sort sort = new Sort(direction, "updateTime");
  		query.with(sort);
  		List<Video> videos = videoRepos.find(query);
  		Collections.sort(videos);
  		long count = videoRepos.count(new Query(Criteria.where("courseId").is(courseId)) );
  		model.put("videos", videos);
  		model.put("count", count);
  		int totalPage = (int) ((count%intPageSize==0) ?(count/intPageSize) : (count/intPageSize+1));
  		model.put("totalPage", totalPage);
  		model.put("pageNum", page);
  		model.put("courseId", courseId);
  		
  		String serial = request.getParameter("serial");
  		Video v = null;
  		if(StringUtils.isBlank(serial)){
  			serial="1";
  		}
  		Collections.sort(videos);
  		for(Video video : videos){
  		 
  			if(video.getSerial().intValue()==Integer.valueOf(serial).intValue()){
  				v= video;
  				String url=XXTeaUtil.Encrypt(v.getUrl(), CommonConstant.XXTEA_KEY);
  				v.setUrl(url);
  				break;
  			}
//  		    video.setUrl(url);
  		}
  		model.put("video", v);
  		model.put("course", courseRepository.findOne(courseId));
  	} catch (Exception e) {
  		e.printStackTrace();
  	}
  	return request.getContextPath()+PAGE+"show";
    }
    
    @RequestMapping("/get/{id}")
    public @ResponseBody Object show(@PathVariable("id")String id){
	return videoRepository.findOne(id);
    }
    
    @RequestMapping("/delete/{id}")
    public @ResponseBody Object delete(@PathVariable("id")String id){
    	try {
			videoRepository.delete(id);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
       }
}
 