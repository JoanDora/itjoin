/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.comment.controller; 

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itjoin.comment.model.Comment;
import com.itjoin.comment.repostories.CommentRepos;
import com.itjoin.user.model.User;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz14121005 
 * @date	2015-10-2 下午10:53:04
 * @version      
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Resource
   private  CommentRepos commentRepos;
   
   /**
 * <p>
 * 
 *查看某个课程的留言评论列表
 *
 * </p>
 * @param courseId
 * @return
 *  
 * @author	hz14121005 
 * @date	2015-10-4 上午10:46:11
 * @version      
 */ 
@RequestMapping("/view")
   public @ResponseBody Object view(@PathVariable("courseId")String courseId){
       Query query=new Query();
       Criteria criteria=Criteria.where("courseId").is(courseId);
       query.addCriteria(criteria);
       List<Comment> list= commentRepos.find(query);
       return list;
   };
   
   /**
 * <p>
 * 
 *提交评论
 *
 * </p>
 * @param comment
 * @return
 *  
 * @author	hz14121005 
 * @date	2015-10-4 上午10:47:07
 * @version      
 */ 
@RequestMapping("/saveComment")
   public @ResponseBody Object saveComment(Comment comment){
       if(StringUtils.isBlank(comment.getContent())){
	    return null;
       }
       comment.setCreateTime(new Date());
       return commentRepos.save(comment);
   }
   
   /**
 * <p>
 * 
 *
 *删除某条评论
 * </p>
 * @param id
 *  
 * @author	hz14121005 
 * @date	2015-10-4 上午10:47:18
 * @version      
 */ 
@RequestMapping("/deleteById")
   public @ResponseBody void deleteById(@PathVariable("id")String id){
       Comment comment=new Comment();
       comment.setId(id);
       commentRepos.deleteById(comment);
   }
   
   
}
 