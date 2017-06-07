package org.cg.service;

import javax.inject.Inject;

import org.cg.domain.AdImageVO;
import org.cg.persistence.AdmakerDAO;
import org.springframework.stereotype.Service;

@Service
public class ADMakerServiceImpl implements ADMakerService {

	@Inject
	AdmakerDAO dao;
	
	
	@Override
	public void ImgInsert(AdImageVO vo, String sid) {
		dao.ImgInsert(vo, sid);

	}

	@Override
	public void gifInsert(String gifid, String sid) {
		dao.gifInsert(gifid, sid);
		
	}

}
