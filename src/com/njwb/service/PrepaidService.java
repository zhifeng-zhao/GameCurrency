package com.njwb.service;

import java.util.List;

import com.njwb.pojo.Prepaid;

public interface PrepaidService {
	/**
	 * 根据用户id查询充值记录
	 * @param userId
	 * @return
	 */
	List<Prepaid> selectPrepaidByUserId(Integer userId);
	
	/**
	 * 新增充值记录
	 * @param prepaid
	 */
	void addPrepaid(Prepaid prepaid);
}
