/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.pay.model; 

import org.springframework.data.mongodb.core.mapping.Document;

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年12月15日 上午11:38:59
 * @version      
 */
@Document(collection = "Order")
public class Order {
    private String id;
    private String outTradeNo;//商户订单号
    private String tradeNo;//支付宝交易号
    private Integer tradeStatus;//订单状态 0表示未支付，1表示已支付，2表示发货，3表示确认到货，开通课程
    
    private String courseId;//课程id
    private String userId;//用户id
    
    
    
    
    public String getUserId() {
        return userId;
    }



    
    public void setUserId(String userId) {
        this.userId = userId;
    }



    public String getCourseId() {
        return courseId;
    }


    
    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }


    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }
    
    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }
    
    public String getTradeNo() {
        return tradeNo;
    }
    
    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }
    
    public Integer getTradeStatus() {
        return tradeStatus;
    }
    
    public void setTradeStatus(Integer tradeStatus) {
        this.tradeStatus = tradeStatus;
    }
    
    
}
 