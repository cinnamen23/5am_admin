package org.cg.persistence;

import java.util.List;

import org.cg.domain.AdGifVO;
import org.cg.domain.StatisticsVO;

public interface StatisticsDAO {
	
	public void insert(StatisticsVO vo); 
	
	public List<StatisticsVO> getStatistics(String sid);
	
	public StatisticsVO getAvg(String sid);
	
	public List<StatisticsVO> getScount(String sid);
	
	public List<StatisticsVO> getScountPerDay(String sid);
	
	public AdGifVO getTarget(String sid);
	
	public List<StatisticsVO> getScountPerTarget1(AdGifVO ad);
	public List<StatisticsVO> getScountPerTarget2(AdGifVO ad);
	public List<StatisticsVO> getScountPerTarget3(AdGifVO ad);
	public List<StatisticsVO> getScountPerTarget4(AdGifVO ad);

}
