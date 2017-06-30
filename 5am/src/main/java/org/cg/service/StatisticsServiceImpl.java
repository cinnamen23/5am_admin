package org.cg.service;

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
	public StatisticsVO getAvg(String sid) {
		return dao.getAvg(sid);
	}

	@Override
	public List<StatisticsVO> getScount(String sid) {
		return dao.getScount(sid);
	}

	@Override
	public List<StatisticsVO> getScountPerDay(String sid) {
		return dao.getScountPerDay(sid);
	}

	@Override
	public AdGifVO getTarget(String sid) {
		return dao.getTarget(sid);
	}
	
	@Override
	public List<StatisticsVO> getScountPerTarget1(AdGifVO ad) {
		return dao.getScountPerTarget1(ad);
	}
	@Override
	public List<StatisticsVO> getScountPerTarget2(AdGifVO ad) {
		return dao.getScountPerTarget2(ad);
	}
	@Override
	public List<StatisticsVO> getScountPerTarget3(AdGifVO ad) {
		return dao.getScountPerTarget3(ad);
	}
	@Override
	public List<StatisticsVO> getScountPerTarget4(AdGifVO ad) {
		return dao.getScountPerTarget4(ad);
	}

}
