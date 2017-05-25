package org.cg.service;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
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
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public QuestionVO qReadOne(QuestionVO vo) {
		return dao.qReadOne(vo);
	}

}
