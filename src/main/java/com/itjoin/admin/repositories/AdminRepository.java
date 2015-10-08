/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.admin.repositories; 

import org.springframework.data.mongodb.repository.MongoRepository;

import com.itjoin.admin.model.Admin;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年3月15日 下午2:24:25
 * @version      
 */
public   interface  AdminRepository extends MongoRepository<Admin,String>{

}
 