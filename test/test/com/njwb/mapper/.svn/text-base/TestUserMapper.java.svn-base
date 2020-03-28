package test.com.njwb.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.njwb.mapper.UserMapper;
import com.njwb.pojo.User;

public class TestUserMapper {
	private UserMapper userMapper = null;
	
	@Before
	public void getBefore() {
		String xmlPath = "src/applicationContext.xml";
		ApplicationContext ac = new FileSystemXmlApplicationContext(xmlPath);
		userMapper = ac.getBean(UserMapper.class);
	}
	
	@Test
	public void selectUser() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", 1);
		map.put("endIndex", 3);
		List<User> list = userMapper.selectUser(map);
		for (User user : list) {
			System.out.println(user);
		}
	}
	
}
