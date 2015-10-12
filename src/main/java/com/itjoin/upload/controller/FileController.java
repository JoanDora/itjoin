package com.itjoin.upload.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itjoin.constant.CommonConstant;
import com.itjoin.util.DateTimeUtil;

/**
 * 
 * 创建人：fantasy <br>
 * 创建时间：2013-12-6 <br>
 * 功能描述： 用户文件上传下载和文件列表<br>
 */
@Controller
@RequestMapping("/file")
public class FileController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 上传文件
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody Object upload(MultipartHttpServletRequest request, HttpServletResponse response ) throws IOException{
	       response.setContentType("text/plain; charset=UTF-8");
		Map<String, Object> result = new HashMap<String, Object>();
	       try {
		handler(request, response, result, CommonConstant.VIDEO_SRC);
	       } catch (Exception e) {
		e.printStackTrace();
		return result;
	       }
		return result;
	}
	
	/**
	 * 处理文件上传
	 * @param result2 
	 */
	public  void handler(MultipartHttpServletRequest request, HttpServletResponse response, Map<String, Object> result, String folder) throws Exception{
		Date baseDate = new Date();
		String fileName = DateTimeUtil.parseDate(baseDate, "yyyyMMddHHmmss");
		MultipartFile file = request.getFile("file");
		if (file == null) {// step-2 判断file
		    result.put("status", "0");
		    result.put("msg", "文件为空！");
		    return ;
		}
		String orgFileName = file.getOriginalFilename();
		orgFileName = (orgFileName == null) ? "" : orgFileName;
		Pattern p = Pattern.compile("\\s|\t|\r|\n");
               Matcher m = p.matcher(orgFileName);
                orgFileName = m.replaceAll("_");
		String realFilePath = folder  + File.separator + "admin" + File.separator;
		if(!(new File(realFilePath).exists())){
			new File(realFilePath).mkdirs();
		}
		String bigRealFilePath = realFilePath  + File.separator + FilenameUtils.getBaseName(orgFileName).concat(".") + fileName.concat(".").concat(FilenameUtils.getExtension(orgFileName).toLowerCase());
		if (file.getSize() > 0) {
			File targetFile = new File(bigRealFilePath);
			file.transferTo(targetFile);//写入目标文件
		}
		request.getSession().setAttribute("videoPath", bigRealFilePath);
		request.getSession().setAttribute("fileName", orgFileName);
		result.put("status", "1");
		result.put("msg", "上传成功");
		result.put("fileName", orgFileName);
	}
	
	@RequestMapping(value = "/getByName")
	@ResponseBody
	public void show(@RequestParam("fileName") String fileName,
			HttpServletResponse response) {
		
		long start = System.currentTimeMillis();
		InputStream fis = null;
		response.setContentType("application/octet-stream; charset=utf-8");  
		if(StringUtils.isBlank(fileName)){
			return ;
		}
		OutputStream os = null;
		try {
			File file = FileUtils.getFile(fileName);
			os = response.getOutputStream();
			os.write( FileUtils.readFileToByteArray(file));
//			int count = 0;
//			byte[] buffer = new byte[1024 * 8];
//			while ((count = fis.read(buffer)) != -1) {
//				os.write(buffer, 0, count);
//				os.flush();
//			}
			os.flush();
		} catch (IllegalStateException e) {

		} catch (IOException e) {
			// e.printStackTrace();
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
				if (os != null) {
					os.close();
				}

			} catch (IOException e) {
				// e.printStackTrace();
			}
		}
		long end = System.currentTimeMillis();
		System.out.println("=====视频观看时间总共耗时===="+(end-start)+"ms");
	}

}