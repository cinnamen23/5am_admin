package org.cg.service;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.QAnswerVO;
import org.cg.domain.QuestionVO;
import org.cg.persistence.QnaDAO;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {

	
	@Inject
	QnaDAO dao;
	
	@Override
	public List<QuestionVO> getQList(Criteria cri) {
		
		return dao.getQList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return dao.getTotal(cri);
	}

	@Override
	public QuestionVO qReadOne(QuestionVO vo) {
		return dao.qReadOne(vo);
	}

	@Override
	public void qUpdate(QuestionVO vo) {
			dao.qUpdate(vo);
		
	}

	@Override
	public void qDelete(QuestionVO vo) {
			dao.qDelete(vo);
	}

	@Override
	public void qInsert(QuestionVO vo) {
			dao.qInsert(vo);
	}

	
//	answer==========
	
	@Override
	public List<QAnswerVO> getAList(QuestionVO vo) {
		return dao.getAList(vo);
	}

	@Override
	public void aInsert(QAnswerVO vo) {
		dao.aInsert(vo);
	}

	@Override
	public void aDelete(QAnswerVO vo) {

		dao.aDelete(vo);
	}

	@Override
	public void aUpdate(QAnswerVO vo) {
		dao.aUpdate(vo);
	}

	@Override
	public void aDeleteAll(QuestionVO vo) {

		dao.aDeleteAll(vo);
	}

}
