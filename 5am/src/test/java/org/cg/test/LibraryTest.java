package org.cg.test;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.persistence.LibraryDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LibraryTest {
	
	private static final Logger logger =Logger.getLogger(ConnectionTest.class) ;

	@Inject
	SqlSessionTemplate sess;
	
	@Inject
	LibraryDAO dao;
	
	@Test
	public void libTest() throws SQLException{
		logger.info(sess.selectList("library.getList"));
		
	}
	
	
}
