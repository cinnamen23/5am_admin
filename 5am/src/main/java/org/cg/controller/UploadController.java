package org.cg.controller;

import java.io.FileInputStream;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/display")

public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@GetMapping(produces = { "image/jpg" })
	@ResponseBody
	public byte[] display(String fName) throws Exception {

		if (fName == "") {

			fName = "1.jpg";

		}
		FileInputStream fin = new FileInputStream("C:\\zzz\\5am\\" + fName);

		byte[] arr = IOUtils.toByteArray(fin);

		return arr;

	}
	
	@GetMapping(value={"/gif"}, produces = { "image/jpg" })
	@ResponseBody
	public byte[] display_ad_gif_all(String fName) throws Exception {
		
		logger.info("등록하신 광고 보여주기");

		if (fName == "") {

			fName = "1.jpg";

		}
		FileInputStream fin;
		try {
			fin = new FileInputStream("C:\\zzz\\5am\\ad_gif_all\\" + fName);
			byte[] arr = IOUtils.toByteArray(fin);
			return arr;
		} catch (Exception e) {
			fin = new FileInputStream("C:\\zzz\\5am\\ad_gif_all\\none.jpg");
			byte[] arr = IOUtils.toByteArray(fin);
			return arr;
		}
		
		
	}
	
	
}
