package com.njwb.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.njwb.pojo.VertificationCode;

public interface VertificationCodeMapper {
	/**
	 * 新增一条验证码记录
	 * @param vc
	 */
	void addHistory(VertificationCode vc);
	
	/**
	 * 查询所有验证码记录
	 * @return
	 */
	List<VertificationCode> selectAllHistories();
	
	/**
	 * 根据手机号和验证码获取创建时间
	 * @return
	 */
	List<Date> selectCreateTimeByPhoneAndCode(Map<String, String> map);
}
