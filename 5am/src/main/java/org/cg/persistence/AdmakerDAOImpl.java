package org.cg.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.cg.domain.AdGifVO;
import org.cg.domain.AdImageVO;
import org.cg.domain.ElevatorVO;
import org.cg.domain.StoreVO;
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
	public void gifInsert(String gifname,AdGifVO vo) {

		Map<String,Object> paramMap=new HashMap<String, Object>();
		paramMap.put("gifname", gifname);
		paramMap.put("vo", vo);
		
		sess.insert(namespace+".adgifinsert",paramMap);
	}



	@Override
	public List<ElevatorVO> getElevator(StoreVO svo, AdGifVO avo) {
		Map<String,Object> paramMap=new HashMap<String, Object>();
		paramMap.put("svo", svo);
		paramMap.put("avo", avo);
		return sess.selectList(namespace+".elevator",paramMap);
	}



	@Override
	public int getArea(String str) {
		
		return sess.selectOne(namespace+".getArea", str);
	}



	@Override

	public int dueDate(String sid) {
		return sess.selectOne(namespace+".dueDate", sid);

	}	
		public List<AdGifVO> deladdlist() {
		return sess.selectList(namespace+".deladlist");

	}


	
	
	

}
