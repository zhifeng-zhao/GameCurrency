package com.njwb.mapper;

import java.util.List;
import java.util.Map;

import com.njwb.pojo.Exchange;

public interface ExchangeMapper {
	/**
	 * 根据参数模糊查询
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> vagueSelectExchange(Map<String, Object> map);
	
	/**
	 * 模糊查询总数
	 * @param map
	 * @return
	 */
	Integer vagueSelectCount(Map<String, Object> map);
	
	/**
	 * 查询所有有兑换规则的省份
	 * @return
	 */
	List<Map<String, String>> selectProvs();
	
	/**
	 * 根据id删除兑换规则
	 * @param id
	 */
	void deleteExchangeById(int id);
	
	/**
	 * 新增兑换规则
	 * @param exchange
	 */
	void addExchange(Exchange exchange);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	Map<String, Object> selectExchangeById(int id);
	
	/**
	 * 根据id修改
	 * @param exchange
	 */
	void updateExchangeById(Exchange exchange);
	
	/**
	 * 根据省份id查询兑换规则
	 * @param provId
	 * @return
	 */
	Exchange selectByProvId(int provId);
}
