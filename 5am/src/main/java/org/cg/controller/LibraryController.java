package org.cg.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.LibraryVO;
import org.cg.domain.PageMaker;
import org.cg.service.LibraryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/library")
public class LibraryController {
	
	@Inject
	LibraryService service;
	Logger logger= Logger.getLogger(LibraryController.class);
	
	
	@GetMapping("/view")
	public void getView(@ModelAttribute("cri") Criteria cri, Integer lno, Model model)throws Exception{
		logger.info("hhhhi");
		LibraryVO library= service.read(lno);
		logger.info(library);
		model.addAttribute("lib",library);

	}
	
	
	@GetMapping("/list")
	public void getLibrary(@ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		List<LibraryVO> list=service.getList(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, service.getTotal(cri)));
		
		model.addAttribute("list",list);
	}
	

}
