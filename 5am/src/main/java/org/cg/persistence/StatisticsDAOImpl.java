package org.cg.persistence;

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
	public StatisticsVO getAvg(String sid) {
		return session.selectOne(namespace+".getAvg", sid);
	}

	@Override
	public List<StatisticsVO> getScount(String sid) {
		return session.selectList(namespace+".getScount", sid);
	}

	@Override
	public List<StatisticsVO> getScountPerDay(String sid) {
		return session.selectList(namespace+".getScountPerDay", sid);
	}
	@Override
	public AdGifVO getTarget(String sid) {
		return session.selectOne(namespace+".getTarget", sid);
	}

	@Override
	public List<StatisticsVO> getScountPerTarget1(AdGifVO ad) {
		return session.selectList(namespace+".getScountPerTarget1", ad);
	}
	@Override
	public List<StatisticsVO> getScountPerTarget2(AdGifVO ad) {
		return session.selectList(namespace+".getScountPerTarget2", ad);
	}
	@Override
	public List<StatisticsVO> getScountPerTarget3(AdGifVO ad) {
		return session.selectList(namespace+".getScountPerTarget3", ad);
	}
	@Override
	public List<StatisticsVO> getScountPerTarget4(AdGifVO ad) {
		return session.selectList(namespace+".getScountPerTarget4", ad);
	}


}
