package com.njwb.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.core.convert.converter.Converter;

public class StringDateConverter implements Converter<String, Date>{
	private Logger log = Logger.getLogger(this.getClass());
	public Date convert(String arg0) {
		log.info("自定义类型转换器，String转Date");
		// 日期格式
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date;
		try {
			date = sdf.parse(arg0);
		} catch (ParseException e) {
			log.info("日期转换失败，格式不匹配" + pattern + ", 参数为：" + arg0, e);
			//throw e;
			date = null;
		}
		return date;
	}

}
