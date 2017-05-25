package org.cg.service;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.MQuestionVO;
import org.cg.domain.MemberVO;
import org.cg.persistence.MemberDAO;
import org.springframework.stereotype.Service;

@Service
public class MemeberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;

	@Override
	public List<MemberVO> listAll(Criteria cri) {
		return dao.listAll(cri);
	}

	@Override
	public void regist(MemberVO vo) {
		dao.creat(vo);
	}

	@Override
	public void delete(MemberVO vo) {
		dao.delete(vo);
	}

	@Override
	public int totalCount() {
		return dao.totalCount();
	}

	@Override
	public void update(MemberVO vo) {
		dao.update(vo);
	}

	@Override
	public List<MQuestionVO> qlistAll(Criteria cri) {
		return dao.qlistAll(cri);
	}

}
