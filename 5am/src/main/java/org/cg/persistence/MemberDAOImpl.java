package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
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

		return sess.selectList(namespace + ".listAll",cri);
	}

	

	@Override
	public void creat(MemberVO vo) {

		sess.insert(namespace + ".create", vo);
	}


	@Override
	public void delete(String mid) {
		sess.delete(namespace + ".delete", mid);
	}



	@Override
	public int totalCount() {
		
		return sess.selectOne(namespace+".totalCount");
	}



	@Override
	public void update(MemberVO vo) {
sess.update(namespace+".update",vo);		
	}


}
