package org.cg.service;

import java.util.Date;

import javax.inject.Inject;

import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;
import org.cg.persistence.StoreDAO;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImple implements StoreService {

	@Inject
	StoreDAO dao;

	@Override
	public StoreVO login(LoginDTO dto) throws Exception {

		return dao.login(dto);
	}

	@Override
	public void storeregister(StoreVO vo) {

		dao.storeregister(vo);
	}

	@Override
	public void storemodify(StoreVO vo) {
		dao.storemodify(vo);

	}

	@Override
	public void keepLogin(String sid, String sessionID, Date next) {
		dao.keepLogin(sid, sessionID, next);
	}

	@Override
	public StoreVO checkSessionKey(String value) {
		return dao.checkSessionKey(value);
	}

	@Override
	public StoreVO findId(String sname, String semail) {
		return dao.findId(sname, semail);
	}

	@Override
	public StoreVO findPw(String sid, String semail) {
		return dao.findPw(sid, semail);
	}

}
