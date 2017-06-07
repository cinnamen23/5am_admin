package org.cg.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.cg.domain.AdImageVO;
import org.cg.service.ADMakerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admaker")
public class ADMakerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ADMakerController.class);
	
	@Inject
	ADMakerService service;

	@GetMapping("/list")
	public void list(){
	}
	


	@ResponseBody
    @PostMapping("/onepage")
    public String onepage(@RequestParam("image") String image,String sid ) throws IOException {        
            
                logger.info("get jpg!!!!!");
                
                AdImageVO vo=new AdImageVO()  ;
                
                
                Decoder decoder = Base64.getDecoder();

                byte[] decodedBytes2 = decoder.decode(image);

                UUID uid=UUID.randomUUID();
            
                String saveName =sid+"_"+uid.toString() +".jpg";
             
                File target1 = new File("c:\\zzz\\5am\\onepage",saveName);
                
                FileCopyUtils.copy(decodedBytes2, target1);     
                
                vo.setImid(saveName);
                
                //파일저장
                service.ImgInsert(vo, sid);
                
                
                
        return image;

    }
	
	
	

	@ResponseBody
	@PostMapping("/adgif")
	public String adgif(@RequestParam("giffile") String giffile,String sid) throws Exception {		
			
				logger.info("gifgifgifigfig");
		
				UUID uid = UUID.randomUUID();
				
				logger.info(giffile);
				
				Decoder decoder = Base64.getDecoder();

		        byte[] decodedBytes2 = decoder.decode(giffile);

		        String saveName = sid +".gif";
		     
		        File target1 = new File("c:\\zzz\\5am\\adgif",saveName);
		        
		        FileCopyUtils.copy(decodedBytes2, target1);  
				
		        service.gifInsert(saveName, sid);
				
		return giffile;

	}
	
	
	
	
	
	@ResponseBody
	@PostMapping("/delete")
	public String onepagedelete(@RequestParam("image") String image ) {		
			
				logger.info("delete one page!!!!!");
				//실제파일 지우기
		
				
				
		return image;

	}
	
	
	
	

	


}


