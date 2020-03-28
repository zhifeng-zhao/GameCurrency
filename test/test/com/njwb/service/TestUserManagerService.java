package test.com.njwb.service;

import java.util.Random;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.njwb.mapper.UserManagerMapper;
import com.njwb.service.UserManagerService;

public class TestUserManagerService {
	private UserManagerService userManagerService = null;
	
	@Before
	public void getBefore() {
		String xmlPath = "src/applicationContext.xml";
		ApplicationContext ac = new FileSystemXmlApplicationContext(xmlPath);
		userManagerService = ac.getBean(UserManagerService.class);
	}
	
	@Test
	public void queryByName() {
		System.out.println(userManagerService.queryByName("张文轩"));
	}
	
	@Test
	public void generateRandom() {
		Random random = new Random();
		String result = random.nextInt(10000) + "";
		int ranLength = result.length();
		if (ranLength < 4) {
			for (int i =0;i < 4 - ranLength;i++) {
				result = "0" + result;
			}
		}
		System.out.println(result);
	}
}
