package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.LibraryFileVO;
import org.cg.domain.LibraryVO;



public interface LibraryDAO {
	
	public void deleteFile(int lno);
	
	public List<LibraryFileVO> readFile(int lno);
	
	public void createFile(LibraryFileVO vo);
	
	public LibraryFileVO searchFile(String lfileid);
	
	
	
	public void updateHit(LibraryVO vo);
	
	public void create(LibraryVO vo);
	
	public LibraryVO read(int lno);
	
	public LibraryVO update(LibraryVO vo);
	
	public void delete(int lno);
	
	public List<LibraryVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	
}
