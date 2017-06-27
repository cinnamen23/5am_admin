package org.cg.persistence;

import javax.inject.Inject;

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

}
