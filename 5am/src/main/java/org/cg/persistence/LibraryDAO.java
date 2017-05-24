package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.LibraryVO;
import org.springframework.stereotype.Repository;



public interface LibraryDAO {
	
	public void create(LibraryVO vo);
	
	public LibraryVO read(int dno);
	
	public void update(LibraryVO vo);
	
	public void delete(int dno);
	
	public List<LibraryVO> getList();
	
	public int getTotal(Criteria cri);
	

}
