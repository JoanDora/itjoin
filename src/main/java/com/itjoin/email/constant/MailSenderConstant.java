package com.itjoin.email.constant;

import com.itjoin.util.LoadEmailConfUtil;


public class MailSenderConstant {

	public static final  String  SERVICE = "mailType";
	
	
	public static final String EMAIL_NAME_PRO = "email.name";
	public static final String EMAIL_PRO= "email.pwd";
	public static final String NEW_PWD_PRO= "email.newpwd";
	public static final String EMAIL_SUB_PRO= "email.sub";

	public static  String emailName = null;
	public static  String emailPwd= null;
	
	public static String newPwd=null;
	public static String emailSub=null;
	
	static {
		emailName = LoadEmailConfUtil.getProperty(EMAIL_NAME_PRO, "liuyao64@sina.com");
		emailPwd = LoadEmailConfUtil.getProperty(EMAIL_PRO, "624881289");
		newPwd = LoadEmailConfUtil.getProperty(NEW_PWD_PRO, "123456");
//		emailSub= LoadEmailConfUtil.getProperty(EMAIL_SUB_PRO, "");
		emailSub = "测试邮件";
	}

}
