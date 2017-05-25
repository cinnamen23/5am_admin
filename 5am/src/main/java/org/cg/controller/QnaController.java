package org.cg.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.PageMaker;
import org.cg.domain.QuestionVO;
import org.cg.service.QnaService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/qna")
public class QnaController {
	Logger logger= Logger.getLogger(QnaController.class);
	
	
	@Inject
	QnaService qservice;
	
	
	@GetMapping("/list")
	public void getQna(@ModelAttribute("cri") Criteria cri,Model model){
		
		logger.info("qna/list get..........");
		
		List<QuestionVO> list=qservice.getQList(cri);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",new PageMaker(cri, qservice.getTotal()));
		
	}
	
	
	@GetMapping("/qview")
	public void getQview(@ModelAttribute("cri") Criteria cri,QuestionVO vo,Model model){
		
		logger.info("qna/qview get..........");
		
		vo=qservice.qReadOne(vo);
		
		logger.info(vo);
		
		model.addAttribute("vo",vo);
		model.addAttribute("cri",cri);
		
	}
	
	@PostMapping("/qview")
	
	public String modiQuestion(QuestionVO vo,Criteria cri,RedirectAttributes rttr){
		
		logger.info("qna/qview post..........");
		
		logger.info(vo);
		
		qservice.qUpdate(vo);
		
		rttr. addAttribute("qno",vo.getQno());
		rttr. addAttribute("page",cri.getPage());
		rttr. addAttribute("type",cri.getType());       //없어서 안가나보다   
		rttr. addAttribute("keyword",cri.getKeyword()); //없어서 안가나보다
		
		return "redirect:qview";
		
	}
	
	
	@GetMapping("/delete")
	public String qDelete(QuestionVO vo){
		logger.info("delete get.................");
		logger.info(vo);
		
		qservice.qDelete(vo);
		
		
		return "redirect:list";
	}
	
	
	
	
	

}
