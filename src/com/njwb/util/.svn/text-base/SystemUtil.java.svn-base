package com.njwb.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SystemUtil {

	/**
	 * 获取当前时间字符串格式yyyyMMddhhmmssSSS
	 * @return
	 */
	public static String getDateString()
	{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		return sdf.format(date);
	}
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return true:为空，false:不为空
	 */
	public static boolean isEmpty(String str)
	{
		return str == null || str.trim().equals("");
	}
}
