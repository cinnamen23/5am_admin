package org.cg.controller;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.inject.Inject;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.tomcat.jni.Library;
import org.cg.domain.Criteria;
import org.cg.domain.LibraryVO;
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
	@GetMapping("/download")
	public ResponseEntity<byte[]> postDown (String lfileid) throws Exception{
		logger.info("download....");
		
		ResponseEntity<byte[]> entity= null;
		HttpHeaders headers = new HttpHeaders();
		
		InputStream in = new FileInputStream("C:\\zzz\\upload\\" + lfileid);

		
     	lfileid = lfileid.substring(lfileid.indexOf("_") + 1);
     	headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.add("Content-Disposition", "attatchment; filename=\"" + 
                 new String(lfileid.getBytes("UTF-8"), "ISO-8859-1") + "\"");
        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
        return entity;
	}
	
	

	@PostMapping("/view")
	public String PostView( Model model, LibraryVO vo, @RequestParam("file")MultipartFile file, @ModelAttribute("cri") Criteria cri, Integer lno)throws Exception{
		
		LibraryVO vo1=  service.read(vo.getLno());
		String lfileid = vo1.getLfileid();
		File file1 = new File("C:\\zzz\\upload\\"+lfileid);
		file1.delete();
		
		vo.setLfile(file.getOriginalFilename());
		UUID uid = UUID.randomUUID();
		String uidStr= uid.toString();
	    String saveName= uidStr+"_"+file.getOriginalFilename();
	    	logger.info( "getName: "+file.getName());
	    	logger.info( "getOriginalFilename: "+file.getOriginalFilename());
	    	logger.info( "size: "+file.getSize());
		IOUtils.copy(file.getInputStream(), new FileOutputStream("C:\\zzz\\upload\\"+saveName));
		vo.setLfileid(saveName);
		service.update(vo);
		
		return "redirect:/library/list?page="+cri.getPage()+"&bno="+vo.getLno()+"&type="+cri.getType();
	}
	
	
	@GetMapping("/update")
	public void getUpdate(@ModelAttribute("cri") Criteria cri, Model model, Integer lno) throws Exception{
		LibraryVO library= service.read(lno);
		model.addAttribute("lib",library);
	}
	
	@PostMapping("/delete")
	public String postDelete(Integer lno) throws Exception{
		LibraryVO vo=  service.read(lno);
		String lfileid = vo.getLfileid();
		File file = new File("C:\\zzz\\upload\\"+lfileid);
		file.delete();
		
		service.delete(lno);
		return "redirect:/library/list";
	}
	
    @Transactional
	@PostMapping("/regi")
	public String postRegi(@ModelAttribute LibraryVO vo,  @RequestParam("file")MultipartFile file) throws Exception{
		logger.info("hh"+file.getOriginalFilename());
		vo.setLfile(file.getOriginalFilename());
		UUID uid = UUID.randomUUID();
		String uidStr= uid.toString();
	    String saveName= uidStr+"_"+file.getOriginalFilename();
	    	logger.info( "getName: "+file.getName());
	    	logger.info( "getOriginalFilename: "+file.getOriginalFilename());
	    	logger.info( "size: "+file.getSize());
		IOUtils.copy(file.getInputStream(), new FileOutputStream("C:\\zzz\\upload\\"+saveName));
		
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
