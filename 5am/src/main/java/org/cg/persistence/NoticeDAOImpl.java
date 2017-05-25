package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	
	@Inject
	SqlSessionTemplate sess;
	
	private static final String namespace = "org.cg.persistence.NoticeDAO";
	
	
	@Override
	public List<NoticeVO> list(Criteria cri) {
		
		return sess.selectList(namespace+".list",cri);
		
	}


	@Override
	public int count(Criteria cri) throws Exception {
		
		return sess.selectOne(namespace+".count",cri);
	}


	@Override
	public NoticeVO read(NoticeVO vo) throws Exception {
		
		return sess.selectOne(namespace+".read", vo);
	}


	@Override
	public void insert(NoticeVO vo) throws Exception {
		sess.insert(namespace+".insert", vo);
		
	}


	@Override
	public void update(NoticeVO vo) throws Exception {
		sess.update(namespace+".update", vo);
	}


	@Override
	public void delete(NoticeVO vo) throws Exception {
		sess.delete(namespace+".delete",vo);
		
	}

}
