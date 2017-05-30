package org.cg.persistence;

import java.util.Date;

import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;

public interface StoreDAO {
	
	public StoreVO login(LoginDTO dto) throws Exception;
	
	public void storeregister(StoreVO vo);

	public void storemodify(StoreVO vo);
	
	public void keepLogin(String sid, String sessionID, Date next);
	
	public StoreVO checkSessionKey(String value);
	
	public StoreVO findId(String sname, String semail);
	
	public StoreVO findPw(String sid, String semail);
	
	
	
}
