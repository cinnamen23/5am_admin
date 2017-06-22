package org.cg.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.cg.domain.AdGifVO;
import org.cg.domain.AdImageVO;
import org.cg.domain.ElevatorVO;
import org.cg.domain.StoreVO;
import org.cg.service.ADMakerService;
import org.cg.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admaker")
public class ADMakerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ADMakerController.class);
	
	@Inject
	ADMakerService service;

	@Inject
	StoreService sservice;
	
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
	@RequestMapping(value = "/adgif", method = RequestMethod.POST, produces = "application/json")
	public String adgif(@RequestParam("giffile") String giffile,AdGifVO vo) throws Exception {		
			    
		        StoreVO svo = sservice.storeRead(vo.getSid());
		        logger.info("광고 등록 ");
		        
		        List<ElevatorVO> list =  service.getElevator(svo, vo);
		        
		        Decoder decoder = Base64.getDecoder();

		        byte[] decodedBytes2 = decoder.decode(giffile);

		        String saveName = vo.getSid()+ ".gif";
		        
		        List<String> targetList = new ArrayList<String>();
		        targetList.add(vo.getTarget1());
		        targetList.add(vo.getTarget2());
		        targetList.add(vo.getTarget3());
		        targetList.add(vo.getTarget4());
		        
		        File savegif = new File("c:\\zzz\\5am\\ad_gif_all",saveName);
		        FileCopyUtils.copy(decodedBytes2, savegif);
		        
		        
		        for (ElevatorVO elevatorVO : list) {
		        	
		        	for(int i=0; i<=3; i++){
		        		if(targetList.get(i)!=null){
		        		File targeti = new File("c:\\zzz\\5am\\"+elevatorVO.getElvname()+"\\"+targetList.get(i),saveName);
				        FileCopyUtils.copy(decodedBytes2, targeti);
		        		}
		        	}
					
				}
		     
		        service.gifInsert(saveName, vo);
		        
		return "success";

	}
	
	
	
	
	
	@ResponseBody
	@PostMapping("/delete")
	public String onepagedelete(@RequestParam("image") String image ) {		
			
				logger.info("delete one page!!!!!");
				//실제파일 지우기
		
				
				
		return image;

	}
	
	
	
	

	


}


