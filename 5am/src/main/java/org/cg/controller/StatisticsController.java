package org.cg.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.cg.domain.AdGifVO;
import org.cg.domain.StatisticsVO;
import org.cg.domain.StoreVO;
import org.cg.service.StatisticsService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {
	Logger logger= Logger.getLogger(QnaController.class);

	@Inject
	StatisticsService service;
	
	@GetMapping("/list")
	public void getStatistics(Model model, @ModelAttribute("statistics") StatisticsVO statistics, HttpSession session){
		Object obj = session.getAttribute("login");
		StoreVO svo = (StoreVO) obj;
		String sid= svo.getSid();
//더미데이터		
		List<StatisticsVO> list=service.getStatistics(sid);
		Gson gson= new Gson();
		String statisticsJson = gson.toJson(list);
		model.addAttribute("statistics",statisticsJson);
	}
	
	//타겟별 재생횟수
	@PostMapping("/scount")
	@ResponseBody
	public List<StatisticsVO> scount(String sid, String donutTerm){
		HashMap<String, String> donutMap = new HashMap<String, String>();
		donutMap.put("sid", sid);
		donutMap.put("donutTerm", donutTerm);
		
		List<StatisticsVO> voScount = service.getScount(donutMap);
		return voScount;
	}
	
	//평균감정변화
	@PostMapping("/emotion")
	@ResponseBody
	public StatisticsVO emotion(String sid,String BarTerm){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sid", sid);
		map.put("BarTerm", BarTerm);
		
		StatisticsVO voAvg = service.getAvg(map);
		return voAvg;
	}

	//하루당 재생횟수
	@PostMapping("/scountPerDay")
	@ResponseBody
	public List<StatisticsVO> perDay(String sid, String LineTerm){
		logger.info(LineTerm);
		HashMap<String, String> lineMap = new HashMap<String, String>();
		lineMap.put("sid", sid);
		lineMap.put("LineTerm", LineTerm);
		List<StatisticsVO> scountPerDay = service.getScountPerDay(lineMap);
		return scountPerDay;
		//statisticsvo쓰기 위해 이름 컬럼명 바꿈 = sno 날짜, sview 재생횟수
	}

	//일주일간 타겟별 하루의 재생횟수
	@PostMapping("/scountPerTarget")
	@ResponseBody
	public List<StatisticsVO> perTarget(String sid, Model model, String AreaTerm){
		AdGifVO ad= service.getTarget(sid);
		HashMap<String, Object> areaMap = new HashMap<String, Object>();
		areaMap.put("ad", ad);
		areaMap.put("AreaTerm", AreaTerm);
		
		List<StatisticsVO> scountPerTarget1 = service.getScountPerTarget1(areaMap);
//		List<StatisticsVO> scountPerTarget2 = service.getScountPerTarget2(ad);
//		List<StatisticsVO> scountPerTarget3 = service.getScountPerTarget3(ad);
//		List<StatisticsVO> scountPerTarget4 = service.getScountPerTarget4(ad);
//		logger.info("@@@1: "+scountPerTarget1);
//		logger.info("@@@2: "+scountPerTarget2);
//		logger.info("@@@3: "+scountPerTarget3);
//		logger.info("@@@4: "+scountPerTarget4);

		return scountPerTarget1;
	}
	
}
