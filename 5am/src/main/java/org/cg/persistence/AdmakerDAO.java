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
	
<<<<<<< Upstream, based on branch 'master' of https://github.com/kick07230723/5AM.git
	public int dueDate(String sid);
	
=======
	public List<AdGifVO> deladdlist();
>>>>>>> d219a14 gif폴더 삭제
	
}
