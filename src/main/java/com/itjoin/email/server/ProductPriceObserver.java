package com.itjoin.email.server;
import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.itjoin.email.factory.MailSenderFactory;
import com.itjoin.email.sender.SimpleMailSender;
 
public class ProductPriceObserver implements Observer {
 
    @Override
    public void update(Observable obj, Object arg) {
        Float price = (Float) arg;
        Float decrease = 12f;
        if (decrease > 0) {
        // 发送邮件
        SimpleMailSender sms = MailSenderFactory
            .getSender();
        List<String> recipients = new ArrayList<String>();
        recipients.add("624881289@qq.com");
        try {
            for (String recipient : recipients) {
            sms.send(recipient, "价格变动", "您关注的物品"
                 + "test降价了，由"+ "元降到" + price + "元，降幅达"
                + decrease + "元人民币。赶快购物吧。");
            }
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    }
}
