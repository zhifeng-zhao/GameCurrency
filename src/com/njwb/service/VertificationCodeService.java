package com.njwb.service;

import java.util.Date;

import com.njwb.pojo.VertificationCode;

public interface VertificationCodeService {
	/**
	 * 根据手机号创建一条记录
	 * @param phone
	 * @return
	 */
	String addHistory(String phone);
	
	/**
	 * 根据手机号和验证码获取创建时间
	 * @param vc
	 * @return
	 */
	Date queryCreateTimeByPhoneAndCode(String phone, String code);
}
