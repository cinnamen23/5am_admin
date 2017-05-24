package org.cg.service;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.MemberVO;
import org.cg.persistence.MemberDAO;
import org.springframework.stereotype.Service;

@Service
public class MemeberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;

	@Override
	public List<MemberVO> listAll() {
		return dao.listAll();
	}

	@Override
	public void regist(MemberVO vo) {
		dao.creat(vo);
	}

	

	@Override
	public void delete(String mid) {
		dao.delete(mid);
	}

	@Override
	public int totalCount() {
		
		return dao.totalCount();
	}

	

	

}
