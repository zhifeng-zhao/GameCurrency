package com.njwb.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njwb.pojo.Card;
import com.njwb.pojo.Expense;
import com.njwb.pojo.Game;
import com.njwb.pojo.GameType;
import com.njwb.pojo.Prepaid;
import com.njwb.pojo.User;
import com.njwb.service.CardService;
import com.njwb.service.ExpenseService;
import com.njwb.service.GameService;
import com.njwb.service.GameTypeService;
import com.njwb.service.MobileService;
import com.njwb.service.PrepaidService;
import com.njwb.service.UserService;

@RequestMapping("user")
@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	UserService userService;
	
	@Autowired
	GameTypeService gameTypeService;
	
	@Autowired
	CardService cardService;
	
	@Autowired
	PrepaidService prepaidService;
	
	@Autowired
	MobileService mobileService;
	
	@Autowired
	GameService gameService;
	
	@Autowired
	ExpenseService expenseService;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * 分页查询用户
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("selectAllUsers")
	public String selectAllUsers(Integer pageNo, Integer pageSize) {
		log.info("分页查询用户");
		Map<String, Integer> map = new HashMap<String, Integer>();
		//TODO 参数合法性校验
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 5 : pageSize;
		//pageNo,pageSize不合法，给默认值
		//pageNo的判断需要考虑，最小值，最大值
		
		//计算总页数， 总数据量/每页显示数量
		int count = userService.selectCount();
		int totalPage = count % pageSize > 0 ? count/pageSize + 1: count/pageSize;
		
		//分页，开始位置，结束位置
		//页面传入参数，一般有两个，pageNo(页码),pageSize（每页显示数量）
		int startIndex = (pageNo-1)*pageSize + 1;
		int endIndex = pageNo * pageSize;
		map.put("startIndex", startIndex);
		map.put("endIndex", endIndex);
		
		List<User> userList = userService.selectUser(map);
		//页面需要啥，给啥
		request.getSession().setAttribute("userList", userList);
		request.getSession().setAttribute("pageNo", pageNo);
		request.getSession().setAttribute("totalPage", totalPage);
		return "success";
	}
	
	/**
	 * 分页模糊查询用户
	 * @param queryName
	 * @param queryPhone
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("vagueSelectUsers")
	@ResponseBody
	public String vagueSelectUsers(String queryName, String queryPhone, Integer pageNo, Integer pageSize) {
		log.info("分页模糊查询用户");
		Map<String, Object> map = new HashMap<String, Object>();
		//TODO 参数合法性校验
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 5 : pageSize;
		//pageNo,pageSize不合法，给默认值
		//pageNo的判断需要考虑，最小值，最大值
		
		map.put("userName", queryName);
		map.put("userPhone", queryPhone);
		
		//计算总页数， 总数据量/每页显示数量
		int count = userService.vagueSelectCount(map);
		int totalPage = count % pageSize > 0 ? count/pageSize + 1: count/pageSize;
		
		//分页，开始位置，结束位置
		//页面传入参数，一般有两个，pageNo(页码),pageSize（每页显示数量）
		int startIndex = (pageNo-1)*pageSize + 1;
		int endIndex = pageNo * pageSize;
		map.put("startIndex", startIndex);
		map.put("endIndex", endIndex);
		
		List<User> userList = userService.vagueSelectUser(map);
		//页面需要啥，给啥
		request.getSession().setAttribute("userList", userList);
		request.getSession().setAttribute("pageNo", pageNo);
		request.getSession().setAttribute("totalPage", totalPage);
		request.getSession().setAttribute("queryName", queryName);
		request.getSession().setAttribute("queryPhone", queryPhone);
		return "success";
	}
	
	/**
	 * 更新用户状态
	 * @param userId
	 * @param userStatus
	 * @return
	 */
	@RequestMapping("updateUserStatus")
	@ResponseBody
	public String updateUserStatus(Integer userId, Integer userStatus) {
		log.info("更新用户状态");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("userId", userId);
		map.put("userStatus", userStatus);
		userService.updateUserStatusById(map);
		return "success";
	}
	
	/**
	 * 根据用户名获取用户
	 * @param name
	 * @return
	 */
	@RequestMapping("getUserByName")
	@ResponseBody
	public String getUserByName(String name) {
		log.info("根据用户名获取用户");
		User user = userService.selectByName(name);
		if (user == null) return "user_not_exist";
		request.getSession().setAttribute("user", user);
		return "success";
	}
	
	/**
	 * 用户登陆
	 * @param name
	 * @param pwd
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public String login(String name, String pwd) {
		log.info("用户登陆");
		User user = userService.selectByName(name);
		if (user.getUserStatus() == 2) {
			return "user_status_banned";
		}else if (!user.getUserPwd().equals(pwd)) {
			return "pwd_error";
		}else {
			request.getSession().setAttribute("user", user);
			return "success";
		}
	}
	
	/**
	 * 用户退出登陆
	 * @return
	 */
	@RequestMapping("logout")
	@ResponseBody
	public String logout() {
		log.info("用户退出登陆");
		request.getSession().removeAttribute("user");
		return "success";
	}
	
	/**
	 * 加载主页面
	 * @return
	 */
	@RequestMapping("getPortal")
	@ResponseBody
	public String getPortal() {
		log.info("加载主页面");
		List<GameType> gameTypeList = gameTypeService.selectAllGameTypes();
		List<Game> gameList = gameService.selectAllGames();
		List<Game> allowedGameList = new ArrayList<Game>();
		List<GameType> allowedGameTypeList = new ArrayList<GameType>();
		for (Game game : gameList) {
			if (game.getGameStatus() == 1 && gameTypeService.selectGameTypeById(game.getGameType()).getTypeStatus() == 1) allowedGameList.add(game); 
		}
		for (GameType gameType : gameTypeList) {
			if (gameType.getTypeStatus() == 1) allowedGameTypeList.add(gameType);
		}
		request.getSession().setAttribute("gameTypeList", allowedGameTypeList);
		request.getSession().setAttribute("gameList", allowedGameList);
		return "success";
	}
	
	/**
	 * 注册
	 * @param userName
	 * @param userPwd
	 * @param phone
	 * @param sex
	 * @param birthday
	 * @return
	 */
	@RequestMapping("register")
	@ResponseBody
	public String register(String userName, String userPwd, String phone, Integer sex, Date birthday) {
		log.info("用户注册");
		if (userService.selectByName(userName) != null) {
			return "user_exist";
		}
		String userSex = sex == 0 ? "男" : "女";
		User user = new User();
		user.setUserName(userName);
		user.setUserSex(userSex);
		user.setUserPwd(userPwd);
		user.setUserBirthday(birthday);
		user.setUserPhone(phone);
		user.setUserTariffe(new BigDecimal("100"));
		user.setUserCurrency(new BigDecimal("0"));
		user.setUserStatus(1);
		userService.addUser(user);
		return "success";
	}
	
	/**
	 * 用户密保卡充值
	 * @param cardNumber
	 * @param userId
	 * @param cardPwd
	 * @return
	 */
	@RequestMapping("recharge")
	@ResponseBody
	public String recharge(String cardNumber, String userName, String cardPwd) {
		log.info("用户密保卡充值");
		User user = userService.selectByName(userName);
		Card card = cardService.selectByCardNumber(cardNumber);
		// 用户状态验证
		if (user.getUserStatus() == 2) return "user_status_banned";
		// 密保卡存在判断
		if (card == null) return "card_not_exist";
		// 密保卡省份判断
		if (card.getCardProvId() != mobileService.selectByNumber(user.getUserPhone().substring(3, 7)).getMobilePostCode()) 
			return "prov_error";
		// 密保卡状态判断
		if (card.getCardStatus() != 2) return "card_status_error";
		// 密保卡密码
		if (!card.getCardPwd().equals(cardPwd)) return "pwd_error";
		// 可用，修改密保卡信息
		card.setUserId(user.getUserId());
		card.setCardStatus(3);
		cardService.updateCardByNumber(card);
		// 新增充值账单
		Prepaid prepaid = new Prepaid();
		prepaid.setPrepUserId(user.getUserId());
		prepaid.setPrepCardId(card.getCardId());
		prepaid.setCreateTime(new Date());
		prepaidService.addPrepaid(prepaid);
		return "success";
	}
	
	/**
	 * 查询用户密保卡额度
	 * @return
	 */
	@RequestMapping("getCardAmount")
	@ResponseBody
	public String getCardAmount() {
		log.info("查询用户密保卡额度");
		User user = userService.selectById(((User) request.getSession().getAttribute("user")).getUserId());
		List<Card> cardList = cardService.selectByUserId(user.getUserId());
		BigDecimal amount = new BigDecimal("0");
		for (Card card : cardList) {
			amount = amount.add(card.getCardAmount());
		}
		request.getSession().setAttribute("amount", amount);
		return "success";
	}
	
	/**
	 * 查询用户充值账单
	 * @return
	 */
	@RequestMapping("getPrepaid")
	@ResponseBody
	public String getPrepaid() {
		log.info("查询用户充值账单");
		User user = (User)request.getSession().getAttribute("user");
		List<Prepaid> prepaidList = prepaidService.selectPrepaidByUserId(user.getUserId());
		List<Card> cardList = new ArrayList<Card>();
		for (Prepaid prepaid : prepaidList) {
			Card card = cardService.selectById(prepaid.getPrepCardId());
			cardList.add(card);
		}
		request.getSession().setAttribute("prepaidList", prepaidList);
		request.getSession().setAttribute("cardList", cardList);
		return "success";
	}
	
	/**
	 * 查询用户消费记录
	 * @return
	 */
	@RequestMapping("getExpense")
	@ResponseBody
	public String getExpense() {
		User user = (User)request.getSession().getAttribute("user");
		List<Expense> expenseList = expenseService.selectByUserId(user.getUserId());
		request.getSession().setAttribute("expenseList", expenseList);
		return "success";
	}
}
