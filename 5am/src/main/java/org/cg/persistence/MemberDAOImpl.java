package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.Criteria2;
import org.cg.domain.MQuestionVO;
import org.cg.domain.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSessionTemplate sess;

	private static final String namespace = "org.cg.persistence.MemberDAO";

	@Override
	public List<MemberVO> listAll(Criteria cri) {

		return sess.selectList(namespace + ".listAll", cri);
	}

	@Override
	public void creat(MemberVO vo) {

		sess.insert(namespace + ".create", vo);
	}

	@Override
	public void delete(MemberVO vo) {
		sess.delete(namespace + ".delete", vo);
	}

	@Override
	public int totalCount(Criteria cri) {

		return sess.selectOne(namespace + ".totalCount",cri);
	}

	@Override
	public void update(MemberVO vo) {
		sess.update(namespace + ".update", vo);
	}

	@Override
	public List<MQuestionVO> qlistAll(Criteria2 cri2) {
		return sess.selectList(namespace + ".qlistAll", cri2);
	}

	@Override
	public int qtotalCount(Criteria2 cri2) {
		return sess.selectOne(namespace + ".qtotalCount",cri2);
	}

	@Override
	public void qcreat(MQuestionVO vo) {
		sess.insert(namespace + ".qcreate", vo);
		
	}

	@Override
	public void qupdate(MQuestionVO vo) {
		sess.update(namespace + ".qupdate", vo);
		
	}

	@Override
	public void qdelete(MQuestionVO vo) {
		sess.delete(namespace + ".qdelete", vo);
		
	}

	@Override
	public MQuestionVO qread(int mqno) {
		return sess.selectOne(namespace+".qread", mqno);
	}
	
	

}
