package com.itjoin.upload.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itjoin.upload.model.Progress;

/**
 * 
 * 创建人：liuyaolin <br>
 * 功能描述： 获取上传文件进度controller<br>
 *
 */
@Controller
@RequestMapping("/fileStatus")
public class ProgressController{
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/upload/progress", method = RequestMethod.GET )
	public @ResponseBody Object initCreateInfo(HttpServletRequest request) {
		Progress status =new Progress();
		try {
			logger.warn("获取文件上传进度");
			Object result = request.getSession().getAttribute("upload_ps");
			if(result!=null){
				 status = (Progress) result;
			}
		} catch (Exception e) {
			logger.error("获取进度异常",e);
		}
		return status;
	}
}