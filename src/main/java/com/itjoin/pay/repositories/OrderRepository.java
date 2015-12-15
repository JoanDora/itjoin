/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.pay.repositories; 

import org.springframework.data.mongodb.repository.MongoRepository;

import com.itjoin.pay.model.Order;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年12月15日 下午1:15:02
 * @version      
 */
public interface OrderRepository extends MongoRepository<Order, String>{

    Order findByOutTradeNo(String out_trade_no);

}
 