package org.cg.test;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.QAnswerVO;
import org.cg.domain.QfileVO;
import org.cg.domain.QuestionVO;
import org.cg.persistence.QnaDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class QnaAnsTest {

	private static final Logger logger = Logger.getLogger(NoticeTest.class);
	@Inject
	QnaDAO dao;
	@Inject
	SqlSessionTemplate sess;
	
	
	@Test
	public void qfileSave(){
	
		QfileVO vo = new QfileVO();
		
		vo.setFqno(204);
		vo.setFilename("손나은.jpg");
		
		dao.fInsert(vo);
		
	}
	
	
	
	
	@Test
	public void answerGetList(){
		
		QuestionVO vo = new QuestionVO();
		vo.setQno(200);
		
		logger.info(vo);
		
		dao.getAList(vo);
		
	}
	
	
	@Test
	public void AnswerCRUDTest(){
		QuestionVO vo = new QuestionVO(); 
		
		
//		Answer List 뽑기 완료 
		for(int i=192;i<=200;i++){
		vo.setQno(i);
		dao.getAList(vo);
		}
		
		vo.setTitle("답변입니다");
		vo.setContent("답변 내용입니다 ");
		vo.setWriter("관리자입니다 .");
		
		QAnswerVO avo=new QAnswerVO();
		
		
		sess.insert("org.cg.persistence.QnaDAO.ainsert",vo);
		
		}
	
	@Test
	public void AnswerInsertTest(){
		
		QAnswerVO vo = new QAnswerVO();
		
		
		vo.setAcontent("점점 에러가 많이난다....  ");
		vo.setAwriter("미쳤다....");
		
		
		dao.aInsert(vo);
	}
	
	@Test
	public void AnswerDeleteTest(){
		
		QAnswerVO vo = new QAnswerVO();
		
		
		vo.setAano(163);
		
		dao.aDelete(vo);
	}
	
	@Test
	public void AnswerUpdateTest(){
		
		QAnswerVO vo = new QAnswerVO();
		
		
		vo.setAano(161);
		vo.setAcontent("뷁뷁뷁.");
		
		dao.aUpdate(vo);
	}
	
	
	
}
