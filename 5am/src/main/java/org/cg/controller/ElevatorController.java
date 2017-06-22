package org.cg.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.ElevatorVO;
import org.cg.domain.PageMaker;
import org.cg.service.ElevatorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/elevator")
public class ElevatorController {

	@Inject
	ElevatorService eservice;
	
	@GetMapping("/list")
	public void getRegi(@ModelAttribute("cri") Criteria cri, Model model){
		
		System.out.println("엘베리스트 ~~~~");
		
		List<ElevatorVO> list = eservice.getelvList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageMaker(cri, eservice.getElvCount(cri)));
		model.addAttribute("count", eservice.getElvCount(cri));
	}
	
	
	
	
	@PostMapping("/regi")
	@ResponseBody
	public void postRegi(@ModelAttribute("vo")ElevatorVO vo){
		
		System.out.println("등록 ~~~~");
		
		System.out.println(vo);
		
		
		
		eservice.insertElevator(vo);
		
		File directory = new File("C:\\zzz\\5am\\"+vo.getElvname());
		
		File directory1 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\male10");
		File directory2 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\male20");
		File directory3 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\male30");
		File directory4 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\male40");
		File directory5 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\male50");
		File directory6 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\male60");
		File directory7 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\female10");
		File directory8 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\female20");
		File directory9 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\female30");
		File directory10 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\female40");
		File directory11 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\female50");
		File directory12 = new File("C:\\zzz\\5am\\"+vo.getElvname()+"\\female60");
		
		directory.mkdirs();
		directory1.mkdirs();
		directory2.mkdirs();
		directory3.mkdirs();
		directory4.mkdirs();
		directory5.mkdirs();
		directory6.mkdirs();
		directory7.mkdirs();
		directory8.mkdirs();
		directory9.mkdirs();
		directory10.mkdirs();
		directory11.mkdirs();
		directory12.mkdirs();
		
		
	}
	
	
	
}
