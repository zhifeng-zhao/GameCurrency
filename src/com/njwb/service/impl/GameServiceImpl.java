package com.njwb.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.njwb.mapper.GameMapper;
import com.njwb.pojo.Game;
import com.njwb.service.GameService;

@Service("gameService")
public class GameServiceImpl implements GameService {
	
	@Autowired
	GameMapper gameMapper;
	
	public Integer vagueSelectCount(Map<String, Object> map) {
		return gameMapper.vagueSelectCount(map);
	}

	public List<Game> vagueSelectGame(Map<String, Object> map) {
		return gameMapper.vagueSelectGame(map);
	}

	@Transactional
	public void deleteGameById(int id) {
		gameMapper.deleteGameById(id);
	}

	@Transactional
	public void addGame(Game game) {
		gameMapper.addGame(game);
	}

	public Game selectGameByName(String name) {
		return gameMapper.selectGameByName(name);
	}

	public Game selectGameById(int id) {
		return gameMapper.selectGameById(id);
	}

	@Transactional
	public void updateGameById(Game game) {
		gameMapper.updateGameById(game);
	}

	public List<Game> selectAllGames() {
		return gameMapper.selectAllGames();
	}

	public List<Game> selectGameByTypeAndName(Map<String, Object> map) {
		return gameMapper.selectGameByTypeAndName(map);
	}

}
