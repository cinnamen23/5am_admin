package org.cg.service;

import javax.inject.Inject;

import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;
import org.cg.persistence.StoreDAO;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImple implements StoreService{
	
	@Inject
	StoreDAO dao;
	
	@Override
	public StoreVO login(LoginDTO dto) throws Exception {
	
		return dao.login(dto);
	}
	
}
