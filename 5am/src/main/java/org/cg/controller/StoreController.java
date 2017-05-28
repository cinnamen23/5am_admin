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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

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
	
	@GetMapping("/logout")
	public String logoutGet(HttpSession session ){
		
		logger.info("logout get !!!!!");
		
		Object obj = session.getAttribute("login");
		
		if (obj != null) {
			StoreVO vo = (StoreVO) obj;
			session.removeAttribute("login");
			session.invalidate();
			
		
		}
		return "redirect:login";
		
	}
	
	@GetMapping("/storeregi")
	public void storeregiGet(){
		
		
	}
	
	@PostMapping("/storeregi")
	public String storeregiPost(StoreVO vo,@RequestParam("saddr1") String saddr1,@RequestParam("saddr3") String saddr3){
		
		logger.info("store register post!!!");
		logger.info(vo);
		logger.info(saddr1+" "+saddr3);
		
		String saddr = saddr1+" "+saddr3;
		
		vo.setSaddr(saddr);		
		
		service.storeregister(vo);
		
		return "redirect:login";
		
	}
	
	
}
