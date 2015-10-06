
package com.itjoin.admin.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itjoin.admin.model.Admin;
import com.itjoin.admin.repositories.AdminCurd;
import com.itjoin.admin.repositories.AdminRepository;
import com.itjoin.constant.CommonConstant;
import com.itjoin.util.ImageUtil;
import com.itjoin.util.Pagination;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final String PAGE =  "pages/admin/";

	@Resource
	private AdminRepository adminRepository;
	@Resource
	private AdminCurd adminCurd;
	@RequestMapping("/{page}")
    public String skipPage(@PathVariable("page") String page) {
	return PAGE + page;
    }
	
	@RequestMapping("/main")
    public String skipMain() {
	return PAGE +"main";
    }
	
	@RequestMapping("/basic/{page}")
    public String skipBasic(@PathVariable("page") String page) {
	return PAGE +"basic/"+page;
    }
	
	
	

	
	
	@RequestMapping(method = RequestMethod.POST, value = "/login")
	@ResponseBody
	protected Admin login(HttpServletRequest request,
			@ModelAttribute Admin loginUser) throws Exception {
		List<Admin> users = adminCurd.findByCondition(loginUser);
		System.out.println(loginUser.getLoginPwd());
		Admin user = new Admin();
		boolean result = false;
		if (users != null && users.size() == 1) {
			result = true;
			user = users.get(0);
		}
		// 失败次数记录
		int failLoginNums = 0;

		// 从session中寻找失败记录次数
		if (null != request.getSession().getAttribute("adminFailLoginNums")) {
			failLoginNums = Integer.parseInt(request.getSession()
					.getAttribute("adminFailLoginNums").toString());
		}

		// 判断登录是否成功，假如失败的话，需对失败次数加1并存回session
		if (!result) {
			failLoginNums++;
			request.getSession().setAttribute("adminFailLoginNums", failLoginNums);
		} else {
			request.getSession().removeAttribute("adminFailLoginNums");
		}
		HttpSession session = request.getSession();
		session.setAttribute("adminUser", user);
		session.setMaxInactiveInterval(-1);
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
			Admin user = null;
			try {
				HttpSession session = request.getSession();
				user =  (Admin) session.getAttribute("adminUser");
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			return user;
		}
		
		@RequestMapping(value = "/modifyPwd/{newPwd}", method = RequestMethod.POST)
		protected @ResponseBody Object modifyPwd(HttpServletRequest request,@PathVariable String newPwd) throws Exception {
			Admin user = null;
			try {
				HttpSession session = request.getSession();
				user =  (Admin) session.getAttribute("adminUser");
				user.setLoginPwd(newPwd);
				adminRepository.save(user);
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			return newPwd;
		}
		
		@RequestMapping(value = "/loginout", method = RequestMethod.POST)
		protected @ResponseBody Object loginOut(HttpServletRequest request) throws Exception {
			try {
				HttpSession session = request.getSession();
				session.removeAttribute("adminUser");
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return 1;
		}
		@RequestMapping(value = "/getAll")
		@ResponseBody
		public Pagination getALLUser(Integer page,Integer rows){
			 //设置当前页
	        //设置每页显示的数量
	        int intPageSize=rows==null||rows<=0?10:rows;;
	        if(page>0){
	        	page--;
	        }
			Pagination pagination = new Pagination();
			Pageable pageable = new PageRequest(page, intPageSize) {
			};
			Page<Admin> adminPages = adminRepository.findAll(pageable);
			
			List<Admin> admins  = adminPages.getContent();
			pagination.setRows(admins);
			pagination.setTotal(adminRepository.count());
			 return pagination;
			
		}
		
		
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		protected @ResponseBody Object update(HttpServletRequest request,
				@ModelAttribute Admin user) throws Exception {
			try {
				if(StringUtils.isBlank(user.getId())){
					user.setId(null);
				}else{
					Admin oldUser = adminRepository.findOne(user.getId());
					if(oldUser!=null){
						if(StringUtils.isBlank(user.getLoginPwd())){
							user.setLoginPwd(oldUser.getLoginPwd());
						}
					}
				}
				adminRepository.save(user);
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return 1;
		}
		
		
		@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
		protected @ResponseBody Object delete(HttpServletRequest request,@PathVariable String id,HttpSession session) throws Exception {
			try {
				Admin user =  (Admin) session.getAttribute("adminUser");
				if(user.getId()==null){
					return "0";
				}
				if(id.equals(user.getId())){
					return "0";
				}else{
					adminRepository.delete(id);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
			return 1;
		}
		
		@RequestMapping(value = "/uploadImage")
		
		public void  uploadImage(@RequestParam("upload") MultipartFile file,@RequestParam("CKEditorFuncNum")String CKEditorFuncNum,HttpServletRequest request,HttpServletResponse response) throws IOException {
			PrintWriter out =response.getWriter();
			String fileName=file.getOriginalFilename();
			String uploadContentType =file.getContentType();
			String expandedName ="";
			if (uploadContentType.equals("image/pjpeg")  
	                || uploadContentType.equals("image/jpeg")) {  
	            // IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg  
	            expandedName = ".jpg";  
	        } else if (uploadContentType.equals("image/png")  
	                || uploadContentType.equals("image/x-png")) {  
	            // IE6上传的png图片的headimageContentType是"image/x-png"  
	            expandedName = ".png";  
	        } else if (uploadContentType.equals("image/gif")) {  
	            expandedName = ".gif";  
	        } else if (uploadContentType.equals("image/bmp")) {  
	            expandedName = ".bmp";  
	        } else {  
	            out.println("<script type=\"text/javascript\">");  
	            out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum  
	                    + ",''," + "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");  
	            out.println("</script>");  
	            return ;  
	        }  
			if (file.getSize()> 600 * 1024) {  
	            out.println("<script type=\"text/javascript\">");  
	            out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum  
	                    + ",''," + "'文件大小不得大于600k');");  
	            out.println("</script>");  
	            return ;  
			}
			DateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");
			fileName = df.format(new Date())+expandedName;
			try {
				file.transferTo(new File(CommonConstant.IMAGE_SRC+fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
	        // 返回"图像"选项卡并显示图片  request.getContextPath()为web项目名   
	        out.println("<script type=\"text/javascript\">");  
	        out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum  
	                + ",'" +request.getContextPath()+CommonConstant.IMAGE_URL+CommonConstant.IMAGE_SRC + fileName + "','')");  
	        out.println("</script>");  
	        return ;  
		}
}
