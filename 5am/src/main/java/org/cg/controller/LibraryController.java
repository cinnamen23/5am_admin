package org.cg.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;
import javax.inject.Inject;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.LibraryFileVO;
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
	
	
//수정
	@PostMapping("/view")
	public String PostView( Model model, LibraryVO vo, @RequestParam("file")MultipartFile[] file, @ModelAttribute("cri") Criteria cri, Integer lno)throws Exception{
//수정하기 위해 폴더에서 파일 삭제
		List<LibraryFileVO> deleteFileVO= service.readFile(lno);
		//폴더에서 파일 삭제
		for(int i=0;i<deleteFileVO.size();i++){
			String lfileid = deleteFileVO.get(i).getLfileid();
			File deleteFile = new File("C:\\zzz\\upload\\"+lfileid);
			deleteFile.delete();
		}
			
		//db에서 파일삭제
		service.deleteFile(lno);
		
    	//글등록
    	service.update(vo);
		
    	//파일등록
		for(int i=0;i<file.length;i++){
    		LibraryFileVO filevo= new LibraryFileVO();
			
			//lno등록
			filevo.setLno(vo.getLno());
    		
    		//filename 등록
	    	logger.info("hh"+file[i].getOriginalFilename());
	    	filevo.setLfilename(file[i].getOriginalFilename());
	    	
	    	//fileid 등록
	    	UUID uid = UUID.randomUUID();
			String uidStr= uid.toString();
		    String saveName= uidStr+"_"+file[i].getOriginalFilename();
		    	logger.info( "getName: "+file[i].getName());
		    	logger.info( "getOriginalFilename: "+file[i].getOriginalFilename());
		    	logger.info( "size: "+file[i].getSize());
			IOUtils.copy(file[i].getInputStream(), new FileOutputStream("C:\\zzz\\upload\\"+saveName));
			filevo.setLfileid(saveName);
			

			service.createFile(filevo);
    	}
		
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
		List<LibraryFileVO> filevo= service.readFile(lno);
		//폴더에서 파일 삭제
		for(int i=0;i<filevo.size();i++){
			String lfileid = filevo.get(i).getLfileid();
			File file = new File("C:\\zzz\\upload\\"+lfileid);
			file.delete();
		}
			
		//db에서 파일삭제
		service.deleteFile(lno);
		
		//글삭제
		
		service.delete(lno);
		return "redirect:/library/list";
	}
	
    @Transactional
	@PostMapping("/regi")
	public String postRegi(@ModelAttribute LibraryVO vo,  @RequestParam("file")MultipartFile[] file) throws Exception{
		
    	//글등록
    	service.create(vo);

    	for(int i=0;i<file.length;i++){
    		LibraryFileVO filevo= new LibraryFileVO();
			
			//lno등록
			filevo.setLno(vo.getLno());
    		
    		//filename 등록
	    	logger.info("hh"+file[i].getOriginalFilename());
	    	filevo.setLfilename(file[i].getOriginalFilename());
	    	
	    	//fileid 등록
	    	UUID uid = UUID.randomUUID();
			String uidStr= uid.toString();
		    String saveName= uidStr+"_"+file[i].getOriginalFilename();
		    	logger.info( "getName: "+file[i].getName());
		    	logger.info( "getOriginalFilename: "+file[i].getOriginalFilename());
		    	logger.info( "size: "+file[i].getSize());
			IOUtils.copy(file[i].getInputStream(), new FileOutputStream("C:\\zzz\\upload\\"+saveName));
			filevo.setLfileid(saveName);
			

			service.createFile(filevo);
    	}
		return "redirect:/library/list";
	}
	
	
	@GetMapping("/regi")
	public void getRegi(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
	}
	
	@Transactional
	@GetMapping("/view")
	public void getView(@ModelAttribute("cri") Criteria cri, Integer lno, Model model)throws Exception{
		LibraryVO library= service.read(lno);
		List<LibraryFileVO> file= service.readFile(library.getLno());
		
		service.updateHit(library);
		model.addAttribute("lib",library);
		model.addAttribute("file",file);
	}
	
	
	@GetMapping("/list")
	public void getLibrary(@ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		List<LibraryVO> list=service.getList(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, service.getTotal(cri)));
		
		model.addAttribute("list",list);
	}
	

}
