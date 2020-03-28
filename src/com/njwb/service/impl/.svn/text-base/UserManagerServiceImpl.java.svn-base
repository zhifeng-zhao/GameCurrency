package com.njwb.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwb.mapper.UserManagerMapper;
import com.njwb.pojo.UserManager;
import com.njwb.service.UserManagerService;
@Service("userManagerService")
public class UserManagerServiceImpl implements UserManagerService {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	UserManagerMapper userManagerMapper;
	
	/**
	 * 根据姓名查询管理员
	 */
	public UserManager queryByName(String name) {
		log.info("根据姓名:" + name +"查询管理员");
		return userManagerMapper.selectManagerByName(name);
	}
	

}
