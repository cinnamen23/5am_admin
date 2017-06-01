package org.cg.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.cg.domain.Criteria;
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
	public void storeRegister(StoreVO vo) {
		session.insert(namespace + ".storeregi", vo);
	}

	@Override
	public void storeModify(StoreVO vo) {
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

	@Override
	public StoreVO findId(String sname, String semail) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sname", sname);
		map.put("semail", semail);
		
		return session.selectOne(namespace+".findId", map);
	}

	@Override
	public StoreVO findPw(String sid, String semail) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sid", sid);
		map.put("semail", semail);
		
		return session.selectOne(namespace+".findPw", map);
	}

	@Override
	public int storeTotal(Criteria cri) {
		return session.selectOne(namespace+".storeTotal", cri);
	}

	@Override
	public List<StoreVO> storeList(Criteria cri) {
		return session.selectList(namespace+".storeList", cri);
	}

	@Override
	public StoreVO storeRead(String sid) {
		return session.selectOne(namespace+".storeRead", sid);
	}

	@Override
	public void storeDel(String sid) {
		session.delete(namespace+".storeDel", sid);
		
	}


}
