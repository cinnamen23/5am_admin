package org.cg.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;
import org.cg.domain.StoreVO;
import org.cg.service.MemberService;
import org.cg.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {
	Logger logger= Logger.getLogger(IndexController.class);
	
	@Inject
	MemberService service;
	
	@Inject
	NoticeService nservice;
	
	@GetMapping
	public void getIndex(HttpSession session, Model model){
		try{			
		Object obj = session.getAttribute("login");
		StoreVO vo = (StoreVO) obj;
		NoticeVO nvo = new NoticeVO();
		List<NoticeVO> list = nservice.index(nvo);
		Criteria cri =  new Criteria();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cri", cri);
		map.put("vo", vo);
		
		model.addAttribute("totalCount", service.totalCount(map));
		model.addAttribute("qzeroCount", service.qzeroCount(map));

		model.addAttribute("list", list);
		}catch(Exception e){
			
		}
		
		



	}
	
	
	

}
