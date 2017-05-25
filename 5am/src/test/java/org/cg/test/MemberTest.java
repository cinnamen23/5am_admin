package org.cg.test;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria2;
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
		vo.setMname("testupdate");
		vo.setMpw("password");
		vo.setMgender("m");
		vo.setMaddr("NY");

		service.update(vo);
	}
	
	@Test
	public void dTest(){
		MemberVO vo = new MemberVO();

		vo.setMid("id4");
		service.delete(vo);
	}
	
	@Test
	public void QuestionReadRTest(){
		
		Criteria2 cri2 = new Criteria2();
		cri2.setPageNum2(10);
		cri2.setSkip2(0);
		
		service.qlistAll(cri2);
		
		logger.info(service.qlistAll(cri2));
	}

}
