/**
 * Copyright (c) 2006-2015 Hzins Ltd. All Rights Reserved. 
 *  
 * This code is the confidential and proprietary information of   
 * Hzins. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Hzins,http://www.hzins.com.
 *  
 */   
package com.itjoin.pay.constant; 

/**
 * <p>
 * 
 *
 *
 * </p>
 * @author	hz1412998 
 * @date	2015年12月15日 上午11:47:11
 * @version      
 */
public class PayConstant {
    
    public final static int WAIT_BUYER_PAY=0;//待付款
    public final static int WAIT_SELLER_SEND_GOODS=1;//已在支付宝付款
    public final static int WAIT_BUYER_CONFIRM_GOODS=2;//已发货
    public final static int TRADE_FINISHED=3;//买家已经确认收货; 
    public final static String NOTIFY_URL="http://www.itjoin.org/pay/notify";
    public final static String RETURN_URL="http://www.itjoin.org/pay/return";
    public static final String LOGISTICS_NAME = "虚拟物品";
}
 