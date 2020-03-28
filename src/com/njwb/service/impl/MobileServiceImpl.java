package com.njwb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwb.mapper.MobileMapper;
import com.njwb.pojo.Mobile;
import com.njwb.service.MobileService;
@Service("mobileService")
public class MobileServiceImpl implements MobileService {

	@Autowired
	MobileMapper mobileMapper;
	
	public Mobile selectByNumber(String number) {
		return mobileMapper.selectByNumber(number);
	}

}
