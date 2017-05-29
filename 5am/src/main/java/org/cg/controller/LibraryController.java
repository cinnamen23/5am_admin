package org.cg.controller;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.LibraryVO;
import org.cg.domain.MediaUtils;
import org.cg.domain.PageMaker;
import org.cg.service.LibraryService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/library/*")
@Controller
public class LibraryController {
	
	Logger logger= Logger.getLogger(LibraryController.class);

	@Inject
	LibraryService service;
	
	
	@ResponseBody
	@PostMapping("/display")
	public ResponseEntity<byte[]> postDisplay (String lfileid) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity= null;
		logger.info("id======================= "+lfileid);
		
	    try {
            String formatName = lfileid.substring(lfileid.lastIndexOf("." ) + 1);
            MediaType mType = MediaUtils.getMediaType(formatName);
            
            HttpHeaders headers = new HttpHeaders();
            
            in = new FileInputStream("C:\\zzz\\upload\\" + lfileid);
            
            if (mType != null) {
                headers.setContentType(mType);
            } else {
            	lfileid = lfileid.substring(lfileid.indexOf("_") + 1);
            	headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.add("Content-Disposition", "attatchment; filename=\"" + 
                        new String(lfileid.getBytes("UTF-8"), "ISO-8859-1") + "\"");
            }
            
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
        } catch(Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close();
        }
        
        return entity;



		
	}
	
	
	@PostMapping("/update")
	public String postUpdate( Model model, LibraryVO vo) throws Exception{
		logger.info(vo);
		service.update(vo);
		return "redirect:/library/list";
	}
	
	@GetMapping("/update")
	public void getUpdate(@ModelAttribute("cri") Criteria cri, Model model, Integer lno) throws Exception{
		LibraryVO library= service.read(lno);
		model.addAttribute("lib",library);
	}
	
	@PostMapping("/delete")
	public String postDelete(Integer lno) throws Exception{
		service.delete(lno);
		return "redirect:/library/list";
	}
	
    @Transactional
	@PostMapping("/regi")
	public String postRegi(@ModelAttribute LibraryVO vo,  @RequestParam("file")MultipartFile file) throws Exception{
		logger.info("hh"+file.getOriginalFilename());
		vo.setLfile(file.getOriginalFilename());
		
//파일 업로드 = 특정 위치에 파일 복사
		UUID uid = UUID.randomUUID();
		 String uidStr= uid.toString();
	     String saveName= uidStr+"_"+file.getOriginalFilename();
	    	logger.info( "getName: "+file.getName());
	    	logger.info( "getOriginalFilename: "+file.getOriginalFilename());
	    	logger.info( "size: "+file.getSize());
		IOUtils.copy(file.getInputStream(), new FileOutputStream("C:\\zzz\\upload\\"+saveName));
		BufferedImage src = ImageIO.read(file.getInputStream());
		
		
		vo.setLfileid(saveName);
		//글등록
		service.create(vo);
		
		return "redirect:/library/list";
	}
	
	
	@GetMapping("/regi")
	public void getRegi(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
	}
	
	
	@GetMapping("/view")
	public void getView(@ModelAttribute("cri") Criteria cri, Integer lno, Model model)throws Exception{
		LibraryVO library= service.read(lno);
		service.updateHit(library);
		model.addAttribute("lib",library);

	}
	
	
	@GetMapping("/list")
	public void getLibrary(@ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		List<LibraryVO> list=service.getList(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, service.getTotal(cri)));
		
		model.addAttribute("list",list);
	}
	

}
