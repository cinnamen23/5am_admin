package org.cg.persistence;

import java.util.HashMap;
import java.util.List;

import org.cg.domain.AdGifVO;
import org.cg.domain.StatisticsVO;

public interface StatisticsDAO {
	
	public void insert(StatisticsVO vo); 
	
	public List<StatisticsVO> getStatistics(String sid);
	
	public StatisticsVO getAvg(HashMap<String, String> map);
	
	public List<StatisticsVO> getScount(HashMap<String, String> donutMap);
	
	public List<StatisticsVO> getScountPerDay(HashMap<String, String> lineMap);
	
	public AdGifVO getTarget(String sid);
	
	public List<StatisticsVO> getScountPerTarget1(HashMap<String, Object> areaMap);

	public String getTotalView(String sid);
}
