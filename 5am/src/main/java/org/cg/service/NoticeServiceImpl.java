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

	@Override
	public void register(NoticeVO vo) throws Exception {
		dao.insert(vo);
		
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void delete(NoticeVO vo) throws Exception {
		dao.delete(vo);
		
	}

	@Override
	public void updateHit(NoticeVO vo) throws Exception {
		dao.updateHit(vo);
		
	}
	
	@Override
	public void uploadImage(NoticeVO vo) throws Exception {
		dao.uploadImage(vo);
	}

	@Override
	public List<NoticeVO> index(NoticeVO vo) throws Exception {
		return dao.index(vo);
		
	}

}
