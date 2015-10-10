package com.itjoin.upload.controller;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping(value = "/upload/progress", method = RequestMethod.GET )
	public @ResponseBody Object initCreateInfo(HttpServletRequest request) {
		Progress status = (Progress) request.getSession().getAttribute("upload_ps");
		return status;
	}
}