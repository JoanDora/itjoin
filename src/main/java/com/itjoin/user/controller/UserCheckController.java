package com.itjoin.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itjoin.user.model.User;
import com.itjoin.user.repositories.UserCurd;

@Controller  
@RequestMapping("/user/check") 
public class UserCheckController  {
    @Autowired
    private UserCurd userCompleteCurd;
	
   @RequestMapping(params = "method=add")   
   public ModelAndView add(HttpServletRequest request, ModelMap modelMap) throws Exception{   
       return new ModelAndView("jsp/game/compositeList","","");
   }   
   
   
  
   @RequestMapping(value = "/phone/{phone}", method = RequestMethod.GET)  
   public  @ResponseBody Object  checkPhone(@PathVariable String phone) throws Exception{ 
            Query query = new Query();
	    Criteria criteria = Criteria.where("phone").is(phone);
	    query.addCriteria(criteria);
	    List<User> users = userCompleteCurd.find(query);
	    int result =1;
	    if(users.size()>0){
		result = 0;
	    }
          return result;
   }   
   
   @RequestMapping(value = "/email", method = RequestMethod.GET)  
   public  @ResponseBody Object  checkEmail(@RequestParam("email") String email) throws Exception{ 
            Query query = new Query();
	    Criteria criteria = Criteria.where("email").is(email);
	    query.addCriteria(criteria);
	    List<User> users = userCompleteCurd.find(query);
	    int result =1;
	    if(users.size()>0){
		result = 0;
	    }
          return result;
   }  
   @RequestMapping(value = "/checkUserName", method = RequestMethod.GET)   
   @ResponseBody
   public Map<String,String> checkUserName(HttpServletRequest request, ModelMap modelMap) throws Exception{ 
	   String userName = request.getParameter("message");
//	   boolean nameFlag = userService.checkUserName(userName);
	   Map<String,String> map = new HashMap<String,String>();
//	   if(nameFlag){
//		   map.put("success","true");
//		   map.put("flag", "1");
//	   }
//	   else
//	   {
//		   map.put("success","false");
//		   map.put("flag", "1");
//	   }
       return map;
   } 
   
   /**
    * 发送短信验证码
    * @param request
    * @param modelMap
    * @return
    * @throws Exception
    */
   @RequestMapping(value = "/sendMessageCode", method = RequestMethod.GET)   
   @ResponseBody 
   public Map<String,String> sendMessageCode(HttpServletRequest request, ModelMap modelMap) throws Exception{ 
//	   boolean messageFlag = userService.sendMessageCode();
	   Map<String,String> map = new HashMap<String,String>();
	   
//	   if(messageFlag){
//		   map.put("success","true");
//		   map.put("flag", "1");
//	   }
//	   else
//	   {
//		   map.put("success","false");
//		   map.put("flag", "1");
//	   }
       return map;
   } 
   
   
   /**
    * 检查短信验证码
    * @param request
    * @param modelMap
    * @return
    * @throws Exception
    */
   @RequestMapping(value = "/messageCode", method = RequestMethod.GET)   
   @ResponseBody 
   public Map<String,String> checkMessageCode(HttpServletRequest request, ModelMap modelMap) throws Exception{ 
	   String messageCode = request.getParameter("message");
//	   boolean messageFlag = userService.checkMessageCode(messageCode);
	   Map<String,String> map = new HashMap<String,String>();
//	   
//	   if(messageFlag){
//		   map.put("success","true");
//		   map.put("flag", "1");
//	   }
//	   else
//	   {
//		   map.put("success","false");
//		   map.put("flag", "1");
//	   }
       return map;
   } 
   

   /**
    * 验证网页验证码
    * @param request
    * @param modelMap
 * @return 
    * @return
    * @throws Exception
    */
   @RequestMapping(value = "/checkValidateCode", method = RequestMethod.GET)   
   @ResponseBody 
   public Object checkValidateCode(HttpServletRequest request,@RequestParam("code")String validateCode, HttpServletResponse response) throws Exception{ 
	    HttpSession  session = request.getSession();
	    Object code = session.getAttribute("validataCode");
	    if(code==null){
	    	return 2;
	    }
		String realCode = session.getAttribute("validataCode").toString();
		if(validateCode.equalsIgnoreCase(realCode)){
			return 1;
		}
		return 0;
   }
   
   
}
