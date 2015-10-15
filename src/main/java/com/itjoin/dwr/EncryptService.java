/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.dwr; 

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContextFactory;
import org.springframework.stereotype.Service;

import com.itjoin.constant.CommonConstant;
import com.itjoin.util.XXTeaUtil;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年10月15日 上午9:17:14
 * @version      
 */
//@Service
public class EncryptService {

    public String encrypt(String url){
	HttpSession session = WebContextFactory.get().getSession();
	String encryptValue = getRandom();
	session.setAttribute(CommonConstant.ENCRYPT_KEY, encryptValue);
	 url=XXTeaUtil.Encrypt(url, encryptValue);
	return url;
    }
    
    private String getRandom(){
	StringBuffer sbf = new StringBuffer("SP");
	sbf.append(new SimpleDateFormat("yyMMddHHmmssSSS").format(new Date()));
	Random random = new Random();
	sbf.append(100 + random.nextInt(899));
	return sbf.toString();
    }
}
 