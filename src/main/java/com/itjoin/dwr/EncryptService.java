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
	 url=XXTeaUtil.Encrypt(url, CommonConstant.XXTEA_KEY);
	return url;
    }
}
 