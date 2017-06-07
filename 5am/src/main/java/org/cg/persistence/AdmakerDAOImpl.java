package org.cg.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.cg.domain.AdImageVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class AdmakerDAOImpl implements AdmakerDAO {

	
	private static final String namespace = "org.cg.persistence.AdmakerDAO";
	
	@Inject
	SqlSessionTemplate sess;

	@Override
	public void ImgInsert(AdImageVO vo, String sid) {
		Map<String,Object> paramMap=new HashMap<String, Object>();
		paramMap.put("vo", vo);
		paramMap.put("sid", sid);
		
		sess.insert(namespace + ".adimginsert", paramMap);
		
		
	}

	
	
	@Override
	public void gifInsert(String gifid,String sid) {

		Map<String,Object> paramMap=new HashMap<String, Object>();
		paramMap.put("gifid", gifid);
		paramMap.put("sid", sid);
		
		sess.insert(namespace+".adgifinsert",paramMap);
	}
	
	
	
	

}