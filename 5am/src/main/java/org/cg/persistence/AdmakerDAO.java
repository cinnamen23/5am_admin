package org.cg.persistence;

import java.util.List;

import org.cg.domain.AdGifVO;
import org.cg.domain.AdImageVO;
import org.cg.domain.ElevatorVO;
import org.cg.domain.StoreVO;

public interface AdmakerDAO {

	//img 저장
	
	public void ImgInsert(AdImageVO vo,String sid);
	
	
	
	
	//gif 저장
	
	public void gifInsert(String gifname,AdGifVO vo);
	
	
	public List<ElevatorVO> getElevator(StoreVO svo,AdGifVO avo);
	
	
}
