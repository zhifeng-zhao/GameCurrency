package test.com.njwb.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.njwb.constant.SystemConstant;
import com.njwb.service.VertificationCodeService;


public class TestVertificationCodeService {
	private VertificationCodeService vcs = null;
	
	@Before
	public void getBefore() {
		String xmlPath = "src/applicationContext.xml";
		ApplicationContext ac = new FileSystemXmlApplicationContext(xmlPath);
		vcs = ac.getBean(VertificationCodeService.class);
	}
	
	@Test
	public void addHistory() {
		vcs.addHistory("13813968440");
	}
	
	@Test
	public void validCode() {
		Date createTime = vcs.queryCreateTimeByPhoneAndCode("13813968440", "2222");
		Date currTime = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		System.out.println("curr-->" + sdf.format(currTime));
		System.out.println("create-->" + sdf.format(createTime));
		long diff = currTime.getTime() - createTime.getTime();
		long sec = diff / 1000; 
		System.out.println(sec + "s");
	}
}
