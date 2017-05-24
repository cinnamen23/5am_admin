package org.cg.service;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.LibraryVO;
import org.cg.persistence.LibraryDAO;
import org.springframework.stereotype.Service;

@Service
public class LibraryServiceImpl implements LibraryService {

	@Inject
	LibraryDAO dao;
	
	@Override
	public void create(LibraryVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public LibraryVO read(Integer lno) throws Exception {
		return null;
	}

	@Override
	public void update(LibraryVO vo) throws Exception {

	}

	@Override
	public void delete(Integer lno) throws Exception {

	}

	@Override
	public List<LibraryVO> getList(Criteria cri) throws Exception {
		return dao.getList(cri);
	}

	@Override
	public Integer getTotal() throws Exception {
		return dao.getTotal();
	}

}
