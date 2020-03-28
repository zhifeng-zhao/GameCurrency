package com.njwb.service;

import java.util.List;
import java.util.Map;

import com.njwb.pojo.User;

public interface UserService {
	/**
	 * 查询用户
	 * @param map
	 * @return
	 */
	List<User> selectUser(Map<String, Integer> map);
	
	/**
	 * 查询用户总数
	 * @return
	 */
	Integer selectCount();
	
	/**
	 * 分页模糊查询
	 * @param map
	 * @return
	 */
	List<User> vagueSelectUser(Map<String, Object> map);
	
	/**
	 * 模糊查询用户总数
	 * @return
	 */
	Integer vagueSelectCount(Map<String, Object> map);
	
	/**
	 * 根据id更新用户状态
	 * @param map
	 */
	void updateUserStatusById(Map<String, Integer> map);
	
	/**
	 * 根据姓名查询
	 * @param name
	 * @return
	 */
	User selectByName(String name);
	
	/**
	 * 新增用户
	 * @param user
	 */
	void addUser(User user);
	
	/**
	 * 根据id查询用户
	 * @param id
	 * @return
	 */
	User selectById(Integer id);
	
	/**
	 * 更新用户余额
	 * @param user
	 */
	void updateUserMoneyById(User user);
}
