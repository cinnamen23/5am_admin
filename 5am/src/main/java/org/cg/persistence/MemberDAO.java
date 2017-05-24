package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.MemberVO;



public interface MemberDAO {
	
	

	public int totalCount();
	
	public void creat(MemberVO vo);
	
	public List<MemberVO> listAll(Criteria cri);
	
	public void update(MemberVO vo);
		
	public void delete(String mid);
	
	

}
