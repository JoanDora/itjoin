package com.itjoin.pay.model;

/**
 * alipay entity
 * 
 * @author JOANDORA CHUNG
 */
public class PayEntity{
	
	private String wiDoutTradeNo;// 商户订单号 -商户网站订单系统中唯一订单号，必填
	private String wiDsubject;// 订单名称 - 必填
	private String wiDprice;// 付款金额 - 必填
	private String wiDbody;// 订单描述
	private String wiDshowUrl;// 商品展示地址
								// -需以http://开头的完整路径，如：http://www.商户网站.com/myorder.html
	private String wiDreceiveName;// 收货人姓名 如：张三
	private String wiDreceiveAddress;// 收货人地址 -
										// 如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号
	private String wiDreceiveZip;// 收货人邮编 -如：123456
	private String wiDreceivePhone;// 收货人电话号码 -如：0571-88158090
	private String wiDreceiveMobile;// 收货人手机号码 -如：13312341234

	public String getWiDoutTradeNo() {
		return wiDoutTradeNo;
	}

	public void setWiDoutTradeNo(String wiDoutTradeNo) {
		this.wiDoutTradeNo = wiDoutTradeNo;
	}

	public String getWiDsubject() {
		return wiDsubject;
	}

	public void setWiDsubject(String wiDsubject) {
		this.wiDsubject = wiDsubject;
	}

	public String getWiDprice() {
		return wiDprice;
	}

	public void setWiDprice(String wiDprice) {
		this.wiDprice = wiDprice;
	}

	public String getWiDbody() {
		return wiDbody;
	}

	public void setWiDbody(String wiDbody) {
		this.wiDbody = wiDbody;
	}

	public String getWiDshowUrl() {
		return wiDshowUrl;
	}

	public void setWiDshowUrl(String wiDshowUrl) {
		this.wiDshowUrl = wiDshowUrl;
	}

	public String getWiDreceiveName() {
		return wiDreceiveName;
	}

	public void setWiDreceiveName(String wiDreceiveName) {
		this.wiDreceiveName = wiDreceiveName;
	}

	public String getWiDreceiveAddress() {
		return wiDreceiveAddress;
	}

	public void setWiDreceiveAddress(String wiDreceiveAddress) {
		this.wiDreceiveAddress = wiDreceiveAddress;
	}

	public String getWiDreceiveZip() {
		return wiDreceiveZip;
	}

	public void setWiDreceiveZip(String wiDreceiveZip) {
		this.wiDreceiveZip = wiDreceiveZip;
	}

	public String getWiDreceivePhone() {
		return wiDreceivePhone;
	}

	public void setWiDreceivePhone(String wiDreceivePhone) {
		this.wiDreceivePhone = wiDreceivePhone;
	}

	public String getWiDreceiveMobile() {
		return wiDreceiveMobile;
	}

	public void setWiDreceiveMobile(String wiDreceiveMobile) {
		this.wiDreceiveMobile = wiDreceiveMobile;
	}
}
