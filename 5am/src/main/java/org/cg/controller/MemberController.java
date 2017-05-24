package org.cg.controller;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = Logger.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@GetMapping("/list")
	public void mainGet(Model model) {

		logger.info("get member list .....");

		model.addAttribute("list", service.listAll());
	}
}
