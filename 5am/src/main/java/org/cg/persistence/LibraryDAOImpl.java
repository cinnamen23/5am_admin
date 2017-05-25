package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.LibraryVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LibraryDAOImpl implements LibraryDAO {

	static final String namespace = "library";

	@Inject
	SqlSessionTemplate sess;
	
	@Override
	public void create(LibraryVO vo) {
		sess.insert(namespace+".create",vo);
	}

	@Override
	public LibraryVO read(int lno) {
		return sess.selectOne(namespace+".read",lno);
	}

	@Override
	public LibraryVO update(LibraryVO vo) {
		return sess.selectOne(namespace+".update", vo);
	}

	@Override
	public void delete(int lno) {
		sess.delete(namespace+".delete", lno);
	}

	@Override
	public List<LibraryVO> getList(Criteria cri) {
		return  sess.selectList(namespace+".getList",cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return sess.selectOne(namespace+".getTotal",cri);
	}

}
