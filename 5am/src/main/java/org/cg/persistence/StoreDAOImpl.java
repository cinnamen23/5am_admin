package org.cg.persistence;

import javax.inject.Inject;

import org.cg.domain.StoreVO;
import org.cg.dto.LoginDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Inject
	private SqlSessionTemplate session;

	private static final String namespace = "org.cg.persistence.StoreDAO";

	@Override
	public StoreVO login(LoginDTO dto) throws Exception {

		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void storeregister(StoreVO vo) {
		session.insert(namespace + ".storeregi", vo);
	}

}
