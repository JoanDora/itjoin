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
import org.springframework.ui.ModelMap;
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
    
    private static final String PAGE = "pages/";
    @Resource
    private WebInfoRepository repos;
    @RequestMapping("/save")
    public @ResponseBody Object save(WebInfo webInfo){
	try {
	    webInfo.setId(repos.findAll().get(0).getId());
	    repos.save(webInfo);
	    return 1;
	} catch (Exception e) {
	    e.printStackTrace();
	    return 0;
	}
    }
    @RequestMapping("/show")
    public  String show (ModelMap model){
	    model.addAttribute("webinfo", repos.findAll().get(0));
	    return PAGE+"about";
    }
}
 