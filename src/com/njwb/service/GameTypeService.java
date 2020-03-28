package com.njwb.service;

import java.util.List;
import java.util.Map;

import com.njwb.pojo.GameType;

public interface GameTypeService {
	/**
	 * 查询全部游戏类型
	 * @return
	 */
	List<GameType> selectAllGameTypes();

	/**
	 * 查询全部商用游戏类型
	 * @return
	 */
	List<GameType> selectAllCommercialGameTypes();
	
	/**
	 * 根据参数模糊查询
	 * @param map
	 * @return
	 */
	List<GameType> vagueSelectGameType(Map<String, Object> map);
	
	/**
	 * 模糊查询总数
	 * @param map
	 * @return
	 */
	Integer vagueSelectCount(Map<String, Object> map);
	
	/**
	 * 根据名称查询
	 * @param typeName
	 * @return
	 */
	List<GameType> selectGameTypeByName(String typeName);
	
	/**
	 * 根据id修改
	 * @param map
	 */
	void updateGameTypeById(Map<String, Object> map);
	
	/**
	 * 根据id删除
	 * @param typeId
	 * @return
	 */
	Integer deleteGameTypeById(Integer typeId);
	
	/**
	 * 新增游戏类型
	 * @param gameType
	 */
	void addGameType(GameType gameType);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	GameType selectGameTypeById(int id);
}
