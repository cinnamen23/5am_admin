package org.cg.controller;

import java.io.FileInputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UploadController {

	@GetMapping(name = "/display", produces = { "image/jpg" })
	@ResponseBody
	public byte[] display(String fName) throws Exception {

		FileInputStream fin = new FileInputStream("C:\\zzz\\5am\\" + fName);

		byte[] arr = IOUtils.toByteArray(fin);

		return arr;

	}

}
