package org.cg.service;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.ElevatorVO;

public interface ElevatorService {
	
	public void insertElevator(ElevatorVO vo);
	
	public List<ElevatorVO> getelvList(Criteria cri);

	public int getElvCount(Criteria cri);
}
