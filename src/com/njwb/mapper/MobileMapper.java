package com.njwb.mapper;

import com.njwb.pojo.Mobile;

public interface MobileMapper {
	/**
	 * 根据手机号段查询号段信息
	 * @param number
	 * @return
	 */
	Mobile selectByNumber(String number);
}
