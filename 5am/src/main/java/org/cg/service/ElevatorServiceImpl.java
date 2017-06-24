package org.cg.service;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
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


	@Override
	public List<ElevatorVO> getelvList(Criteria cri) {
		return dao.getelvList(cri);
	}


	@Override
	public int getElvCount(Criteria cri) {
		return dao.getElvCount(cri);
	}


	@Override
	public List<ElevatorVO> listAll() {
		return dao.listAll();
	}


	@Override
	public void elvdelete(ElevatorVO vo) {
		dao.elvdelete(vo);
		
	}

}
