package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.QAnswerVO;
import org.cg.domain.QuestionVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSessionTemplate sess;

	private static final String namespace = "org.cg.persistence.QnaDAO";
	@Override
	public List<QuestionVO> getQList(Criteria cri) {
		
		return sess.selectList(namespace+".QuestionList",cri);
	}
	@Override
	public int getTotal(Criteria cri) {
		
		return sess.selectOne(namespace+".getTotal",cri);
	}
	@Override
	public QuestionVO qReadOne(QuestionVO vo) {
		
		return sess.selectOne(namespace+".getDetail",vo);
	}
	@Override
	public void qUpdate(QuestionVO vo) {
		sess.update(namespace+".qupdate",vo);
		
	}
	@Override
	public void qDelete(QuestionVO vo) {
		sess.delete(namespace+".qdelete",vo);
	}
	@Override
	public void qInsert(QuestionVO vo) {
		sess.insert(namespace+".qinsert",vo);
		
	}
	@Override
	public List<QAnswerVO> getAList(QuestionVO vo) {
		
		return sess.selectList(namespace+".getAnsList",vo);
	}
	@Override
	public void aInsert(QAnswerVO vo) {
			sess.insert(namespace+".ainsert",vo);
	}
	@Override
	public void aDelete(QAnswerVO vo) {
		sess.delete(namespace+".adelete",vo);
	}
	@Override
	public void aUpdate(QAnswerVO vo) {
		sess.update(namespace+".aupdate",vo);
		
	}
	@Override
	public void aDeleteAll(QuestionVO vo) {
		sess.delete(namespace+".adeleteall",vo);
		
	}
	
	

}
