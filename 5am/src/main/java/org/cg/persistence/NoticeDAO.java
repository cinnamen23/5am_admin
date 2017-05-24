package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;

public interface NoticeDAO {
	
	public List<NoticeVO> list(Criteria cri) throws Exception;
	
	public int count() throws Exception;
	
	
	
}
