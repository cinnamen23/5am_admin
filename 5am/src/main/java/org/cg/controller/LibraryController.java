package org.cg.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/library")
public class LibraryController {
	Logger logger= Logger.getLogger(LibraryController.class);
	
	@GetMapping
	public void getLibrary(){
		
	}
	

}
