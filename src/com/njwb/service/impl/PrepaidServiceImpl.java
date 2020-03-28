package com.njwb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njwb.mapper.PrepaidMapper;
import com.njwb.pojo.Prepaid;
import com.njwb.service.PrepaidService;
@Service("prepaidService")
public class PrepaidServiceImpl implements PrepaidService {

	@Autowired
	PrepaidMapper prepaidMapper;
	
	@Transactional
	public void addPrepaid(Prepaid prepaid) {
		prepaidMapper.addPrepaid(prepaid);
	}

	public List<Prepaid> selectPrepaidByUserId(Integer userId) {
		return prepaidMapper.selectPrepaidByUserId(userId);
	}

}
