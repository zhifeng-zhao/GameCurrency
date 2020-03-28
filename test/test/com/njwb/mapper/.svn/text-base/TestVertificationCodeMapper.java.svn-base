package test.com.njwb.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.njwb.mapper.VertificationCodeMapper;
import com.njwb.pojo.VertificationCode;

public class TestVertificationCodeMapper {
	private VertificationCodeMapper vcm = null;
	
	@Before
	public void getBefore() {
		String xmlPath = "src/applicationContext.xml";
		ApplicationContext ac = new FileSystemXmlApplicationContext(xmlPath);
		vcm = ac.getBean(VertificationCodeMapper.class);
	}
	
	@Test
	public void addHistory() {
		VertificationCode vc = new VertificationCode();
		vc.setVcPhone("13813968440");
		vc.setVcCode(vc.generateRandom());
		vc.setCreateTime(new Date());
		vcm.addHistory(vc);
	}
	
	@Test
	public void selectAllHistories() {
		List<VertificationCode> list = vcm.selectAllHistories();
		for (VertificationCode vertificationCode : list) {
			System.out.println(vertificationCode);
		}
	}
	
	@Test
	public void selectCreateTimeByPhoneAndCode() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("vcPhone", "13813968440");
		map.put("vcCode", "2222");
		List<Date> list = vcm.selectCreateTimeByPhoneAndCode(map);
		for (Date date : list) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			System.out.println(sdf.format(date));
		}
	}
	
}
