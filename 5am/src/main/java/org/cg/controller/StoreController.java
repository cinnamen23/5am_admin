package org.cg.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;
import org.cg.service.StoreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	private static final Logger logger = Logger.getLogger(StoreController.class);
	
	@Inject
	private StoreService service;
	
	@GetMapping("/login")
	public void loginGET(@ModelAttribute("dto") LoginDTO dto){
		
	}
	
	@PostMapping("/loginPost")
	public void loginPOST(LoginDTO dto,HttpSession session,Model model) throws Exception{
		
		logger.info("Login Post !!!!!!!!");
		
		StoreVO vo = service.login(dto);
		
		if(vo == null){
			return;
		}
		
		model.addAttribute("storeVO", vo);
		
		
	}
	
	@GetMapping("/storeregi")
	public void storeregiGET(){
		
	}
	
	
	
	
	
	
	
}
