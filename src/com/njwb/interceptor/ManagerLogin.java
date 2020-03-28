package com.njwb.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class ManagerLogin implements HandlerInterceptor {
	private Logger log = Logger.getLogger(this.getClass());

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		String urlString = request.getRequestURI();
		if (urlString.endsWith("login.jsp")) {
			return true;
		}
		String contextPath = request.getContextPath();
		//log.info("!!!!!!!!!!!!!!!!!!!!!"+contextPath);
		//System.out.println(contextPath);
		response.sendRedirect(contextPath + "/login.jsp");
		//response.sendRedirect( "localhost:8081/GameCurrency/login.jsp");
		return false;
	}

}
