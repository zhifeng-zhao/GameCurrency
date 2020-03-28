package com.njwb.service;

import java.util.List;
import java.util.Map;

import com.njwb.pojo.Game;

public interface GameService {
	/**
	 * 根据参数模糊查询
	 * @param map
	 * @return
	 */
	List<Game> vagueSelectGame(Map<String, Object> map);
	
	/**
	 * 模糊查询总数
	 * @param map
	 * @return
	 */
	Integer vagueSelectCount(Map<String, Object> map);
	
	/**
	 * 根据id删除游戏
	 * @param id
	 */
	void deleteGameById(int id);
	
	/**
	 * 新增游戏
	 * @param game
	 */
	void addGame(Game game);
	
	/**
	 * 根据游戏名查询
	 * @param name
	 * @return
	 */
	Game selectGameByName(String name);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	Game selectGameById(int id);
	
	/**
	 * 根据id更新
	 * @param game
	 */
	void updateGameById(Game game);
	
	/**
	 * 查询所有游戏
	 * @return
	 */
	List<Game> selectAllGames();
	
	/**
	 * 根据游戏类型和游戏名称查询
	 * @param map
	 * @return
	 */
	List<Game> selectGameByTypeAndName(Map<String, Object> map);
}
