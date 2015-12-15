package com.itjoin.pay.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itjoin.pay.config.AlipayConfig;
import com.itjoin.pay.entity.PayEntity;
import com.itjoin.pay.util.AlipaySubmit;

/**
 * pay through alipay
 * 
 * @author JOANDORA CHUNG
 */
@Controller
@RequestMapping("/alipay")
public class PayController {
	/**
	 * forward to ali pay pages
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/goPayPage", method = RequestMethod.GET)
	public ModelAndView goPayPage(PayEntity payEntity, ModelAndView model)
			throws IOException {

		payEntity.setWiDoutTradeNo(String.valueOf(new Date().getTime()));
		payEntity.setWiDsubject("Zookeeper从入门到进阶");
		payEntity.setWiDprice("168");

		// 支付类型
		String payment_type = "1";
		// 必填，不能修改
		// 服务器异步通知页面路径
		String notify_url = "http://www.itjoin.org/create_partner_trade_by_buyer-JAVA-UTF-8/notify_url.jsp";
		// 需http://格式的完整路径，不能加?id=123这类自定义参数

		// 页面跳转同步通知页面路径
		String return_url = "http://www.itjoin.org/create_partner_trade_by_buyer-JAVA-UTF-8/return_url.jsp";
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
		model.addObject("sHtmlText", sHtmlText);
		model.setViewName("pages/pay/alipayapi");
		return model;
	}
}
