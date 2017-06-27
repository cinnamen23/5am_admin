package org.cg.service;

import javax.inject.Inject;

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

}
