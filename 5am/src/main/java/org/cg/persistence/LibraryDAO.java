package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.LibraryVO;
import org.springframework.stereotype.Repository;



public interface LibraryDAO {
	
	public void create(LibraryVO vo);
	
	public LibraryVO read(int lno);
	
	public LibraryVO update(LibraryVO vo);
	
	public void delete(int lno);
	
	public List<LibraryVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	

}
