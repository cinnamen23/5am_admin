package org.cg.persistence;

import java.util.List;

import org.cg.domain.AdGifVO;
import org.cg.domain.AdImageVO;
import org.cg.domain.ElevatorVO;
import org.cg.domain.StoreVO;

public interface AdmakerDAO {

	public void ImgInsert(AdImageVO vo,String sid);
	
	public void gifInsert(String gifname,AdGifVO vo);
		
	public List<ElevatorVO> getElevator(StoreVO svo,AdGifVO avo);
	
	public int getArea(String str);
	
	public int dueDate(String sid);
	
	
}
