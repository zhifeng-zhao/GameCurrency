package com.njwb.service;

import java.util.List;
import java.util.Map;

import com.njwb.pojo.Expense;

public interface ExpenseService {
	/**
	 * 根据用户和游戏id查询购买记录
	 * @return
	 */
	Expense selectByUserAndGameId(Map<String, Integer> map);
	
	/**
	 * 新增下载记录
	 * @param expense
	 */
	void addExpense(Expense expense);
	
	/**
	 * 更新下载记录
	 * @param expense
	 */
	void updateExpense(Expense expense);
	
	/**
	 * 根据用户id查询
	 * @param userId
	 * @return
	 */
	List<Expense> selectByUserId(int userId);
}
