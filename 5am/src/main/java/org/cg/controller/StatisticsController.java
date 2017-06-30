package org.cg.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.cg.domain.AdGifVO;
import org.cg.domain.StatisticsVO;
import org.cg.domain.StoreVO;
import org.cg.service.StatisticsService;
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
	
	@PostMapping("/scount")
	@ResponseBody
	public List<StatisticsVO> scount(String sid){
		//타겟별 재생횟수
		List<StatisticsVO> voScount = service.getScount(sid);
		return voScount;
	}
	
	@PostMapping("/emotion")
	@ResponseBody
	public StatisticsVO emotion(String sid){
		//평균감정변화
		StatisticsVO voAvg = service.getAvg(sid);
		
		return voAvg;
	}

	@PostMapping("/scountPerDay")
	@ResponseBody
	public List<StatisticsVO> perDay(String sid){
		//하루당 재생횟수
		List<StatisticsVO> scountPerDay = service.getScountPerDay(sid);
		return scountPerDay;
		//statisticsvo쓰기 위해 이름 컬럼명 바꿈 = sno 날짜, sview 재생횟수
	}

	@PostMapping("/scountPerTarget")
	@ResponseBody
	public List<StatisticsVO> perTarget(String sid){
		//일주일간 타겟별 하루의 재생횟수
		AdGifVO ad= service.getTarget(sid);
		List<StatisticsVO> scountPerTarget1 = service.getScountPerTarget1(ad);
		List<StatisticsVO> scountPerTarget2 = service.getScountPerTarget2(ad);
		List<StatisticsVO> scountPerTarget3 = service.getScountPerTarget3(ad);
		List<StatisticsVO> scountPerTarget4 = service.getScountPerTarget4(ad);
		logger.info("@@@1: "+scountPerTarget1);
		logger.info("@@@2: "+scountPerTarget2);
		logger.info("@@@3: "+scountPerTarget3);
		logger.info("@@@4: "+scountPerTarget4);

		return scountPerTarget1;
	}
	
}
