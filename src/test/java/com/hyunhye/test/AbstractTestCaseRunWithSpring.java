package com.hyunhye.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/applicationContext.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class AbstractTestCaseRunWithSpring {

	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
