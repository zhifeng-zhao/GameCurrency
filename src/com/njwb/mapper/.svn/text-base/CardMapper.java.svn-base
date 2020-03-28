package com.njwb.mapper;

import java.util.List;
import java.util.Map;

import com.njwb.pojo.Card;

public interface CardMapper {
	/**
	 * 根据参数模糊查询
	 * @return
	 */
	List<Card> vagueSelectCard(Map<String, Object> map);
	
	/**
	 * 模糊查询总数
	 * @param map
	 * @return
	 */
	Integer vagueSelectCount(Map<String, Object> map);
	
	/**
	 * 新增密保卡
	 * @param card
	 */
	void addCard(Card card);
	
	/**
	 * 根据密保卡卡号查询
	 * @param number
	 * @return
	 */
	Card selectByCardNumber(String number);
	
	/**
	 * 根据卡号修改密保卡状态
	 * @param card
	 */
	void updateCardByNumber(Card card);
	
	/**
	 * 查询所有密保卡
	 * @return
	 */
	List<Card> selectAllCards();
	
	/**
	 * 根据用户id查询卡
	 * @param userId
	 * @return
	 */
	List<Card> selectByUserId(Integer userId);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	Card selectById(int id);
	
	/**
	 * 根据id更新密保卡余额
	 * @param id
	 */
	void updateAmountById(Card card);
}
