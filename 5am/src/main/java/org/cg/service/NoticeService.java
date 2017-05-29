package org.cg.service;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> getList(Criteria cri) throws Exception;
	
	public int count(Criteria cri) throws Exception;
	
	public NoticeVO getRead(NoticeVO vo) throws Exception;
	
	public void register(NoticeVO vo)throws Exception;
	
	public void update(NoticeVO vo)throws Exception;
	
	public void delete(NoticeVO vo)throws Exception;
	
	public void updateHit(NoticeVO vo)throws Exception;
	
	public void uploadImage(NoticeVO vo)throws Exception;
	
	public List<NoticeVO> index(NoticeVO vo)throws Exception;

}
