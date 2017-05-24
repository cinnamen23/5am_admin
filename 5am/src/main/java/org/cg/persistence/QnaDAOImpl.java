package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.QuestionVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSessionTemplate sess;

	private static final String namespace = "org.cg.persistence.QnaDAO";
	@Override
	public List<QuestionVO> getQList() {
		
		return sess.selectList(namespace+".QuestionList");
	}
	

}
