package org.cg.controller;

import javax.inject.Inject;
import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.Criteria2;
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
	public void mainGet(@ModelAttribute("cri") Criteria cri,@ModelAttribute("cri2") Criteria2 cri2,Model model) {

		logger.info("get member list .....");

		model.addAttribute("list", service.listAll(cri));
		model.addAttribute("pageMaker", new PageMaker(cri, service.totalCount()));
		model.addAttribute("pageMaker2", new PageMaker2(cri2, service.qtotalCount()));
		
		model.addAttribute("qlist", service.qlistAll(cri2));
	}
	
	@GetMapping("/mquestionview")
	public void mquestionview(@ModelAttribute("cri") Criteria cri,Model model,MQuestionVO vo){
		
		logger.info("mquestionview get ......");
		logger.info(vo);
		logger.info(cri);
		
		vo = service.qread(vo.getMqno());
		model.addAttribute("vo", vo);	
		
	}
	
	@PostMapping("/modi")
	public String memberModi(MemberVO vo){
		logger.info("memberModi post ......");
		logger.info(vo);
		service.update(vo);
		
		return "redirect:list";
	}
	
	@PostMapping("/del")
	public String memberDel(MemberVO vo){
		logger.info("memberDel post ......");
		logger.info(vo);
		service.delete(vo);
		
		return "redirect:list";
	}
}
