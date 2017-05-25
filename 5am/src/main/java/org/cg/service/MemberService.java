package org.cg.service;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.Criteria2;
import org.cg.domain.MQuestionVO;
import org.cg.domain.MemberVO;

public interface MemberService {
	
	public int totalCount(Criteria cri);
	
	public void regist(MemberVO vo);
	
	public List<MemberVO> listAll(Criteria cri);

	public void update(MemberVO vo);
		
	public void delete(MemberVO vo);
	
	public List<MQuestionVO> qlistAll(Criteria2 cri2);
	
	public int qtotalCount(Criteria2 cri2);
	
	public void qregist(MQuestionVO vo);
	
	public MQuestionVO qread(int mqno);

	public void qupdate(MQuestionVO vo);
		
	public void qdelete(MQuestionVO vo);

	


}
