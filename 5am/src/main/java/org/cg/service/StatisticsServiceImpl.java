package org.cg.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.cg.domain.AdGifVO;
import org.cg.domain.StatisticsVO;
import org.cg.persistence.StatisticsDAO;
import org.springframework.stereotype.Service;
@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Inject
	StatisticsDAO dao;

	@Override
	public void insert(StatisticsVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<StatisticsVO> getStatistics(String sid) {

		return dao.getStatistics(sid);
	}

	@Override
	public StatisticsVO getAvg(HashMap<String, String> map) {
		return dao.getAvg(map);
	}

	@Override
	public List<StatisticsVO> getScount(HashMap<String, String> donutMap) {
		return dao.getScount(donutMap);
	}

	@Override
	public List<StatisticsVO> getScountPerDay(HashMap<String, String> lineMap) {
		return dao.getScountPerDay(lineMap);
	}

	@Override
	public AdGifVO getTarget(String sid) {
		return dao.getTarget(sid);
	}
	
	@Override
	public List<StatisticsVO> getScountPerTarget1(HashMap<String, Object> areaMap) {
		return dao.getScountPerTarget1(areaMap);
	}

	@Override
	public String getTotalView(String sid) {
		return dao.getTotalView(sid);
	}

}
