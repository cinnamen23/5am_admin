package org.cg.test;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.service.NoticeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeTest {
	
	private static final Logger logger = Logger.getLogger(NoticeTest.class);
	
	@Inject
	NoticeService nservice;
	
	@Test
	public void list(){
		Criteria cri = new Criteria();
		try {
			logger.info(nservice.getList(cri));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
