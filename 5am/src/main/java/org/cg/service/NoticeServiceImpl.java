package org.cg.service;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.NoticeVO;
import org.cg.persistence.NoticeDAO;
import org.springframework.stereotype.Service;
@Service
public class NoticeServiceImpl implements NoticeService {

	
	@Inject
	NoticeDAO dao;
	
	@Override
	public List<NoticeVO> getList(Criteria cri) throws Exception {
		return dao.list(cri);
		
		
		
	}

	@Override
	public int count(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(cri);
	}

	@Override
	public NoticeVO getRead(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(vo);
	}

}
