package org.cg.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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

	@Override
	public void storemodify(StoreVO vo) {
		session.update(namespace+".storemodi", vo);
	}

	@Override
	public void keepLogin(String sid, String sessionID, Date next) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sid", sid);
		map.put("sessionID", sessionID);
		map.put("next", next);
		
		session.update(namespace+".keepLogin", map);
		
	 }

	@Override
	public StoreVO checkSessionKey(String value) {
		return session.selectOne(namespace+".checkSessionKey", value);
	}

}
