package org.cg.test;

import javax.inject.Inject;

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

	@Inject
	QnaService qservice;
	@Inject
	SqlSessionTemplate sess;

	
	@Test
	public void qreadOne(){
		
		QuestionVO vo = new QuestionVO();
		vo.setQno(30);
		
		qservice.qReadOne(vo);
		
		
	}
	
	
	
}
