package org.cg.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;
import org.cg.domain.PageMaker;
import org.cg.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Inject
	NoticeService nservice;
	
	Logger logger= Logger.getLogger(NoticeController.class);
	
	@GetMapping("/list")
	public void getNotice(@ModelAttribute("cri") Criteria cri,Model model){
		
		try {
			List<NoticeVO> list = nservice.getList(cri);
			
			logger.info(list);
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageMaker(cri, nservice.count()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	

}
