package org.cg.service;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.Criteria2;
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
	public int totalCount(Criteria cri) {
		return dao.totalCount(cri);
	}

	@Override
	public void update(MemberVO vo) {
		dao.update(vo);
	}

	@Override
	public List<MQuestionVO> qlistAll(Criteria2 cri2) {
		return dao.qlistAll(cri2);
	}

	@Override
	public int qtotalCount(Criteria2 cri2) {
		return dao.qtotalCount(cri2);
	}

	@Override
	public void qregist(MQuestionVO vo) {
		dao.qcreat(vo);		
	}

	@Override
	public void qupdate(MQuestionVO vo) {
		dao.qupdate(vo);		
	}

	@Override
	public void qdelete(MQuestionVO vo) {
		dao.qdelete(vo);		
	}

	@Override
	public MQuestionVO qread(int mqno) {
		return dao.qread(mqno);
	}

}
