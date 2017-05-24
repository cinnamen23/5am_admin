package org.cg.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	Logger logger= Logger.getLogger(MemberController.class);
	
	@GetMapping("/list")
	public void getCustomer(){
		
	}
	

}
