package org.cg.persistence;

import java.util.Date;
import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;

public interface StoreDAO {
	
	public StoreVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String sid, String sessionID, Date next);
	
	public StoreVO checkSessionKey(String value);
	
	public StoreVO findId(String sname, String semail);
	
	public StoreVO findPw(String sid, String semail);
	
	public int storeTotal(Criteria cri);
	
	public List<StoreVO> storeList(Criteria cri);
	
	public void storeRegister(StoreVO vo);
	
	public StoreVO storeRead(String sid);
	
	public void storeModify(StoreVO vo);
	
	public void storeDel(String sid);
	
}
