package org.cg.persistence;

import org.cg.domain.AdGifVO;
import org.cg.domain.AdImageVO;

public interface AdmakerDAO {

	//img 저장
	
	public void ImgInsert(AdImageVO vo,String sid);
	
	
	
	
	//gif 저장
	
	public void gifInsert(String gifname,AdGifVO vo);
	
	
}
