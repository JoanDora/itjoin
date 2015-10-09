/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.webinfo.repositories; 

import org.springframework.data.mongodb.repository.MongoRepository;

import com.itjoin.webinfo.model.WebInfo;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年10月9日 下午6:11:51
 * @version      
 */
public interface  WebInfoRepository extends MongoRepository<WebInfo,String>{

}
 