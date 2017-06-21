package org.cg.controller;

import java.io.File;

import javax.inject.Inject;

import org.cg.domain.ElevatorVO;
import org.cg.service.ElevatorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/elevator")
public class ElevatorController {

	@Inject
	ElevatorService eservice;
	
	@GetMapping("/list")
	public void getRegi(){
		
	}
	
	@PostMapping("/list")
	public void postRegi(@ModelAttribute("vo")ElevatorVO vo){
		
		
		
		eservice.insertElevator(vo);
		
		File directory = new File("C:\\zzz\\5am\\"+vo.getELVNAME());
		
		File directory1 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\male10");
		File directory2 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\male20");
		File directory3 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\male30");
		File directory4 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\male40");
		File directory5 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\male50");
		File directory6 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\male60");
		File directory7 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\female10");
		File directory8 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\female20");
		File directory9 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\female30");
		File directory10 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\female40");
		File directory11 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\female50");
		File directory12 = new File("C:\\zzz\\5am\\"+vo.getELVNAME()+"\\female60");
		
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
