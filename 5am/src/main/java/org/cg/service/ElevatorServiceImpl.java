package org.cg.service;

import javax.inject.Inject;

import org.cg.domain.ElevatorVO;
import org.cg.persistence.ElevatorDAO;

import org.springframework.stereotype.Service;
@Service
public class ElevatorServiceImpl implements ElevatorService {
	@Inject
	ElevatorDAO dao;
	
	
	@Override
	public void insertElevator(ElevatorVO vo) {
		dao.insertElevator(vo);

	}

}
