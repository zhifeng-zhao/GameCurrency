package com.njwb.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njwb.mapper.VertificationCodeMapper;
import com.njwb.pojo.VertificationCode;
import com.njwb.service.VertificationCodeService;

@Service("vertificationCodeService")
public class VertificationCodeServiceImpl implements VertificationCodeService {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	VertificationCode vertificationCode;
	
	@Autowired
	VertificationCodeMapper vertificationCodeMapper;
	/**
	 * 根据手机号创建一条记录
	 */
	@Transactional
	public String addHistory(String phone) {
		log.info("根据手机号:" + phone + "创建一条记录");
		String code = vertificationCode.generateRandom();
		vertificationCode.setVcPhone(phone);
		vertificationCode.setVcCode(code);
		vertificationCode.setCreateTime(new Date());
		vertificationCodeMapper.addHistory(vertificationCode);
		return code;
	}
	
	/**
	 * 根据手机号和验证码获取创建时间
	 */
	public Date queryCreateTimeByPhoneAndCode(String phone, String code) {
		log.info("根据手机号:" + phone + "和验证码:" + code + "获取创建时间");
		Map<String, String> map = new HashMap<String, String>();
		map.put("vcPhone", phone);
		map.put("vcCode", code);
		if (vertificationCodeMapper.selectCreateTimeByPhoneAndCode(map) != null)
			return vertificationCodeMapper.selectCreateTimeByPhoneAndCode(map).get(0);
		else return null;
	}

}
