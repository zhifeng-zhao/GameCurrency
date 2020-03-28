package com.njwb.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.njwb.constant.SystemConstant;
import com.njwb.pojo.Game;
import com.njwb.pojo.GameType;
import com.njwb.service.GameService;
import com.njwb.service.GameTypeService;
import com.njwb.util.SystemProperties;
import com.njwb.util.SystemUtil;


@RequestMapping("gameType")
@Controller
public class GameTypeController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	GameTypeService gameTypeService;
	
	@Autowired
	GameService gameService;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * 分页模糊查询游戏类型
	 * @param queryName
	 * @param queryPhone
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("vagueSelectGameTypes")
	@ResponseBody
	public String vagueSelectGameTypes(String queryName, String queryStatus, Integer pageNo, Integer pageSize) {
		log.info("分页模糊查询游戏类型");
		Map<String, Object> map = new HashMap<String, Object>();
		//TODO 参数合法性校验
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 5 : pageSize;
		//pageNo,pageSize不合法，给默认值
		//pageNo的判断需要考虑，最小值，最大值
		
		map.put("typeName", queryName);
		map.put("typeStatus", queryStatus);
		
		//计算总页数， 总数据量/每页显示数量
		int count = gameTypeService.vagueSelectCount(map);
		int totalPage = count % pageSize > 0 ? count/pageSize + 1: count/pageSize;
		
		//分页，开始位置，结束位置
		//页面传入参数，一般有两个，pageNo(页码),pageSize（每页显示数量）
		int startIndex = (pageNo-1)*pageSize + 1;
		int endIndex = pageNo * pageSize;
		map.put("startIndex", startIndex);
		map.put("endIndex", endIndex);
		
		List<GameType> typeList = gameTypeService.vagueSelectGameType(map);
		
		//页面需要啥，给啥
		request.getSession().setAttribute("typeList", typeList);
		request.getSession().setAttribute("pageNo", pageNo);
		request.getSession().setAttribute("totalPage", totalPage);
		request.getSession().setAttribute("queryName", queryName);
		request.getSession().setAttribute("queryStatus", queryStatus);
		return "success";
	}
	
	/**
	 * 更新带入
	 * @param typeName
	 * @param typeStatus
	 * @param typeId
	 * @return
	 */
	@RequestMapping("toUpdate")
	public String toUpdate(String typeName, Integer typeStatus, Integer typeId) {
		log.info("游戏类型更新带入");
		request.getSession().setAttribute("typeName", typeName);
		request.getSession().setAttribute("typeStatus", typeStatus);
		request.getSession().setAttribute("typeId", typeId);
		return "redirect:/gameType/updateGameType.jsp";
	}
	
	/**
	 * 更新游戏列表
	 * @param typeName
	 * @param typeStatus
	 * @param typeId
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public String update(String originTypeName, String typeName, Integer typeStatus, Integer typeId) {
		log.info("更新游戏列表");
		// 数据校验
		if (typeName == null || typeName.equals("")) return "null_type_name";
		Map<String, Object> map = new HashMap<String, Object>();
		// 1.名称未修改
		if (originTypeName.equals(typeName)) {
			map.put("typeName", typeName);
			map.put("typeStatus", typeStatus);
			map.put("typeId", typeId);
			gameTypeService.updateGameTypeById(map);
			if (typeStatus == 2) {
				List<Game> gameList = gameService.selectAllGames();
				for (Game game : gameList) {
					if (game.getGameType() == typeId) {
						game.setGameStatus(2);
						gameService.updateGameById(game);
					}
				}
			}
		}else {
			// 2.名称被修改
			// 判断新名称是否存在
			if (gameTypeService.selectGameTypeByName(typeName).size() == 0) {
				// 不存在即可修改
				map.put("typeName", typeName);
				map.put("typeStatus", typeStatus);
				map.put("typeId", typeId);
				gameTypeService.updateGameTypeById(map);
				if (typeStatus == 2) {
					List<Game> gameList = gameService.selectAllGames();
					for (Game game : gameList) {
						if (game.getGameType() == typeId) {
							game.setGameStatus(2);
							gameService.updateGameById(game);
						}
					}
				}
			}else {
				// 存在返回状态码
				return "type_name_exist";
			}
		}
		return "success";
	}
	
	/**
	 * 根据id删除游戏类型
	 * @param typeId
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public String delete(Integer typeId) {
		log.info("根据id删除游戏类型");
		Integer rows = gameTypeService.deleteGameTypeById(typeId);
		return rows.toString();
	}
	
	/**
	 * 新增游戏类型
	 * @param file
	 * @param dept
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public String add(@RequestParam("typePicture") CommonsMultipartFile file, String typeName, Integer typeStatus) {
		if (typeName.equals("") || typeName == null) {
			return "null_type_name";
		}else if (file == null) {
			return "null_type_picture";
		}else if (gameTypeService.selectGameTypeByName(typeName).size() != 0) {
			return "type_name_exist";
		}
		log.info("添加游戏类型，" + typeName + "-" + typeStatus);
		GameType gameType = new GameType();
		gameType.setTypeName(typeName);
		gameType.setTypeStatus(typeStatus);
		
		//从配置文件中获取,key定义成常量
		String path = SystemProperties.getValue(SystemConstant.UPLOAD_PATH);
		String fileName = file.getOriginalFilename();

		// 重命名：时间戳+原始文件名后缀
		String newFileName = SystemUtil.getDateString()
				+ fileName.substring(fileName.lastIndexOf("."));
		try {
			// 文件复制到指定目录
			file.transferTo(new File(path + newFileName));
		} catch (IllegalStateException e) {
			log.info("文件上传失败。" + gameType);
		} catch (IOException e) {
			log.info("文件上传失败。" + gameType);
		}

		// 已知的路径可以不用存到数据库
		gameType.setTypePicture(newFileName);
		gameTypeService.addGameType(gameType);

		// 添加完成之后，转发给查询所有数据请求
		return "success";
	}
	
	/**
	 * 用户获取游戏类型下游戏
	 * @return
	 */
	@RequestMapping("userGetGames")
	public String userGetGames(Integer gameTypeId) {
		log.info("用户获取游戏类型下游戏");
		List<Game> gameList = gameService.selectAllGames();
		List<Game> queryGameList = new ArrayList<Game>();
		for (Game game : gameList) {
			if (game.getGameType() == gameTypeId && game.getGameStatus() == 1) queryGameList.add(game);
		}
		request.getSession().setAttribute("queryGameList", queryGameList);
		return "redirect:/user/typeDetail.jsp";
	}
}
