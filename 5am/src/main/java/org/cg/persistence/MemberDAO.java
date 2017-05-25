package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.Criteria2;
import org.cg.domain.MQuestionVO;
import org.cg.domain.MemberVO;



public interface MemberDAO {
	
	public int totalCount();
	
	public void creat(MemberVO vo);
	
	public List<MemberVO> listAll(Criteria cri);
	
	public void update(MemberVO vo);
		
	public void delete(MemberVO vo);
	
	public List<MQuestionVO> qlistAll(Criteria2 cri2);
	
	public int qtotalCount();
	
	

}
