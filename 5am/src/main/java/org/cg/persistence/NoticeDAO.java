package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;

public interface NoticeDAO {
	
	public List<NoticeVO> list(Criteria cri) throws Exception;
	
	public int count(Criteria cri) throws Exception;
	
	public NoticeVO read(NoticeVO vo) throws Exception;
	
	public void insert(NoticeVO vo)throws Exception;
	
	public void update(NoticeVO vo)throws Exception;
	
	public void delete(NoticeVO vo)throws Exception;
	
	public void updateHit(NoticeVO vo)throws Exception;
	
	public void uploadImage(NoticeVO vo)throws Exception;
	
	public List<NoticeVO> index(NoticeVO vo)throws Exception;

	
}
