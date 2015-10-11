package com.itjoin.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.gridfs.GridFsOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/image/")
public class ImageController {

	@Autowired
	private GridFsOperations girdFsOoperations;

//	@RequestMapping(value = "show")
//	@ResponseBody
//	public void findFilesInGridFs(@RequestParam("fileName") String fileName,
//			HttpServletResponse response) {
//		InputStream fis = null;
//		response.setContentType("image/*");
//		OutputStream os = null;
//		GridFsResource[] txtFiles = girdFsOoperations.getResources(fileName);
//		if (txtFiles.length > 0) {
//			try {
//				fis = txtFiles[0].getInputStream();
//				os = response.getOutputStream();
//				int count = 0;
//				byte[] buffer = new byte[1024 * 8];
//				while ((count = fis.read(buffer)) != -1) {
//					os.write(buffer, 0, count);
//					os.flush();
//				}
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			} finally {
//				try {
//					fis.close();
//					os.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}

	@RequestMapping(value = "getByName")
	@ResponseBody
	public void showImage(@RequestParam("fileName") String fileName,
			HttpServletResponse response) {
		
		long start = System.currentTimeMillis();
		InputStream fis = null;
		response.setContentType("image/*");
		if(StringUtils.isBlank(fileName)){
			return ;
		}
		OutputStream os = null;
		try {
			File imageFile = FileUtils.getFile(fileName);
			fis = FileUtils.openInputStream(imageFile);
			os = response.getOutputStream();
			int count = 0;
			byte[] buffer = new byte[1024 * 8];
			while ((count = fis.read(buffer)) != -1) {
				os.write(buffer, 0, count);
				os.flush();
			}
		} catch (IllegalStateException e) {
			// e.printStackTrace();

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
		System.out.println("=====图片写出时间总共耗时===="+(end-start)+"ms");
	}

	
	
	@RequestMapping(value = "show")
	@ResponseBody
	public void findFilesInGridFs(@RequestParam("fileName") String fileName,
			HttpServletResponse response) throws FileNotFoundException {
		response.setContentType("image/*");
		OutputStream os = null;
		File f=new File(fileName);
		InputStream in = new FileInputStream(f);
			try {
				os = response.getOutputStream();
				int count = 0;
				byte[] buffer = new byte[1024 * 8];
				while ((count = in.read(buffer)) != -1) {
					os.write(buffer, 0, count);
					os.flush();
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					in.close();
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}
}
