package com.njwb.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njwb.mapper.ExpenseMapper;
import com.njwb.pojo.Expense;
import com.njwb.service.ExpenseService;
@Service("expenseService")
public class ExpenseServiceImpl implements ExpenseService {
	
	@Autowired
	ExpenseMapper expenseMapper;
	
	@Transactional
	public void addExpense(Expense expense) {
		expenseMapper.addExpense(expense);
	}

	public Expense selectByUserAndGameId(Map<String, Integer> map) {
		if (expenseMapper.selectByUserAndGameId(map).size() == 0) return null;
		return expenseMapper.selectByUserAndGameId(map).get(0);
	}

	@Transactional
	public void updateExpense(Expense expense) {
		expenseMapper.updateExpense(expense);
	}

	public List<Expense> selectByUserId(int userId) {
		return expenseMapper.selectByUserId(userId);
	}

}
