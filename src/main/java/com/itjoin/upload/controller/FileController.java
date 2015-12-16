package com.itjoin.upload.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.nio.channels.SeekableByteChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.itjoin.constant.CommonConstant;
import com.itjoin.util.DateTimeUtil;
import com.itjoin.util.XXTeaUtil;

import static java.nio.file.StandardOpenOption.READ;

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

	private static final int BUFFER_LENGTH = 1024 * 16;

	private static final long EXPIRE_TIME = 1000 * 60 * 60 * 24;

	private static final Pattern RANGE_PATTERN = Pattern
			.compile("bytes=(?<start>\\d*)-(?<end>\\d*)");

	/**
	 * 上传文件
	 */
	@RequestMapping(value = "/upload")
	public @ResponseBody Object upload(MultipartHttpServletRequest request,
			HttpServletResponse response) {
		logger.warn("开始上传=======");
		response.setContentType("text/plain; charset=UTF-8");
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			handler(request, response, result, CommonConstant.VIDEO_SRC);
		} catch (Exception e) {
			logger.warn("上传失败{}", e);
			return result;
		}
		return result;
	}

	/**
	 * 处理文件上传
	 * 
	 * @param result2
	 */
	public void handler(MultipartHttpServletRequest request,
			HttpServletResponse response, Map<String, Object> result,
			String folder) throws Exception {
		Date baseDate = new Date();
		String fileName = DateTimeUtil.parseDate(baseDate, "yyyyMMddHHmmss");
		MultipartFile file = request.getFile("file");
		if (file == null) {// step-2 判断file
			result.put("status", "0");
			result.put("msg", "文件为空！");
			return;
		}
		String orgFileName = file.getOriginalFilename();
		orgFileName = (orgFileName == null) ? "" : orgFileName;
		Pattern p = Pattern.compile("\\s|\t|\r|\n");
		Matcher m = p.matcher(orgFileName);
		orgFileName = m.replaceAll("_");
		String realFilePath = folder;
		if (!(new File(realFilePath).exists())) {
			new File(realFilePath).mkdirs();
		}
		String bigRealFilePath = realFilePath
				+ FilenameUtils.getBaseName(orgFileName).concat(".").concat(
						FilenameUtils.getExtension(orgFileName).toLowerCase());
		if (file.getSize() > 0) {
			File targetFile = new File(bigRealFilePath);
			file.transferTo(targetFile);// 写入目标文件
		}
		request.getSession().setAttribute("videoPath", bigRealFilePath);
		request.getSession().setAttribute("fileName", orgFileName);
		result.put("status", "1");
		result.put("msg", "上传成功");
		result.put("fileName", orgFileName);
	}

	/*
	 * @RequestMapping(value = "/getByName")
	 * 
	 * @ResponseBody public void show(@RequestParam("fileName") String fileName,
	 * HttpServletResponse response, HttpSession session) { if
	 * (session.getAttribute(CommonConstant.ENCRYPT_KEY) == null) { return; }
	 * String key = (String) session.getAttribute(CommonConstant.ENCRYPT_KEY);
	 * fileName = XXTeaUtil.Decrypt(fileName, key).trim(); long start =
	 * System.currentTimeMillis(); InputStream fis = null;
	 * response.setContentType("application/octet-stream; charset=utf-8"); if
	 * (StringUtils.isBlank(fileName)) { return; } OutputStream os = null; try {
	 * File file = FileUtils.getFile(fileName); os = response.getOutputStream();
	 * fis = FileUtils.openInputStream(file); int count = 0; byte[] buffer = new
	 * byte[1024 * 8]; while ((count = fis.read(buffer)) != -1) {
	 * os.write(buffer, 0, count); os.flush(); } os.flush(); } catch
	 * (IllegalStateException e) {
	 * 
	 * } catch (IOException e) { e.printStackTrace(); } finally { try { if (fis
	 * != null) { fis.close(); } if (os != null) { os.close(); }
	 * 
	 * } catch (IOException e) { e.printStackTrace(); } } long end =
	 * System.currentTimeMillis(); System.out.println("=====视频观看时间总共耗时====" +
	 * (end - start) + "ms"); }
	 */

	@RequestMapping(value = "/getByName")
	private void processRequest(@RequestParam("fileName") String fileName,
			final HttpServletRequest request,
			final HttpServletResponse response, HttpSession session) {
		logger.warn("读取文件，原始文件名为{}", fileName);
		try {
			if (session.getAttribute(CommonConstant.ENCRYPT_KEY) == null) {
				return;
			}
			String key = (String) session.getAttribute(CommonConstant.ENCRYPT_KEY);
			fileName = XXTeaUtil.Decrypt(fileName, key).trim();
			logger.warn("读取文件，真实文件名为{}", fileName);
			Path video = Paths.get(fileName);
			int length = (int) Files.size(video);
			int start = 0;
			int end = length - 1;
			String range = request.getHeader("Range");
			Matcher matcher = RANGE_PATTERN.matcher(range);
			if (matcher.matches()) {
				String startGroup = matcher.group("start");
				start = startGroup.isEmpty() ? start : Integer.valueOf(startGroup);
				start = start < 0 ? 0 : start;

				String endGroup = matcher.group("end");
				end = endGroup.isEmpty() ? end : Integer.valueOf(endGroup);
				end = end > length - 1 ? length - 1 : end;
			}
			int contentLength = end - start + 1;
			response.reset();
			response.setBufferSize(BUFFER_LENGTH);
			if (fileName.lastIndexOf("/") < 0) {
				return;
			}
			response.setHeader(
					"Content-Disposition",
					String.format("inline;filename=\"%s\"",
							fileName.substring(fileName.lastIndexOf("/"))));
			response.setHeader("Accept-Ranges", "bytes");
			response.setDateHeader("Last-Modified", Files
					.getLastModifiedTime(video).toMillis());
			response.setDateHeader("Expires", System.currentTimeMillis()
					+ EXPIRE_TIME);
			response.setContentType(Files.probeContentType(video));
			response.setHeader("Content-Range",
					String.format("bytes %s-%s/%s", start, end, length));
			response.setHeader("Content-Length", String.format("%s", contentLength));
			response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
			int bytesRead;
			int bytesLeft = contentLength;
			ByteBuffer buffer = ByteBuffer.allocate(BUFFER_LENGTH);
			try (SeekableByteChannel input = Files.newByteChannel(video, READ);
					OutputStream output = response.getOutputStream()) {
				input.position(start);
				while ((bytesRead = input.read(buffer)) != -1 && bytesLeft > 0) {
					buffer.clear();
					output.write(buffer.array(), 0,
							bytesLeft < bytesRead ? bytesLeft : bytesRead);
					bytesLeft -= bytesRead;
				}
			}
		} catch (Exception e) {
			logger.warn("读取异常{}",e);
		}
	}
}
