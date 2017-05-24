package org.cg.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admaker")
public class AdmakerController {
	Logger logger= Logger.getLogger(AdmakerController.class);
	
	@GetMapping("/list")
	public void getAdmaker(){
		
	}
	

}
