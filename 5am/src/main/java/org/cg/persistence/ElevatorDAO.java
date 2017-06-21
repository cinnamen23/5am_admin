package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.ElevatorVO;

public interface ElevatorDAO {
	
	public void insertElevator(ElevatorVO vo); 
	
	public List<ElevatorVO> getelvList(Criteria cri);
	
	public int getElvCount(Criteria cri);
}
