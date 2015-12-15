package com.itjoin.pay.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.itjoin.course.model.Course;
import com.itjoin.course.repositories.CourseRepository;
import com.itjoin.pay.config.AlipayConfig;
import com.itjoin.pay.constant.PayConstant;
import com.itjoin.pay.model.Order;
import com.itjoin.pay.model.PayEntity;
import com.itjoin.pay.repositories.OrderRepository;
import com.itjoin.pay.util.AlipayNotify;
import com.itjoin.pay.util.AlipaySubmit;

/**
 * pay through alipay
 * 
 * @author JOANDORA CHUNG
 */
@Controller
@RequestMapping("/pay")
public class PayController {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private CourseRepository courseRepository;
    
    @Resource
    private OrderRepository orderRepository;
	/**
	 * forward to ali pay pages
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/goPayPage/{id}", method = RequestMethod.GET)
	public String  goPayPage(@PathVariable String id, ModelMap model)
			throws IOException {
                
	        Course course =  courseRepository.findOne(id);
	        PayEntity payEntity = new PayEntity();
	        String outTradeNo = "dxzxfx"+String.valueOf(new Date().getTime());
		payEntity.setWiDoutTradeNo(outTradeNo);
		payEntity.setWiDsubject(course.getName());
		payEntity.setWiDprice(""+course.getPrice());
		// 支付类型
		String payment_type = "1";
		// 必填，不能修改
		// 服务器异步通知页面路径
		String notify_url = PayConstant.NOTIFY_URL;
		// 需http://格式的完整路径，不能加?id=123这类自定义参数

		// 页面跳转同步通知页面路径
		String return_url = PayConstant.RETURN_URL;
		// 需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
		// 商品数量
		String quantity = "1";
		// 物流类型
		String logistics_type = "EXPRESS";
		// 必填，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
		// 物流支付方式
		String logistics_payment = "SELLER_PAY";
		// 必填，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）
		// 物流费用
		String logistics_fee = "0.00";

		// 把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "create_partner_trade_by_buyer");
		sParaTemp.put("partner", AlipayConfig.partner);
		sParaTemp.put("seller_email", AlipayConfig.seller_email);
		sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", payment_type);
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("out_trade_no", payEntity.getWiDoutTradeNo());
		sParaTemp.put("subject", payEntity.getWiDsubject());
		sParaTemp.put("price", payEntity.getWiDprice());
		sParaTemp.put("quantity", quantity);
		sParaTemp.put("logistics_fee", logistics_fee);
		sParaTemp.put("logistics_type", logistics_type);
		sParaTemp.put("logistics_payment", logistics_payment);
		sParaTemp.put("body", payEntity.getWiDbody());
		sParaTemp.put("show_url", payEntity.getWiDshowUrl());
		sParaTemp.put("receive_name", payEntity.getWiDreceiveName());
		sParaTemp.put("receive_address", payEntity.getWiDreceiveAddress());
		sParaTemp.put("receive_zip", payEntity.getWiDreceiveZip());
		sParaTemp.put("receive_phone", payEntity.getWiDreceiveZip());
		sParaTemp.put("receive_mobile", payEntity.getWiDreceiveMobile());

		// 建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "post", "确认");
		model.put("sHtmlText", sHtmlText);
		
		Order order = new Order();
		order.setCourseId(id);
		order.setOutTradeNo(outTradeNo);
		orderRepository.save(order);
		
		logger.warn("用户准备支付，订单信息为:"+JSONObject.toJSONString(order));
		return "pages/pay/alipayapi";
	}
	
	/**
	 * 
	 * <p>
	 * 支付宝异步回调
	 *
	 *
	 * </p>
	 * @param req
	 * @param resp
	 *  
	 * @author	hz1412998 
	 * @date	2015年12月15日 上午11:33:03
	 * @version
	 */
	@RequestMapping("/notify")
	public void notify(HttpServletRequest request,HttpServletResponse response){
	    PrintWriter out = null;
    	    try {
    		out = response.getWriter();
    	  
	  //获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		//商户订单号
		String outTradeNo = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//支付宝交易号
		String tradeNo = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
		logger.warn("支付宝回调信息:{}",JSONObject.toJSONString(params));
		if(AlipayNotify.verify(params)){//验证成功
			//请在这里加上商户的业务逻辑程序代码
			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			
			if(trade_status.equals("WAIT_BUYER_PAY")){
				//该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
			    			//请务必判断请求时的price、quantity、seller_id与通知时获取的price、quantity、seller_id为一致的
						//如果有做过处理，不执行商户的业务程序
            			  Order order = orderRepository.findByOutTradeNo(outTradeNo);
            			 if(order !=null){
            			    order.setTradeStatus(PayConstant.WAIT_BUYER_PAY);
            			    order.setTradeNo(tradeNo);
            			    orderRepository.save(order);
            			 }
				   out.println("success");	//请不要修改或删除
				} else if(trade_status.equals("WAIT_SELLER_SEND_GOODS")){
				//该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
			    			//请务必判断请求时的price、quantity、seller_id与通知时获取的price、quantity、seller_id为一致的
						//如果有做过处理，不执行商户的业务程序
					
				    Order order = orderRepository.findByOutTradeNo(outTradeNo);
				    if(order !=null){
					 order.setTradeStatus(PayConstant.WAIT_SELLER_SEND_GOODS);
					 order.setTradeNo(tradeNo);
	            			  orderRepository.save(order);
	            			//物流公司名称
	            			String logistics_name = PayConstant.LOGISTICS_NAME;
	            			//必填

	            			//物流发货单号
	            			  String invoice_no = "Invoice"+String.valueOf(new Date().getTime());
	            			//物流运输类型
	            			String transport_type = new String("EMS");
	            			
	            			//把请求参数打包成数组
	            			Map<String, String> sParaTemp = new HashMap<String, String>();
	            			sParaTemp.put("service", "send_goods_confirm_by_platform");
	            	                sParaTemp.put("partner", AlipayConfig.partner);
	            	                sParaTemp.put("_input_charset", AlipayConfig.input_charset);
	            			sParaTemp.put("trade_no", tradeNo);
	            			sParaTemp.put("logistics_name", logistics_name);
	            			sParaTemp.put("invoice_no", invoice_no);
	            			sParaTemp.put("transport_type", transport_type);
	            			//建立请求
	            			String sHtmlText = AlipaySubmit.buildRequest("", "", sParaTemp);
	            			
	            			logger.warn("用户付款，支付宝通知，确认发货信息为:{}",JSONObject.toJSONString(sParaTemp));
//	            			out.println(sHtmlText);
				    //发货处理
				   out.println("success");	//请不要修改或删除
				 
				    }
				} else if(trade_status.equals("WAIT_BUYER_CONFIRM_GOODS")){
				//该判断表示卖家已经发了货，但买家还没有做确认收货的操作
					
				    Order order = orderRepository.findByOutTradeNo(outTradeNo);
				    if(order !=null && order.getTradeStatus()==PayConstant.WAIT_SELLER_SEND_GOODS){
					 order.setTradeStatus(PayConstant.WAIT_BUYER_CONFIRM_GOODS);
					 order.setTradeNo(tradeNo);
	            			  orderRepository.save(order);
				    }
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
			    			//请务必判断请求时的price、quantity、seller_id与通知时获取的price、quantity、seller_id为一致的
						//如果有做过处理，不执行商户的业务程序
					out.println("success");	//请不要修改或删除
				} else if(trade_status.equals("TRADE_FINISHED")){
				//该判断表示买家已经确认收货，这笔交易完成
				    logger.warn("买家已经确认收货，这笔交易完成");
				    Order order = orderRepository.findByOutTradeNo(outTradeNo);
				    if(order !=null && order.getTradeStatus()==PayConstant.WAIT_BUYER_CONFIRM_GOODS){
					 order.setTradeStatus(PayConstant.TRADE_FINISHED);
					 order.setTradeNo(tradeNo);
	            			  orderRepository.save(order);
	            			    logger.warn("交易完成修改订单号，开通课程{}",JSONObject.toJSONString(order));
				      }
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
			    			//请务必判断请求时的price、quantity、seller_id与通知时获取的price、quantity、seller_id为一致的
						//如果有做过处理，不执行商户的业务程序
					
					out.println("success");	//请不要修改或删除
				}
				else {
					out.println("success");	//请不要修改或删除
				}
		}else{//验证失败
			out.println("fail");
		}
    	  } catch (Exception e) {
    	          
            	  out.println("fail");
  	    }
	    
	}
	
	
	
