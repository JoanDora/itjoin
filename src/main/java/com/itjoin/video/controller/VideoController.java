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

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    @Resource
    private VideoRepos videoRepos;
    @Resource
    private VideoRepository videoRepository;
    
    @RequestMapping("/save")
    public @ResponseBody Object save(){
	Video video = new Video();
	video.setId("123456");
	video.setUrl("http://localhost:8080/1");
	video.setComment("is good");
	video.setName("solr in action");
	videoRepos.save(video);
	return video;
    }
    
    @RequestMapping("/get/{id}")
    public @ResponseBody Object show(@PathVariable("id")String id){
	
	return videoRepository.findOne(id);
    }
    

}
 