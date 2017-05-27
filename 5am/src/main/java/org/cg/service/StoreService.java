package org.cg.service;

import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;

public interface StoreService {

	public StoreVO login(LoginDTO dto) throws Exception;
	
}
