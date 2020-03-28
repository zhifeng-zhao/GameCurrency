package com.njwb.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njwb.mapper.UserMapper;
import com.njwb.pojo.User;
import com.njwb.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;

	public List<User> selectUser(Map<String, Integer> map) {
		return userMapper.selectUser(map);
	}

	public Integer selectCount() {
		return userMapper.selectCount();
	}

	public List<User> vagueSelectUser(Map<String, Object> map) {
		return userMapper.vagueSelectUser(map);
	}

	public Integer vagueSelectCount(Map<String, Object> map) {
		return userMapper.vagueSelectCount(map);
	}

	@Transactional
	public void updateUserStatusById(Map<String, Integer> map) {
		userMapper.updateUserStatusById(map);
	}

	public User selectByName(String name) {
		return userMapper.selectByName(name);
	}

	@Transactional
	public void addUser(User user) {
		userMapper.addUser(user);
	}

	public User selectById(Integer id) {
		return userMapper.selectById(id);
	}

	@Transactional
	public void updateUserMoneyById(User user) {
		userMapper.updateUserMoneyById(user);
	}

}
