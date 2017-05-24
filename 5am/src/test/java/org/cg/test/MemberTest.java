package org.cg.test;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.MemberVO;
import org.cg.persistence.LibraryDAO;
import org.cg.service.MemberService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberTest {
	
	private static final Logger logger =Logger.getLogger(MemberTest.class) ;

	@Inject
	SqlSessionTemplate sess;
	
	@Inject
	LibraryDAO dao;
	
	@Inject
	MemberService service;
	
	@Test
	public void cTest() {
		
		
		MemberVO vo = new MemberVO();
		
		for (int i = 0; i < 300; i++) {	
		
		vo.setMaddr("주소"+i);
		vo.setMage(i%80);
		vo.setMgender("w");
		vo.setMid("id"+i);
		vo.setMname("이름"+i);
		vo.setMpw("비밀"+i);
		service.regist(vo);
		}
		
	}
	
	
	@Test
	public void uTest(){
		MemberVO vo = new MemberVO();
		vo.setMid("id7");
		vo.setMpw("password");

		service.update(vo);
	}
	
	@Test
	public void dTest(){
		
		service.delete("id4");
	}

}
