package com.njwb.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njwb.mapper.ExchangeMapper;
import com.njwb.mapper.ProvinceMapper;
import com.njwb.pojo.Exchange;
import com.njwb.service.ExchangeService;

@Service("exchangeService")
public class ExchangeServiceImpl implements ExchangeService {
	@Autowired
	ExchangeMapper exchangeMapper;
	
	@Autowired
	ProvinceMapper provinceMapper;

	public Integer vagueSelectCount(Map<String, Object> map) {
		return exchangeMapper.vagueSelectCount(map);
	}

	public List<Map<String, Object>> vagueSelectExchange(Map<String, Object> map) {
		return exchangeMapper.vagueSelectExchange(map);
	}

	public List<Map<String, String>> selectProvs() {
		return exchangeMapper.selectProvs();
	}

	@Transactional
	public void deleteExchangeById(int id) {
		exchangeMapper.deleteExchangeById(id);
	}

	public void addExchange(Exchange exchange) {
		exchangeMapper.addExchange(exchange);
	}

	public Map<String, Object> selectExchangeById(int id) {
		return exchangeMapper.selectExchangeById(id);
	}

	public void updateExchangeById(Exchange exchange) {
		exchangeMapper.updateExchangeById(exchange);
	}

	public Exchange selectByProvId(int provId) {
		return exchangeMapper.selectByProvId(provId);
	}
	
}
