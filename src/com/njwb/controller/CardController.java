package com.njwb.controller;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njwb.pojo.Card;
import com.njwb.pojo.Province;
import com.njwb.pojo.VertificationCode;
import com.njwb.service.CardService;
import com.njwb.service.ProvinceService;

@RequestMapping("card")
@Controller
public class CardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	CardService cardService;
	
	@Autowired
	ProvinceService provinceService;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * 分页查询密保卡
	 * @param cardNumber
	 * @param cardProvId
	 * @param cardStartTime
	 * @param cardEndTime
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("selectCards")
	@ResponseBody
	public String selectCards(String cardNumber, Integer cardProvId, String cardStartTime, String cardEndTime, Integer pageNo, Integer pageSize) {
		log.info("分页查询密保卡");
		Map<String, Object> map = new HashMap<String, Object>();
		//TODO 参数合法性校验
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 5 : pageSize;
		//pageNo,pageSize不合法，给默认值
		//pageNo的判断需要考虑，最小值，最大值
		
		map.put("cardNumber", cardNumber);
		map.put("cardProvId", cardProvId);
		
		//计算总页数， 总数据量/每页显示数量
		int count = cardService.vagueSelectCount(map);
		int totalPage = count % pageSize > 0 ? count/pageSize + 1: count/pageSize;
		
		//分页，开始位置，结束位置
		//页面传入参数，一般有两个，pageNo(页码),pageSize（每页显示数量）
		int startIndex = (pageNo-1)*pageSize + 1;
		int endIndex = pageNo * pageSize;
		map.put("startIndex", startIndex);
		map.put("endIndex", endIndex);
		
		map.put("cardStartTime", cardStartTime);
		map.put("cardEndTime", cardEndTime);
		
		List<Card> cardList = cardService.vagueSelectCard(map);
		List<Province> provList = provinceService.selectAllProv();
		Map<Integer, String> existProvCard = new HashMap<Integer, String>();
		for (Card card : cardList) {
			if (!existProvCard.containsKey(card.getCardProvId())) {
				for (Province province : provList) {
					if (province.getProvId() == card.getCardProvId()) {
						existProvCard.put(province.getProvId(), province.getProvName());
						continue;
					}
				}
			}
		}
		
		
		//页面需要啥，给啥
		request.getSession().setAttribute("existProvCard", existProvCard);
		request.getSession().setAttribute("provList", provList);
		request.getSession().setAttribute("cardList", cardList);
		request.getSession().setAttribute("pageNo", pageNo);
		request.getSession().setAttribute("totalPage", totalPage);
		request.getSession().setAttribute("cardNumber", cardNumber);
		request.getSession().setAttribute("cardStartTime", cardStartTime);
		request.getSession().setAttribute("cardEndTime", cardEndTime);
		request.getSession().setAttribute("cardProvId", cardProvId);
		return "success";
	}
	
	/**
	 * 新增密保卡
	 * @param num
	 * @param cardProvId
	 * @param cardAmount
	 * @param cardStartTime
	 * @param cardEndTime
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("add")
	@ResponseBody
	public String add(Integer num, Integer cardProvId, String cardAmount, String startTime, String endTime) throws ParseException {
		log.info("添加密保卡");
		System.out.println(startTime);
		System.out.println(endTime);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		// 金钱类型转换
		BigDecimal amount = new BigDecimal(cardAmount);
		Integer status;
		Date now = new Date();
		if (now.compareTo(df.parse(startTime)) == -1) {
			status = 1;
		}else if (now.compareTo(df.parse(endTime)) == 1) {
			status = 4;
		}else {
			status = 2;
		}
		for (int i = 0;i < num;i++) {
			// 生成四位随机数
			VertificationCode vc = new VertificationCode();
			String pwd = vc.generateRandom();
			Card card = new Card();
			card.setCardPwd(pwd);
			card.setCardAmount(amount);
			card.setCardProvId(cardProvId);
			card.setCardStartTime(df.parse(startTime));
			card.setCardEndTime(df.parse(endTime));
			card.setCardStatus(status);
			cardService.addCard(card);
		}
		return "success";
	}
}
