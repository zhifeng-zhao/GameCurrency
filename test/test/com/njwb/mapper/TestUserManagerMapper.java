package test.com.njwb.mapper;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.njwb.mapper.UserManagerMapper;
import com.njwb.pojo.UserManager;

public class TestUserManagerMapper {
	private UserManagerMapper userManagerMapper = null;
	
	@Before
	public void getBefore() {
		String xmlPath = "src/applicationContext.xml";
		ApplicationContext ac = new FileSystemXmlApplicationContext(xmlPath);
		userManagerMapper = ac.getBean(UserManagerMapper.class);
	}
	
	/**
	 * 查询全部管理员
	 */
	@Test
	public void selectAllManagers() {
		List<UserManager> list = userManagerMapper.selectAllManagers();
		for (UserManager userManager : list) {
			System.out.println(userManager);
		}
	}
	
	/**
	 * 根据姓名查找管理员
	 */
	@Test
	public void selectManagerByName() {
		UserManager userManager = userManagerMapper.selectManagerByName("张文轩");
		System.out.println(userManager);
	}
}
