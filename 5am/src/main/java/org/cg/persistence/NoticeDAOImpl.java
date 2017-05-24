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
	public int count() throws Exception {
		
		return sess.selectOne(namespace+".count");
	}

}
