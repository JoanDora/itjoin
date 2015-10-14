package com.itjoin.email.template;

public class SetPwdTemplate {
	
	public static String content="您在it分享联盟的密码已经重置，新密码为${new_pwd}，请妥善保管";
	
	public static String getContent(String newPwd){
		return content.replace("${new_pwd}", newPwd);
	}

}
