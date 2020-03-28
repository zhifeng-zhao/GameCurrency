package com.njwb.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njwb.service.VertificationCodeService;


@RequestMapping("vertify")
@Controller
public class VertificationCodeController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	VertificationCodeService vertificationCodeService;
	
	/**
	 * ajax请求
	 * 请求获取验证码
	 * @param name
	 * @return
	 */
	@RequestMapping("getCode")
	@ResponseBody
	public String getCode(String phone) {
		log.info("ajax--->请求获取验证码");
		return vertificationCodeService.addHistory(phone);
	}
}
