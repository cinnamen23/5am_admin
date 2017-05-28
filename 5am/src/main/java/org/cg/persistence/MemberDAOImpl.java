package org.cg.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria2;
import org.cg.domain.MAnswerVO;
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
	public List<MemberVO> listAll(HashMap<String, Object> map) {
		
		return sess.selectList(namespace + ".listAll", map);
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
	public int totalCount(HashMap<String, Object> map) {
				
		return sess.selectOne(namespace + ".totalCount", map);
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
	public MQuestionVO qread(int mqno) {
		return sess.selectOne(namespace+".qread", mqno);
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
	public void acreat(MAnswerVO vo) {
		sess.insert(namespace + ".acreate", vo);
		
	}

	@Override
	public List<MAnswerVO> aread(int mqno) {
		return sess.selectList(namespace+".aread", mqno);

	}

	@Override
	public void aupdate(MAnswerVO vo) {
		sess.update(namespace + ".aupdate", vo);
		
	}

	@Override
	public void adelete(MAnswerVO vo) {
		sess.delete(namespace + ".adelete", vo);		
	}

	@Override
	public void achecked(MAnswerVO vo) {
		sess.update(namespace + ".achecked", vo);		
	}

	@Override
	public void adeleteall(MQuestionVO vo) {

		sess.delete(namespace+".adeleteall", vo);
	}

	
	
	

}
