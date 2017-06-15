package org.cg.persistence;

import javax.inject.Inject;

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

}
