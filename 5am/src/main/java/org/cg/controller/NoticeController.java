package org.cg.controller;

import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;
import org.cg.domain.PageMaker;
import org.cg.service.NoticeService;
import org.imgscalr.Scalr;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Inject
	NoticeService nservice;
	
	private static final Logger logger = Logger.getLogger(NoticeController.class);
	
	@GetMapping("/list")
	public void getNotice(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		
			List<NoticeVO> list = nservice.getList(cri);
			logger.info(list);
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageMaker(cri, nservice.count(cri)));
			model.addAttribute("count", nservice.count(cri));
		
	}
	
	@GetMapping("/nview")
	public void view(NoticeVO vo, Model model, Criteria cri) throws Exception{
			
			if (vo.getNtitle() != null) {
				model.addAttribute("update", "success");
				nservice.update(vo);
			}
			
			NoticeVO read = nservice.getRead(vo);
			nservice.updateHit(vo);
			model.addAttribute("vo",vo);
			model.addAttribute("read", read);
			model.addAttribute("cri", cri);
			
		
	}
	
	@GetMapping("/regi")
	public void regi(){
	}
	
	@PostMapping("/regi")
	public String registerPost(@ModelAttribute("vo")NoticeVO vo, RedirectAttributes rttr, @RequestParam("file")MultipartFile file) throws Exception {
		
			
			
			if (vo.getNtitle() == "" || vo.getNcontent() == "" || vo.getNwriter() == ""|| vo.getNimage() =="") {
				rttr.addFlashAttribute("fail", "fail");
				
				return "redirect:regi";
				
			} else {
				
				UUID uid = UUID.randomUUID();
				
				String fileName=file.getOriginalFilename();
				
				String fpohto=uid+fileName;
				String spohto="_"+uid+fileName;
				
				
				IOUtils.copy(file.getInputStream(), new FileOutputStream("C:\\zzz\\5am\\"+fpohto));
				
				BufferedImage src= ImageIO.read(file.getInputStream());
				
				BufferedImage thumb = Scalr.resize(src,Scalr.Method.ULTRA_QUALITY,Scalr.Mode.FIT_TO_HEIGHT,100);
				
				ImageIO.write(thumb,"jpg", new FileOutputStream("C:\\zzz\\5amresize\\"+spohto));
				
				vo.setNimage(fpohto);
				nservice.register(vo);
				rttr.addFlashAttribute("msg", "success");

			}
		
		return "redirect:list";

	}
	
	@GetMapping("/update")
	public void update(@ModelAttribute("vo") NoticeVO vo,Model model) throws Exception{
		
			NoticeVO read=nservice.getRead(vo);
			Criteria cri = new Criteria();
	
			model.addAttribute("read", read);
			model.addAttribute("cri", cri);
		
	}
	
	@PostMapping("/update")
	public void updatePost(NoticeVO vo, RedirectAttributes rttr, @RequestParam("file") MultipartFile file) throws Exception{
		
			
				
					logger.info("hhhhhhhhh"+file.getOriginalFilename());
					
					UUID uid = UUID.randomUUID();
					
					String fileName=file.getOriginalFilename();
					
					String fpohto=uid+fileName;
					String spohto="_"+uid+fileName;

					IOUtils.copy(file.getInputStream(), new FileOutputStream("C:\\zzz\\5am\\"+fpohto));
					
					BufferedImage src= ImageIO.read(file.getInputStream());
					
					BufferedImage thumb = Scalr.resize(src,Scalr.Method.ULTRA_QUALITY,Scalr.Mode.FIT_TO_HEIGHT,100);
					
					ImageIO.write(thumb,"jpg", new FileOutputStream("C:\\zzz\\5amresize\\"+spohto));
					
					vo.setNimage(fpohto);
					
					nservice.uploadImage(vo);

	}
	
	
	@GetMapping("/delete")
	public String delete(NoticeVO vo, RedirectAttributes rttr) throws Exception{
		
			nservice.delete(vo);
		
			rttr.addFlashAttribute("delete", "success");
		
		return "redirect:list";
	}
	
	
}

