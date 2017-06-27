package org.cg.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.cg.domain.StatisticsVO;
import org.cg.service.StatisticsService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/display")

public class UploadController {
	
	@Inject
	StatisticsService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@GetMapping(produces = { "image/jpg" })
	@ResponseBody
	public byte[] display(String fName) throws Exception {

		if (fName == "") {

			fName = "1.jpg";

		}
		FileInputStream fin = new FileInputStream("C:\\zzz\\5am\\" + fName);

		byte[] arr = IOUtils.toByteArray(fin);

		return arr;

	}
	
	@GetMapping(value={"/gif"}, produces = { "image/jpg" })
	@ResponseBody
	public byte[] display_ad_gif_all(String fName) throws Exception {
		
		logger.info("등록하신 광고 보여주기");

		if (fName == "") {

			fName = "1.jpg";

		}
		FileInputStream fin;
		try {
			fin = new FileInputStream("C:\\zzz\\5am\\ad_gif_all\\" + fName);
			byte[] arr = IOUtils.toByteArray(fin);
			return arr;
		} catch (Exception e) {
			fin = new FileInputStream("C:\\zzz\\5am\\ad_gif_all\\none.jpg");
			byte[] arr = IOUtils.toByteArray(fin);
			return arr;
		}
		
		
	}
	
	@PostMapping("/list")
	public void stastics(MultipartFile file, @RequestParam("a")String a){
		logger.info(file.getOriginalFilename());
		logger.info("hhhhhhhhh"+file.getOriginalFilename());
		
		logger.info(""+file);
	
		
		String timeStamp = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
		try {
			IOUtils.copy(file.getInputStream(), new FileOutputStream("C:\\zzz\\5am\\"+timeStamp+"_"+a+".json"));
		} catch (Exception e){
			
		}
		
		JSONParser parser = new JSONParser();
		
		
		try {
			Object obj = parser.parse(new FileReader("C:\\zzz\\5am\\"+timeStamp+"_"+a+".json"));
			JSONObject jsonObject = (JSONObject) obj;
			List<String> arr2 = new ArrayList<String>();
			logger.info(""+jsonObject);
			Set<String> arr=jsonObject.keySet();
			for(String i: arr){
				arr2.add(i);
			}
			
			
			logger.info(""+arr2);
			
			
			for(int i=0; i<arr.size(); i++){
				logger.info(""+i);
				StatisticsVO vo = new StatisticsVO();
				JSONObject js = (JSONObject) jsonObject.get(arr2.get(i));
				logger.info(""+js);
				
				vo.setSid((arr2.get(i).split("_")[0]));
				vo.setTarget((arr2.get(i).split("_")[1]));
				vo.setSurprise(js.get("surprise").toString());
				vo.setContempt((js.get("contempt").toString()));
				vo.setScount((js.get("count").toString()));
				vo.setNeutral((js.get("neutral").toString()));
				vo.setSadness((js.get("sadness").toString()));
				vo.setDisgust((js.get("disgust").toString()));
				vo.setHappiness((js.get("happiness").toString()));
				vo.setAnger((js.get("anger").toString()));
				vo.setFear((js.get("fear").toString()));
				vo.setSview((js.get("view").toString()));
				
				logger.info(""+vo);
				logger.info(vo.getSadness());
				service.insert(vo);
				
				
				
				
			}
			
						
			
		} catch (Exception e) {
		
		}
		 
		



	}
	
	
}
