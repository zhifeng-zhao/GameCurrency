package com.njwb.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njwb.mapper.CardMapper;
import com.njwb.pojo.Card;
import com.njwb.service.CardService;

@Service("cardService")
public class CardServiceImpl implements CardService {

	@Autowired
	CardMapper cardMapper;

	@Override
	public List<Card> vagueSelectCard(Map<String, Object> map) {
		return cardMapper.vagueSelectCard(map);
	}

	@Override
	public Integer vagueSelectCount(Map<String, Object> map) {
		return cardMapper.vagueSelectCount(map);
	}

	@Transactional
	@Override
	public void addCard(Card card) {
		cardMapper.addCard(card);
	}

	@Override
	public Card selectByCardNumber(String number) {
		return cardMapper.selectByCardNumber(number);
	}

	@Transactional
	@Override
	public void updateCardByNumber(Card card) {
		cardMapper.updateCardByNumber(card);
	}

	@Override
	public List<Card> selectAllCards() {
		return cardMapper.selectAllCards();
	}

	@Override
	public List<Card> selectByUserId(Integer userId) {
		return cardMapper.selectByUserId(userId);
	}

	@Override
	public Card selectById(int id) {
		return cardMapper.selectById(id);
	}

	@Transactional
	@Override
	public void updateAmountById(Card card) {
		cardMapper.updateAmountById(card);
	}

}
