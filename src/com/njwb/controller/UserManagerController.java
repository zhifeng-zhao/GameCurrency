package com.njwb.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.njwb.pojo.UserManager;
import com.njwb.service.UserManagerService;
import com.njwb.service.VertificationCodeService;

@RequestMapping("manager")
@Controller
public class UserManagerController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	UserManagerService userManagerService;
	
	@Autowired
	VertificationCodeService vertificationCodeService;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * ajax请求
	 * 根据姓名查询管理员
	 * @param name
	 * @return
	 */
	@RequestMapping("queryByName")
	@ResponseBody
	public String queryByName(String name) {
		log.info("ajax--->根据姓名:" + name +"查询管理员");
		UserManager userManager = userManagerService.queryByName(name);
		if (userManager == null) return "error";
		else return "success";
	}
	
	/**
	 * ajax请求
	 * 根据姓名查询手机号
	 * @param name
	 * @return
	 */
	@RequestMapping("queryPhoneByName")
	@ResponseBody
	public String queryPhoneByName(String name) {
		log.info("ajax--->根据姓名:" + name + "查询手机号");
		UserManager userManager = userManagerService.queryByName(name);
		if (userManager == null) return "error";
		else return userManager.getManagerPhone();
	}
	
	/**
	 * ajax请求
	 * 登陆
	 * @param name
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public String login(String name, String phone, String pwd, String code) {
		// 登陆验证
		log.info("ajax-->登陆验证-->" + "name:" + name + "pwd:" + pwd + "code:" + code);
		// 根据用户名查询管理员
		UserManager userManager = userManagerService.queryByName(name);
		log.info("查询结果：" + userManager.toString());
		// 判断管理员是否存在
		if (userManager == null) return "user_not_exist";
		// 判断密码是否匹配
		else if (!userManager.getManagerPwd().equals(pwd)) return "pwd_error";
		// 判断验证码是否存在
		else if (vertificationCodeService.queryCreateTimeByPhoneAndCode(phone, code) == null)
			return "code_not_exist";
		// 判断验证码是否超时
		else {
			Date createTime = vertificationCodeService.queryCreateTimeByPhoneAndCode(phone, code);
			Date currTime = new Date();
			long diff = currTime.getTime() - createTime.getTime();
			long sec = diff / 1000;
			// 登陆成功
			if (sec <= 60) return "success";
			// 验证码超时
			else return "code_out_of_time";
		}
	}
	
	/**
	 * 跳转到管理主页
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping("toIndex")
	public String toIndex(String name) {
		request.getSession().setAttribute("userName", name);
		return "redirect:/index.jsp";
	}
	
	/**
	 * 退出登陆
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping("logout")
	public String logout() {
		log.info("退出登陆");
		request.getSession().removeAttribute("userName");
		return "redirect:/login.jsp";
	}
}
