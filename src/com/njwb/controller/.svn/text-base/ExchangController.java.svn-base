package com.njwb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njwb.pojo.Exchange;
import com.njwb.pojo.Province;
import com.njwb.service.ExchangeService;
import com.njwb.service.ProvinceService;

@RequestMapping("exchange")
@Controller
public class ExchangController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	ExchangeService exchangeService;
	
	@Autowired
	ProvinceService provinceService;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * 分页查询兑换规则
	 * @param provName
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("selectExchanges")
	@ResponseBody
	public String selectExchanges(String provName, Integer pageNo, Integer pageSize) {
		log.info("分页查询兑换规则");
		Map<String, Object> map = new HashMap<String, Object>();
		//TODO 参数合法性校验
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 5 : pageSize;
		//pageNo,pageSize不合法，给默认值
		//pageNo的判断需要考虑，最小值，最大值
		
		map.put("provName", provName);
		
		//计算总页数， 总数据量/每页显示数量
		int count = exchangeService.vagueSelectCount(map);
		int totalPage = count % pageSize > 0 ? count/pageSize + 1: count/pageSize;
		
		//分页，开始位置，结束位置
		//页面传入参数，一般有两个，pageNo(页码),pageSize（每页显示数量）
		int startIndex = (pageNo-1)*pageSize + 1;
		int endIndex = pageNo * pageSize;
		map.put("startIndex", startIndex);
		map.put("endIndex", endIndex);
		
		List<Map<String, Object>> exchangeList = exchangeService.vagueSelectExchange(map);
		List<Map<String, String>> provList = exchangeService.selectProvs();
		List<Province> allProvsList = provinceService.selectAllProv();
		List<Province> ruledProvsList = new ArrayList<Province>();
		for (Map<String, String> map2 : provList) {
			for (Province province : allProvsList) {
				if (province.getProvName().equals(map2.get("PROVNAME"))) {
					ruledProvsList.add(province);
					continue;
				}
			}
		}
		for (Province province : ruledProvsList) {
			allProvsList.remove(province);
		}
		//页面需要啥，给啥
		request.getSession().setAttribute("exchangeList", exchangeList);
		request.getSession().setAttribute("allProvsList", allProvsList);
		request.getSession().setAttribute("provList", provList);
		request.getSession().setAttribute("pageNo", pageNo);
		request.getSession().setAttribute("totalPage", totalPage);
		request.getSession().setAttribute("provName", provName);
		return "success";
	}
	
	/**
	 * 根据id删除兑换规则
	 * @param exchangeId
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public String delete(Integer exchangeId) {
		log.info("删除兑换规则");
		exchangeService.deleteExchangeById(exchangeId);
		return "success";
	}
	
	/**
	 * 新增兑换规则
	 * @param provId
	 * @param exchangeCharge
	 * @param exchangeStatus
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public String add(Integer provId, Integer exchangeCharge, Integer exchangeStatus) {
		log.info("新增兑换规则");
		Exchange exchange = new Exchange();
		if (exchangeCharge == null) {
			return "null_charge";
		}
		System.out.println(provId);
		exchange.setExchangeProvId(provId);
		exchange.setExchangeCharge(exchangeCharge);
		exchange.setExchangeStatus(exchangeStatus);
		exchangeService.addExchange(exchange);
		return "success";
	}
	
	/**
	 * 兑换规则修改带入
	 * @param provName
	 * @param exchangeStatus
	 * @param exchangeCharge
	 * @return
	 */
	@RequestMapping("toUpdate")
	public String toUpdate(Integer selectExchangeId, String selectProvName, Integer exchangeStatus, Integer exchangeCharge) {
		log.info("兑换规则修改带入");
		request.getSession().setAttribute("selectExchangeId", selectExchangeId);
		request.getSession().setAttribute("selectProvName", selectProvName);
		request.getSession().setAttribute("exchangeStatus", exchangeStatus);
		request.getSession().setAttribute("exchangeCharge", exchangeCharge);
		return "redirect:/exchange/updateExchange.jsp";
	}
	
	/**
	 * 根据id修改
	 * @param selectExchangeId
	 * @param exchangeStatus
	 * @param exchangeCharge
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public String update(Integer selectExchangeId, Integer exchangeStatus, Integer exchangeCharge) {
		log.info("修改兑换规则");
		if (exchangeCharge == null) {
			return "null_charge";
		}
		Exchange exchange = new Exchange();
		exchange.setExchangeId(selectExchangeId);
		exchange.setExchangeStatus(exchangeStatus);
		exchange.setExchangeCharge(exchangeCharge);
		exchangeService.updateExchangeById(exchange);
		return "success";
	}
}
