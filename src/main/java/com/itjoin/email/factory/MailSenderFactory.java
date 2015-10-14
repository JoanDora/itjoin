package com.itjoin.email.factory;

import com.itjoin.email.constant.MailSenderConstant;
import com.itjoin.email.sender.SimpleMailSender;

 
/**
 * 发件箱工厂
 * 
 * @author MZULE
 * 
 */
public class MailSenderFactory {
 
    /**
     * 服务邮箱
     */
    private static SimpleMailSender serviceSms = null;
 
    /**
     * 获取邮箱
     * 
     * @param type 邮箱类型
     * @return 符合类型的邮箱
     */
    public static SimpleMailSender getSender() {
        if (serviceSms == null) {
        serviceSms = new SimpleMailSender(MailSenderConstant.emailName,
        		MailSenderConstant.emailPwd);
        }
        return serviceSms;
    }
}
