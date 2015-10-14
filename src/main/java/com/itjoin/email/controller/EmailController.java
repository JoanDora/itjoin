package com.itjoin.email.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itjoin.email.constant.MailSenderConstant;
import com.itjoin.email.factory.MailSenderFactory;
import com.itjoin.email.sender.SimpleMailSender;
import com.itjoin.email.template.SetPwdTemplate;
import com.itjoin.user.model.User;
import com.itjoin.user.repositories.UserRepository;

@Controller
@RequestMapping("/email")
public class EmailController {
	@Resource
	private UserRepository userRepository;
	
	@RequestMapping(value="/send")
	public @ResponseBody Object sendSetPwdEmail(@RequestParam("email") String email){
		SimpleMailSender sms = MailSenderFactory
	            .getSender();
	        try {
	        	List<User> users = userRepository.findByEmail(email);
	        	if(users!=null && users.size()==1){
	        		User user = users.get(0);
	        		user.setLoginPwd(MailSenderConstant.newPwd);
	        		userRepository.save(user);
					sms.send(email,MailSenderConstant.emailSub,SetPwdTemplate.getContent(MailSenderConstant.newPwd));
	        	}else{
	        		return 0;
	        	}
			} catch (Exception e) {
				return 0;
			}
	        return 1;
	        
	}

}
