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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			model.addAttribute("pageMaker", new PageMaker(cri, nservice.count(cri)));
			model.addAttribute("count", nservice.count(cri));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	

	
	@GetMapping("/nview")
	public void view(@ModelAttribute("vo") NoticeVO vo,Model model){
		try {
			if (vo.getNtitle() != null) {
				model.addAttribute("update", "success");
				nservice.update(vo);
			}
			Criteria cri = new Criteria();
			NoticeVO read = nservice.getRead(vo);
			model.addAttribute("read", read);
			model.addAttribute("cri", cri);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GetMapping("/regi")
	public void regi(){
	}
	
	@PostMapping("/regi")
	public String registerPost(NoticeVO vo, RedirectAttributes rttr) {

		try {
			if (vo.getNtitle() == "" || vo.getNcontent() == "" || vo.getNwriter() == "") {
				rttr.addFlashAttribute("fail", "fail");
				return "redirect:/notice/regi";
			} else {
				nservice.register(vo);
				rttr.addFlashAttribute("msg", "success");

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/notice/list";

	}
	
	@GetMapping("/update")
	public void update(@ModelAttribute("vo") NoticeVO vo,Model model){
		
		NoticeVO read;
		Criteria cri = new Criteria();
		try {
			read = nservice.getRead(vo);
			model.addAttribute("read", read);
			model.addAttribute("cri", cri);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	
	@PostMapping("/update")
	public void updatePost(NoticeVO vo, RedirectAttributes rttr){
		
	
			if (vo.getNtitle() == "" || vo.getNcontent() == "" || vo.getNwriter() == "") {
				rttr.addFlashAttribute("fail", "fail");
				
			} else {
				try {
					nservice.update(vo);
					rttr.addFlashAttribute("msg", "success");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				



}
	}
	
	@GetMapping("/delete")
	public String delete(NoticeVO vo,RedirectAttributes rttr){
		try {
			nservice.delete(vo);
			rttr.addFlashAttribute("delete", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/notice/list";
	}
	
}
