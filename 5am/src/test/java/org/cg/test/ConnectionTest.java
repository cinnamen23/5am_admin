package org.cg.test;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ConnectionTest {

	private static final Logger logger =Logger.getLogger(ConnectionTest.class) ;
	
	@Inject
	DataSource ds; 
	
	@Test
	public void conTest() throws SQLException{
		
		logger.info(ds.getConnection());
		ds.getConnection();
	}
}
