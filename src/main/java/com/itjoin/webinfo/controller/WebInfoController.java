/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.webinfo.controller; 

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itjoin.webinfo.model.WebInfo;
import com.itjoin.webinfo.repositories.WebInfoRepository;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年10月9日 下午6:11:11
 * @version      
 */
@Controller
@RequestMapping("/webinfo")
public class WebInfoController {
    
    @Resource
    private WebInfoRepository repos;
    @RequestMapping("/save")
    public @ResponseBody Object save(WebInfo webInfo){
	try {
	    repos.save(webInfo);
	    return 1;
	} catch (Exception e) {
	    e.printStackTrace();
	    return 0;
	}
    }

}
 