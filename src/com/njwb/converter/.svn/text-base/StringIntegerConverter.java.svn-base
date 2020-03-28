package com.njwb.converter;

import org.apache.log4j.Logger;
import org.springframework.core.convert.converter.Converter;

public class StringIntegerConverter implements Converter<String, Integer> {
	private Logger log = Logger.getLogger(this.getClass());
	public Integer convert(String arg0) {
		log.info("自定义类型转换器，String转Integer");
		return new Integer(arg0);
	}

}
