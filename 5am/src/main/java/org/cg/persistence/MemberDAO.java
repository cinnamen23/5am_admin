package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.Criteria2;
import org.cg.domain.MAnswerVO;
import org.cg.domain.MQuestionVO;
import org.cg.domain.MemberVO;



public interface MemberDAO {
	
	public int totalCount(Criteria cri);
	
	public void creat(MemberVO vo);
	
	public List<MemberVO> listAll(Criteria cri);
	
	public void update(MemberVO vo);
		
	public void delete(MemberVO vo);
	
	public List<MQuestionVO> qlistAll(Criteria2 cri2);
	
	public int qtotalCount(Criteria2 cri2);
	
	public void qcreat(MQuestionVO vo);
	
	public MQuestionVO qread(int mqno);
	
	public void qupdate(MQuestionVO vo);
		
	public void qdelete(MQuestionVO vo);
		
	public void acreat(MAnswerVO vo);
	
	public void achecked(MAnswerVO vo);
	
	public List<MAnswerVO> aread(int mqno);
	
	public void aupdate(MAnswerVO vo);
		
	public void adelete(MAnswerVO vo);
	
	public void adeleteall(MQuestionVO vo);
	
	
	
	
	
	

}
