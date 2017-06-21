package org.cg.controller;
import java.util.Date;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.PageMaker;
import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;
import org.cg.service.StoreService;
import org.cg.util.SendEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	private static final Logger logger = Logger.getLogger(StoreController.class);
	private static final String LOGIN = "login";
	
	@Inject
	private StoreService service;
	
	
	@GetMapping("/login")
	public void loginGET(){
	
	}
	
	@PostMapping("/loginPost")
	public void loginPOST(LoginDTO dto,HttpSession session, Model model) throws Exception{
		
		logger.info("==============================================================================");
		logger.info("Login Post !!!!!!!!");
		logger.info(dto);
		
		StoreVO vo = service.login(dto);
		
		if(vo == null){
			return;
		}
		
		model.addAttribute("storeVO", vo);
		
		if(dto.isUseCookie()){
			
			int amount = 60*60*24*7;			
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			
			service.keepLogin(vo.getSid(), session.getId(), sessionLimit);
			
		}
		
	}
	
	@GetMapping("/logout")
	public String logoutGet(HttpSession session, RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response ){
		
		logger.info("logout ......");
		
		Object obj = session.getAttribute(LOGIN);
		
		if (obj != null) {
			StoreVO vo = (StoreVO) obj;
			session.removeAttribute(LOGIN);
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");			
			
			if (loginCookie !=null) {
				
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getSid(), session.getId(), new Date());
			}
			rttr.addFlashAttribute("logoutmsg","success");
		}
		return "redirect:login";
		
	}
	
	@GetMapping("/storeregi")
	public void storeregiGet(){
		
		
	}
	
	@PostMapping("/storeregi")

	public String storeregiPost(StoreVO vo,@RequestParam("saddr1") String saddr1,@RequestParam("saddr3") String saddr3,@RequestParam("lat")String lat,@RequestParam("lng")String lng, RedirectAttributes rttr){
		logger.info(lat);

		logger.info("store register post!!!");
		
		logger.info(vo);
		
		vo.setSaddrm(saddr1);
		vo.setSaddr(saddr3);		
		
		service.storeRegister(vo);
		rttr.addFlashAttribute("sregimsg","success");
		
		return "redirect:login";
		
	}
	
	@GetMapping("/storemodi")
	public void imodiGet(HttpSession session, Model model){
		
		Object obj = session.getAttribute(LOGIN);
		StoreVO vo = (StoreVO) obj;
		
		model.addAttribute("vo", vo);
	
	}
	
	@PostMapping("/storemodi")
	public String storemodiPost(HttpSession session ,StoreVO vo,@RequestParam("saddr1") String saddr1,@RequestParam("saddr3") String saddr3,@RequestParam("lat")String lat,@RequestParam("lng")String lng, RedirectAttributes rttr){
		logger.info("----------------------------------------------------------");
		logger.info("storemodi post !!!!!!!!!!!!!!!!!!!!!!!");
		
		vo.setSaddrm(saddr1);
		vo.setSaddr(saddr3);	
		
		service.storeModify(vo);
		session.setAttribute(LOGIN, vo);
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:../index";
	}
	
	@GetMapping("/forgotid")
	public void forgotidGet ()throws Exception{
		
	}
	
	@PostMapping("/forgotid")
	public String forgotidPost (String sname, String semail, StoreVO vo,RedirectAttributes rttr) throws Exception{
		logger.info("forgotid@@");
		logger.info(sname);
		logger.info(semail);
		
		try {
			vo = service.findId(sname, semail);
			
			SendEmail mail = new SendEmail();
			
			mail.send("5AM에서 요청하신 아이디 입니다.", vo.getSemail(), vo.getSid());
			
			rttr.addFlashAttribute("sendId","success");
			return "redirect:login";
			
		} catch (Exception e) {
			
			rttr.addFlashAttribute("sendId","fail");
			return "redirect:forgotid";

		}
	}
	
	@GetMapping("/forgotpw")
	public void forgotpwGet ()throws Exception{
		
	}
	
	@PostMapping("/forgotpw")
	public String forgotpwPost (String sid, String semail,StoreVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("forgotpw@@");
		logger.info(sid);
		logger.info(semail);
		try {
			vo = service.findPw(sid, semail);
			
			SendEmail mail = new SendEmail();
			
			mail.send("5AM에서 요청하신 비밀번호 입니다.", vo.getSemail(), vo.getSpw());
			
			rttr.addFlashAttribute("sendPw","success");
			return "redirect:login";
			
		} catch (Exception e) {
			rttr.addFlashAttribute("sendPw","fail");
			return "redirect:forgotpw";
		}
		
	}
	

	
	@GetMapping("/list")
	public void listGet(@ModelAttribute("cri") Criteria cri, Model model, HttpSession session) {

		logger.info(".......store list .....");
		logger.info(cri);
		
		
		Object obj = session.getAttribute("login");
		StoreVO vo = (StoreVO) obj;
		
		logger.info(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("vo", vo);
		
		model.addAttribute("list", service.storeList(cri));
		model.addAttribute("pageMaker", new PageMaker(cri, service.storeTotal(cri)));
	}
	
	@PostMapping("/del")
	public String delPost(String sid, RedirectAttributes rttr){
		
		logger.info("del store");
		service.storeDel(sid);
		rttr.addFlashAttribute("msg","success");


		return "redirect:list";
		
	}
	
	@GetMapping("/modi")
	public void modiGet(String sid, Model model, Criteria cri){
		
		logger.info("modi store get");
		
		StoreVO vo = service.storeRead(sid);
		model.addAttribute("vo", vo);
		model.addAttribute("cri",cri);
		
	}
	
	
	@PostMapping("/modi")
	public String modiPost(StoreVO vo,@RequestParam("saddr1") String saddr1, @RequestParam("saddr3") String saddr3, Criteria cri, RedirectAttributes rttr){
		
		logger.info("modi store post");
				
		vo.setSaddrm(saddr1);
		vo.setSaddr(saddr3);

		service.storeModify(vo);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:list";
		
	}
	
	
	
	
}
