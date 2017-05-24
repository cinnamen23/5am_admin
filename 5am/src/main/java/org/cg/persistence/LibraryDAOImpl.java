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
		sess.insert(namespace+".create");
	}

	@Override
	public LibraryVO read(int dno) {
		return null;
	}

	@Override
	public void update(LibraryVO vo) {

	}

	@Override
	public void delete(int dno) {

	}

	@Override
	public List<LibraryVO> getList() {
		return  sess.selectList(namespace+".getList");
	}

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

}
