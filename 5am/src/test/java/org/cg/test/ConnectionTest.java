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
	

	
	
	
	
	@Inject
	QnaDAO dao;
	
	
	
	
	
}
