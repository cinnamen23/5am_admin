package org.cg.service;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> getList(Criteria cri) throws Exception;
	
	public int count() throws Exception;
	
}
