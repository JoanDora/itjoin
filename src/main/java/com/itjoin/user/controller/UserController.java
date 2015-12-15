package com.itjoin.user.controller;

import java.awt.image.BufferedImage;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.QueryParam;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itjoin.admin.model.Admin;
import com.itjoin.user.UserConstant;
import com.itjoin.user.model.User;
import com.itjoin.user.repositories.UserCurd;
import com.itjoin.user.repositories.UserRepository;
import com.itjoin.util.DateTimeUtil;
import com.itjoin.util.ImageUtil;
import com.itjoin.util.Pagination;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserRepository userRepository;
	@Resource
	private UserCurd userCurd;

	public final String PAGE = "html/";


	@RequestMapping(value = "/register", method = RequestMethod.POST)
	protected @ResponseBody Object register(HttpServletRequest request,
			@ModelAttribute User user) throws Exception {
		try {
			user.setCreateTime(new Date());
			user.setLastLoginTime(new Date());
			userRepository.save(user);
			HttpSession session = request.getSession();
			session.setAttribute(UserConstant.LOGIN_USER, user);
			session.setMaxInactiveInterval(-1);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}

	
	
	
	
	@RequestMapping(method = RequestMethod.POST, value = "/login")
	@ResponseBody
	protected User login(HttpServletRequest request,
			@ModelAttribute User loginUser) throws Exception {
		List<User> users = userCurd.findByCondition(loginUser);
		User user = new User();
		boolean result = false;
		if (users != null && users.size() == 1) {
			result = true;
			user = users.get(0);
			user.setLastLoginTime(new Date());
			userRepository.save(user);
		}
		// contextPath = request.getContextPath();
		// 失败次数记录
		int failLoginNums = 0;

		// 从session中寻找失败记录次数
		if (null != request.getSession().getAttribute("failLoginNums")) {
			failLoginNums = Integer.parseInt(request.getSession()
					.getAttribute("failLoginNums").toString());
		}

		// 判断登录是否成功，假如失败的话，需对失败次数加1并存回session
		if (!result) {
			failLoginNums++;
			request.getSession().setAttribute("failLoginNums", failLoginNums);
		} else {
			request.getSession().removeAttribute("failLoginNums");
		}
		HttpSession session = request.getSession();
		session.setAttribute(UserConstant.LOGIN_USER, user);
		session.setMaxInactiveInterval(-1);

		// return "service/selfService";
		return user;
	}

	@RequestMapping(method = RequestMethod.GET, params = "method=clearSession")
	@ResponseBody
	public Map<String, String> clearSession(HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		String attribute = request.getParameter("attribute").toString();
		request.getSession().removeAttribute(attribute);
		Map<String, String> map = new HashMap<String, String>();
		map.put("success", "false");
		map.put("flag", "1");
		return map;
	}

	 @RequestMapping("/skip/{page}")
	 public String skipPage(@PathVariable("page") String page){
		 return PAGE+page;
	 }
	 
	 
	   /**
	    * 获取网页验证码
	    * @param request
	    * @param modelMap
	    * @return
	    * @throws Exception
	    */
	   @RequestMapping(value = "/validataCode", method = RequestMethod.GET)   
	   @ResponseBody 
	   public void getValidataCode(HttpServletRequest request, HttpServletResponse response) throws Exception{ 
		    HttpSession  session = request.getSession();
			Map<String,BufferedImage> map = ImageUtil.createMap();
			String code = map.keySet().iterator().next();
			session.setAttribute("validataCode", code);
			BufferedImage image = map.get(code);
			ImageIO.write(image, "jpg", response.getOutputStream());
	   } 
	   
	   
		@RequestMapping(value = "/getSessionUser", method = RequestMethod.POST)
		protected @ResponseBody Object getSessionUser(HttpServletRequest request) throws Exception {
			User user = null;
			try {
				HttpSession session = request.getSession();
				user =  (User) session.getAttribute(UserConstant.LOGIN_USER);
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			return user;
		}
		
		@RequestMapping(value = "/loginout", method = RequestMethod.GET)
		protected @ResponseBody Object loginOut(HttpServletRequest request) throws Exception {
			try {
				HttpSession session = request.getSession();
				session.removeAttribute(UserConstant.LOGIN_USER);
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return 1;
		}
		
		
		@RequestMapping(value = "/getAll")
		@ResponseBody
		public Pagination getALLUser(Integer page,Integer rows,@QueryParam("startTime")String startTime,@QueryParam("endTime") String endTime,@QueryParam("phone")String phone){
			 //设置当前页
	        //设置每页显示的数量
	        int intPageSize=rows==null||rows<=0?10:rows;;
	        if(page>0){
	        	page--;
	        }
			Pagination pagination = new Pagination();
                long total = 0;
				Date start = null;
				Date end = null;
				Query query = new Query();
				Criteria criteria = new Criteria();
				Criteria timeCriteria = new Criteria();
				if(StringUtils.isNotBlank(phone)){
					Pattern pattern = Pattern.compile("^.*" + phone + ".*$");
					criteria = Criteria.where("phone").regex(pattern);
				}
				
				if(StringUtils.isNotBlank(startTime) ){
					start=DateTimeUtil.parseDate(startTime);
					if(StringUtils.isNotBlank(endTime)){
						end = DateTimeUtil.parseDate(endTime);
						timeCriteria = Criteria.where("createTime").gt(start).lt(end);
					}else{
						timeCriteria=Criteria.where("createTime").gt(start);
					}
					
				}else{
					if(StringUtils.isNotBlank(endTime)){
						end = DateTimeUtil.parseDate(endTime);
						timeCriteria = Criteria.where("createTime").lt(end);
					}
				}
				criteria.andOperator(timeCriteria);
				query.addCriteria(criteria);
				query.limit(intPageSize);
				query.skip(page*intPageSize);
				Direction direction=Direction.DESC;
				Sort sort = new Sort(direction, "createTime");
				query.with(sort);
				
				List<User> users   =  userCurd.find(query);
				total = userCurd.count(query);
			pagination.setRows(users);
			pagination.setTotal(total);
			 return pagination;
			
		}
		
		@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
		protected @ResponseBody Object delete(HttpServletRequest request,@PathVariable String id,HttpSession session) throws Exception {
			try {
//				Admin admin = adminRepository.findOne(id);
				Admin user =  (Admin) session.getAttribute("adminUser");
				if(user.getId()==null){
					return "0";
				}
			    userRepository.delete(id);
//				admin.setDeleted("1");
//				adminRepository.save(admin);
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return 1;
		}
		
		
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public @ResponseBody Object update(HttpServletRequest request,
				@ModelAttribute User user) throws Exception {
			try {
				userRepository.save(user);
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return 1;
		}
		
}
