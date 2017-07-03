package org.cg.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.cg.domain.AdGifVO;
import org.cg.domain.StatisticsVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class StatisticsDAOImpl implements StatisticsDAO {
	
	
	private static final String namespace = "org.cg.persistence.StatisticsDAO";
	
	@Inject
	private SqlSessionTemplate session;
	
	@Override
	public void insert(StatisticsVO vo) {
		session.insert(namespace+".insert",vo);

	}

	@Override
	public List<StatisticsVO> getStatistics(String sid) {
		return session.selectList(namespace+".getStatistics", sid);
	}

	@Override
	public StatisticsVO getAvg(HashMap<String, String> map) {
		return session.selectOne(namespace+".getAvg", map);
	}

	@Override
	public List<StatisticsVO> getScount(HashMap<String, String> donutMap) {
		return session.selectList(namespace+".getScount", donutMap);
	}

	@Override
	public List<StatisticsVO> getScountPerDay(HashMap<String, String> lineMap) {
		return session.selectList(namespace+".getScountPerDay", lineMap);
	}
	@Override
	public AdGifVO getTarget(String sid) {
		return session.selectOne(namespace+".getTarget", sid);
	}

	@Override
	public List<StatisticsVO> getScountPerTarget1(HashMap<String, Object> areaMap) {
		return session.selectList(namespace+".getScountPerTarget1", areaMap);
	}

	@Override
	public String getTotalView(String sid) {
		return session.selectOne(namespace+".getTotalView", sid);
	}


}
