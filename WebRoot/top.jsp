﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML >
<html>
		<head>
				<base href="<%=basePath%>">
				<meta http-equiv="pragma" content="no-cache">
				<meta http-equiv="cache-control" content="no-cache">
				<meta http-equiv="expires" content="0">
				<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
				<meta http-equiv="description" content="This is my page">
				<script type="text/javascript" src="js/jquery.js"></script>
				<link rel="stylesheet" href="css/bootstrap.min.css">
</script>
				<style type="text/css">
</style>
				<script type="text/javascript">
					$(function() {
						if (${userName == null} || ${userName == ""}) {
							alert("请先登录在操作！");
							window.top.location = "/GameCurrency/login.jsp";
						}
						function getDate() {
							var today = new Date();
							var date = today.getFullYear() + "年" + twoDigits(today.getMonth() + 1) + "月" + twoDigits(today.getDate()) + "日";
							var week = " 星期" + "日一二三四五六 ".charAt(today.getDay());
							var time = twoDigits(today.getHours() + ":" + twoDigits(today.getMinutes()) + ":" + twoDigits(today.getSeconds()));
							$("#sysDate").html(date + " " + time + " " + week);
						}
						function twoDigits(val) {
							if (val < 10) return "0" + val;
							return val;
						}
						setInterval(getDate, 1000);
					});
				</script>
		</head>
		<body>
				
				<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
						<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
								</button>
								<a class="navbar-brand">游币后台管理系统</a>
						</div>
						<div id="navbar" class="collapse navbar-collapse ">
								<ul class="nav navbar-nav ">
										<li>
												<a>管理员:${userName }</a>
										</li>
										<li>
												<a id="sysDate"></a>										
										</li>
								</ul>
								<ul class="nav navbar-nav navbar-right">
										<li>
												<a id="logout" href="/GameCurrency/manager/logout.do" target="_top"><span></span>退出</a>
										</li>
								</ul>
						</div>
				</div>
				</nav>
		</body>
</html>
