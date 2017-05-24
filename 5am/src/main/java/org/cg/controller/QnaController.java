package org.cg.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.QuestionVO;
import org.cg.service.QnaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna")
public class QnaController {
	Logger logger= Logger.getLogger(QnaController.class);
	
	
	@Inject
	QnaService service;
	
	
	@GetMapping("/list")
	public void getQna(Model model){
		
		List<QuestionVO> list=service.getQList();
		
		model.addAttribute("list",list);
		
	}
	

}
