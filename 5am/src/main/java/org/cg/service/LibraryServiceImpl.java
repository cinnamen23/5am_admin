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
		return dao.read(lno);
	}

	@Override
	public LibraryVO update(LibraryVO vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public void delete(Integer lno) throws Exception {
		dao.delete(lno);
	}

	@Override
	public List<LibraryVO> getList(Criteria cri) throws Exception {
		return dao.getList(cri);
	}

	@Override
	public Integer getTotal(Criteria cri) throws Exception {
		return dao.getTotal(cri);
	}

	@Override
	public void updateHit(LibraryVO vo) throws Exception {
		dao.updateHit(vo);
	}


	

}
