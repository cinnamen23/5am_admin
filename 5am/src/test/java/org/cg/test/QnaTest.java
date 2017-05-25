package org.cg.test;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.QuestionVO;
import org.cg.service.QnaService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class QnaTest {
	private static final Logger logger = Logger.getLogger(NoticeTest.class);
	@Inject
	QnaService qservice;
	@Inject
	SqlSessionTemplate sess;


	@Test
	public void qUpdateTest(){
		QuestionVO vo = new QuestionVO();
		vo.setQno(30);
		vo.setTitle("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
		vo.setContent("목요일목요일목요일목요일목요일목요일목요일목요일");
		
		logger.info(vo);
		
		qservice.qUpdate(vo);
		
	}
	
	
	@Test
	public void qreadOne(){
		
		QuestionVO vo = new QuestionVO();
		vo.setQno(30);
		
		qservice.qReadOne(vo);
		
	}
	
	
	
}
