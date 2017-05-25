package org.cg.controller;

import javax.inject.Inject;
import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.Criteria2;
import org.cg.domain.MAnswerVO;
import org.cg.domain.MQuestionVO;
import org.cg.domain.MemberVO;
import org.cg.domain.PageMaker;
import org.cg.domain.PageMaker2;
import org.cg.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = Logger.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@GetMapping("/list")
	public void mainGet(@ModelAttribute("cri") Criteria cri,@ModelAttribute("cri2") Criteria2 cri2, Model model) {

		logger.info(".......get member list .....");
		logger.info(cri);
		
		model.addAttribute("list", service.listAll(cri));
		model.addAttribute("pageMaker", new PageMaker(cri, service.totalCount(cri)));
		model.addAttribute("pageMaker2", new PageMaker2(cri2, service.qtotalCount(cri2)));
		
		model.addAttribute("qlist", service.qlistAll(cri2));
	}
	
	
	
	@PostMapping("/modi")
	public String memberModi(MemberVO vo){
	
		service.update(vo);
		
		return "redirect:list";
	}
	
	@PostMapping("/del")
	public String memberDel(MemberVO vo){
		
		logger.info(".......member delete .......");
	
		service.delete(vo);
		
		return "redirect:list";
	}
	
	@GetMapping("/mquestionview")
	public void mquestionview(@ModelAttribute("cri") Criteria cri,@ModelAttribute("cri2") Criteria2 cri2,Model model,MQuestionVO vo,MAnswerVO avo){
		
		logger.info(".......mquestionview get ......");
				
		model.addAttribute("vo", service.qread(vo.getMqno()));
		model.addAttribute("avo", service.aread(vo.getMqno()));

		model.addAttribute("cri", cri);
		model.addAttribute("cri2", cri2);
		
		
	}
	
	@PostMapping("/mquestiondel")
	public String mquestiondel(MQuestionVO vo){
		
		logger.info(".......mquestion delete .......");
	
		service.qdelete(vo);
		
		return "redirect:list";
	}
}
