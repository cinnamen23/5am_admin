package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
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
		sess.update(namespace+".update",vo);
		
	}
	@Override
	public void qDelete(QuestionVO vo) {
		sess.delete(namespace+".delete",vo);
	}
	@Override
	public void qInsert(QuestionVO vo) {
		sess.insert(namespace+".insert",vo);
		
	}
	

}
