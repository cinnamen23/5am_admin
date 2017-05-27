package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.QAnswerVO;
import org.cg.domain.QuestionVO;

public interface QnaDAO {
	
//  question
	
	public List<QuestionVO> getQList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public QuestionVO qReadOne(QuestionVO vo);
	
	public void qUpdate(QuestionVO vo);
	
	public void qDelete(QuestionVO vo);
	
	public void qInsert(QuestionVO vo);
	
	
//	answer
	
	public List<QAnswerVO> getAList(QuestionVO vo);
	
	public void aInsert(QAnswerVO vo);
	
	public void aDelete(QAnswerVO vo);
	
	public void aUpdate(QAnswerVO vo);
	
}
