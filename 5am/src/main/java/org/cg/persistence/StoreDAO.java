package org.cg.persistence;

import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;

public interface StoreDAO {
	
	public StoreVO login(LoginDTO dto) throws Exception;
	
	
	
}
