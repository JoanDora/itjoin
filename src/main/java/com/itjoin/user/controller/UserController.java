package com.itjoin.user.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itjoin.user.model.User;
import com.itjoin.user.repositories.UserRepos;


/**
 * <p>
 * 
 *
 *用户
 * </p>
 *  
 * @author	hz14121005 
 * @date	2015-10-2 下午10:03:27
 * @version     
 */ 
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserRepos userRepos;

    
    /**
     * <p>
     * 
     *
     *用户注册
     * </p>
     * @param user
     * @return
     *  
     * @author	hz14121005 
     * @date	2015-10-2 下午10:26:44
     * @version      
     */ 
    @RequestMapping("/register")
    public @ResponseBody Object register(User user){
	if(StringUtils.isBlank(user.getEmail())){
	    return null;
	}
	if(StringUtils.isBlank(user.getPhone())){
	    return null;
	}
	if(StringUtils.isBlank(user.getName())){
	    return null;
	}
	if(StringUtils.isBlank(user.getPwd())){
	    return null;
	}
	return userRepos.save(user);
    }
    
    /**
     * <p>
     * 
     *用户登录
     *
     * </p>
     * @param user
     *  
     * @author	hz14121005 
     * @date	2015-10-4 上午10:48:11
     * @version      
     */ 
    @RequestMapping("/login")
    public @ResponseBody void login(User user){
	if(StringUtils.isBlank(user.getName())){
	    return ;
	}
	if(StringUtils.isBlank(user.getPwd())){
	    return ;
	}
	List<User> list=userRepos.findByCondition(user);
	if(list==null||list.isEmpty()){
	 return;
	}
    }
    

}
