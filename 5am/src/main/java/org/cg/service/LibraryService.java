package org.cg.service;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.LibraryFileVO;
import org.cg.domain.LibraryVO;


public interface LibraryService {
	
	public void create(LibraryVO vo) throws Exception;
	public LibraryVO read(Integer lno) throws Exception;
	public LibraryVO update(LibraryVO vo) throws Exception;
	public void delete(Integer lno) throws Exception;
	
	public List<LibraryVO> getList(Criteria cri)throws Exception;
	public Integer getTotal(Criteria cri) throws Exception;
	
	public void updateHit(LibraryVO vo)throws Exception;
	
	
	public void createFile(LibraryFileVO vo) throws Exception;
	public List<LibraryFileVO> readFile(Integer lno) throws Exception;
	public void deleteFile(Integer lno) throws Exception;
	public LibraryFileVO searchFile(String lfileid)throws Exception;

}
