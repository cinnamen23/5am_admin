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
	public int getTotal() {
		
		return sess.selectOne(namespace+".getTotal");
	}
	

}
