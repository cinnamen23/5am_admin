package org.cg.test;


import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.persistence.QnaDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class ConnectionTest {

	private static final Logger logger =Logger.getLogger(ConnectionTest.class) ;
	
<<<<<<< HEAD
=======
	
	
	@Inject
	DataSource ds; 
>>>>>>> branch 'master' of https://github.com/kick07230723/5AM.git
	
	
	@Inject
	QnaDAO dao;
	
	
	
	@Test
	public void qListTest(){
	dao.getQList();
	}
	
<<<<<<< HEAD
	
=======
	@Test
	public void time(){
		logger.info(sess.selectOne("time.time"));
	}
	
	@Test
	public void read(){
		
		String namespace = "org.cg.persistence.MemberDAO";
		sess.selectList(namespace  + ".listAll");
	}
>>>>>>> branch 'master' of https://github.com/kick07230723/5AM.git
}
