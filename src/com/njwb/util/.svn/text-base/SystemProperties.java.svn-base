package com.njwb.util;

import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;
/**
 * 获取配置文件数据的工具类
 * @author Administrator
 *
 */
public class SystemProperties {

	
	private static Properties properties;
	private static Logger log = Logger.getLogger(SystemProperties.class);
	static {
		properties = new Properties();
		try {
			//properties初始化，加载system.properties，也可以加载多个配置文件
			properties.load(SystemProperties.class.getClassLoader()
					.getResourceAsStream("system.properties"));
		} catch (IOException e) {
			log.info("加载system.properties配置文件失败，请检查文件路径，或者配置文件是否存放在src根目录下", e);
		}
	}
	
	/**
	 * 根据properties中的key，获取valuse值
	 * @param key
	 * @return
	 */
	public static String getValue(String key)
	{
		String value = properties.getProperty(key);
		if(SystemUtil.isEmpty(value))
		{
			log.info("根据key没有取到value值，请检查输入key值，或者是system.properties。key:"+ key);
			value = "";
		}
		return value;
	}
	
	
}
