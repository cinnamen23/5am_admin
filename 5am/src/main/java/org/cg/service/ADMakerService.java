package org.cg.service;

import org.cg.domain.AdImageVO;

public interface ADMakerService {
	
	
	//img 저장

	public void ImgInsert(AdImageVO vo,String sid);
	
	
	
	
	//gif 저장
	
	public void gifInsert(String gifid,String sid);
}
