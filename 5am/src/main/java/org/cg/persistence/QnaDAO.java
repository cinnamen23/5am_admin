package org.cg.persistence;

import java.util.List;

import org.cg.domain.Criteria;
import org.cg.domain.QuestionVO;

public interface QnaDAO {
	
	public List<QuestionVO> getQList(Criteria cri);
	
	public int getTotal();
	
	
	
}
