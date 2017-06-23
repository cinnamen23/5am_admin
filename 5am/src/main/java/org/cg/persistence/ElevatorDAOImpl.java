package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.Criteria;
import org.cg.domain.ElevatorVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class ElevatorDAOImpl implements ElevatorDAO {

private static final String namespace = "org.cg.persistence.ElevatorDAO";
	
	@Inject
	SqlSessionTemplate sess;

	@Override
	public void insertElevator(ElevatorVO vo) {
		
		sess.insert(namespace+".insertel", vo);

	}

	@Override
	public List<ElevatorVO> getelvList(Criteria cri) {
		
		return sess.selectList(namespace+".elvlist",cri);
	}

	@Override
	public int getElvCount(Criteria cri) {
		return sess.selectOne(namespace+".elvcount",cri);
	}

	@Override
	public List<ElevatorVO> listAll() {
		return sess.selectList(namespace+".listAll");
	}

	@Override
	public void elvdelete(ElevatorVO vo) {
		sess.delete(namespace+".elvdelete",vo);
		
	}



	

}