	/**
	 * 
	 * <p>
	 * 支付成功后，支付宝同步调用接口
	 *
	 *
	 * </p>
	 * @param request
	 * @param response
	 *  
	 * @author	hz1412998 
	 * @date	2015年12月15日 下午2:33:41
	 * @version
	 */
	@RequestMapping("/return")
	public void synchronousReturn(HttpServletRequest request,HttpServletResponse response){
	    PrintWriter out = null;
    	    try {
    		out = response.getWriter();
	          //获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		String outTradeNo = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		String tradeNo = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		String tradeStatus = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		boolean verify_result = AlipayNotify.verify(params);
		if(verify_result){//验证成功
			//请在这里加上商户的业务逻辑程序代码
			if(tradeStatus.equals("WAIT_SELLER_SEND_GOODS")){
			    Order order = orderRepository.findByOutTradeNo(outTradeNo);
			    if(order !=null){
				order.setTradeStatus(PayConstant.WAIT_SELLER_SEND_GOODS);
				 order.setTradeNo(tradeNo);
            			  orderRepository.save(order);
            			//物流公司名称
            			String logistics_name = PayConstant.LOGISTICS_NAME;
            			//物流发货单号
            			  String invoice_no = "Invoice"+String.valueOf(new Date().getTime());
            			//物流运输类型
            			String transport_type = new String("EMS");
            			//把请求参数打包成数组
            			Map<String, String> sParaTemp = new HashMap<String, String>();
            			sParaTemp.put("service", "send_goods_confirm_by_platform");
            	                sParaTemp.put("partner", AlipayConfig.partner);
            	                sParaTemp.put("_input_charset", AlipayConfig.input_charset);
            			sParaTemp.put("trade_no", tradeNo);
            			sParaTemp.put("logistics_name", logistics_name);
            			sParaTemp.put("invoice_no", invoice_no);
            			sParaTemp.put("transport_type", transport_type);
            			//建立请求
            			String sHtmlText = AlipaySubmit.buildRequest("", "", sParaTemp);
            			logger.warn("用户付款，支付宝通知，确认发货信息为:{}",JSONObject.toJSONString(sParaTemp));
			}
			 //该页面可做页面美工编辑
			  out.println("验证成功<br />");
			}
		}else{
			out.println("验证失败");
		}
    	    }catch(Exception e) {
          	  out.println("fail");
	    }
	}
	
}
