<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.njwb.pojo.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
		<head>
				<base href="<%=basePath%>">
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<meta name="description" content="">
				<meta name="author" content="">
				<title>游币游戏详情</title>
				<link rel="stylesheet" href="css/bootstrap.min.css">
				<link rel="stylesheet" href="css/index.css" />
				<script src="js/jquery.js">
</script>
				<script src="js/bootstrap.js">
</script>
				<script src="js/jquery.form.min.js">
</script>
				<script type="text/javascript">
$(function() {
	$("#logout").on('click', function() {
		$.ajax( {
			url : "user/logout.do",
			type : "post",
			data : {},
			dataType : "text",
			success : function(result) {
			}
		});
	});
	$("#rechargeForm").ajaxForm(function(data) {
		if (data == "user_status_banned")
			alert("用户被禁用");
		else if (data == "card_not_exist")
			alert("该密保卡不存在");
		else if (data == "prov_error")
			alert("密保卡与当前省份不匹配");
		else if (data == "card_status_error")
			alert("该密保卡不可用");
		else if (data == "pwd_error")
			alert("密保卡密码错误");
		else if (data == "success") {
			alert("充值成功");
			self.location.replace("user/portal.jsp")
		}
	});
	$("#rechargeForm").bind("submit", function() {
		if ($("[name='cardNumber']").val() == "") {
			alert("卡号不能为空");
			return false;
		} else if ($("[name='cardPwd']").val() == "") {
			alert("密码不能为空");
			return false;
		}
	});
	$("#userDetail").on('click', function() {
		$.ajax( {
			url : "user/getCardAmount.do",
			async : false,
			type : "post",
			data : {},
			dataType : "text",
			success : function(result) {
			}
		});
	});
	$("#prepaid").on('click', function() {
		$.ajax( {
			url : "user/getPrepaid.do",
			async : false,
			type : "post",
			data : {},
			dataType : "text",
			success : function(result) {
			}
		});
	});
	$("#expense").on('click', function() {
		$.ajax( {
			url : "user/getExpense.do",
			async:false,
			type : "get",
			data : {},
			dataType : "text",
			success : function(result) {
			}
		});
	});
	$("#purchase").on('click', function() {
		var userId = $("#userId").val();
		if (userId == null) {
			alert("请先登录再下载");
			return;
		}
		var gameId = $("#gameId").val();
		var operation = $("#operaSelector option:selected").val();
		$.ajax( {
			url : "game/download.do",
			type : "post",
			data : {"userId":userId,
					"gameId":gameId,
					"operation":operation},
			dataType : "text",
			success : function(result) {
				if (result == "user_not_exist") 
					alert("用户不存在");
				else if (result == "user_status_banned") 
					alert("用户被禁用");
				else if (result == "user_tariffe_error")
					alert("用户话费余额不足");
				else if (result == "tariffe_purchase_success")
					alert("用户话费购买成功");
				else if (result == "user_currency_error")
					alert("用户密保额度与游币均不足");
				else if (result == "currency_purchase_success")
					alert("用户游币购买成功");
				else if (result == "card_purchase_success")
					alert("用户密保额度购买成功");
				else if (result == "second_download_success")
					alert("用户第二次下载成功");
				else if (result == "third_download_success")
					alert("用户第三次下载成功");
				else if (result == "operatin_error")
					alert("购买方式错误");
			}
		});
	});
});
</script>
		</head>
		<body>
				<c:if test="${user != null}">
					<input type="hidden" id="userId" value="${user.userId}"/>
				</c:if>
				<input type="hidden" id="gameId" value="${selectedGame.gameId}"/>
				<div class="container">
						<nav class="navbar navbar-default">
						<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
										<span class="sr-only">切换导航</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="portal.html">游币手机下载门户网站</a>
						</div>
						<div class="collapse navbar-collapse" id="example-navbar-collapse">
								<ul class="nav navbar-nav">
								</ul>
								<ul class="nav navbar-nav navbar-right">
										<c:if test="${user != null}">
												<li class="dropdown">
														<a href="user/portal.jsp">欢迎${user.userName}</a>
												</li>
										</c:if>
										<c:if test="${user == null}">
												<li class="dropdown">
														<a href="user/login.jsp">登录</a>
												</li>
												<li class="dropdown">
														<a href="user/register.jsp">注册</a>
												</li>
										</c:if>
										<c:if test="${user != null}">
												<li class="dropdown">
														<a href="#" class="dropdown-toggle " data-toggle="dropdown">个人中心<b class="caret"></b> </a>
														<ul class="dropdown-menu">
																<li>
																		<a data-toggle="modal" data-target="#myModal">密保卡充值</a>
																</li>
																<li>
																		<a id="prepaid" href="user/prepaid.jsp">充值记录</a>
																</li>
																<li>
																		<a id="userDetail" href="user/userDetail.jsp">账户信息</a>
																</li>
																<li>
																		<a id="expense" href="user/expense.jsp">消费记录</a>
																</li>
																<li class="divider"></li>
																<li>
																		<a id="logout" href="user/login.jsp">退出</a>
																</li>
														</ul>
												</li>
										</c:if>
								</ul>
						</div>
						</nav>
				</div>
				<div class="modal fade" id="myModal" tabindex="-1">
						<div class="modal-dialog">
								<div class="modal-content">
										<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
														&times;
												</button>
												<h4 class="modal-title" id="myModalLabel">
														密保卡充值
												</h4>
										</div>
										<div class="modal-body">
												<form id="rechargeForm" class="form-horizontal" action="user/recharge.do" enctype="multipart/form-data" method="post">
														<div class="form-group">
																<label for="firstname" class="col-sm-2 control-label">
																		卡号
																</label>
																<div class="col-sm-10">
																		<input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="请输入卡号">
																		<input type="hidden" name="userName" value="${user.userName}" />
																</div>
														</div>
														<div class="form-group">
																<label for="lastname" class="col-sm-2 control-label">
																		密码
																</label>
																<div class="col-sm-10">
																		<input type="text" class="form-control" placeholder="请输入卡密码" name="cardPwd" />
																</div>
														</div>
														<div class="form-group">
																<div class="col-sm-offset-2 col-sm-10">
																		<button type="submit" class="btn btn-default">
																				确认充值
																		</button>
																</div>
														</div>
												</form>
										</div>
								</div>
						</div>
				</div>
				<div class="row" style="background-color: #CCC; overflow: hidden;" onLoad="init()">
						<div class="col-md-12">
								<ul class="nav nav-pills col-md-offset-3">
										<li class=>
												<a href="user/portal.jsp" class="btn btn-primary">首页</a>
										</li>
										<c:forEach var="ls" items="${gameTypeList}">
												<li>
														<a href="gameType/userGetGames.do?gameTypeId=${ls.typeId}" class="btn btn-primary">${ls.typeName}</a>
												</li>
										</c:forEach>
								</ul>
						</div>
				</div>
				<div class="row">
						&nbsp;
				</div>
				<div class="container">
						<form action="" method="post">
								<div class="row">
										<div class="col-md-4 col-sm-4">
												<img src="/resource/${selectedGame.gameCover}" width="450px;" alt="" />
										</div>
										<div class="col-md-6 col-md-offset-1">
												<p>
														<strong>游戏名称:</strong>${selectedGame.gameName}
												</p>
												<p>
														<strong>游戏类型:</strong>${selectedGameType}
												</p>
												<p>
														<strong>话费价格:</strong>${selectedGame.gameTriffe}
												</p>
												<p>
														<strong>游币价格:</strong>${selectedGame.gameCurrency}
												</p>
												<p>
														<strong>开发商:</strong>${selectedGame.gameDevelopers}
												</p>
												<p>
														<strong>备案号:</strong>${selectedGame.gameFiling}
												</p>
												<p>
														<strong>游戏简介:</strong>${selectedGame.gameDetail}
												</p>
												<p>
														<strong>游戏状态:</strong>${selectedGame.gameStatus == 1 ? "商用":"下线"}
												</p>
												<p>
														<strong>最新发布时间:</strong>
														<c:if test="${selectedGame.updateTime == null}">
															<fmt:formatDate value="${selectedGame.createTime}" pattern="yyyy年MM月dd日" />
														</c:if>
														<c:if test="${selectedGame.updateTime != null}">
															<fmt:formatDate value="${selectedGame.updateTime}" pattern="yyyy年MM月dd日" />
														</c:if>
												</p>
												<p>
														<strong>支付方式:</strong>
														<select id="operaSelector">
																<option value="1" selected="selected">
																		话费支付
																</option>
																<option value="2">
																		游币支付
																</option>
														</select>
												</p>
												<p>
														<input id="purchase" type="button" class="btn btn-success" value="确认购买">
														<a class="btn btn-warning" href="user/portal.jsp">返回首页</a>
												</p>
										</div>
								</div>
								<div class="row">
										<div class="col-md-12">
												<div class="panel panel-info">
														<div class="panel-heading">
																<h3 class="panel-title">
																		游戏简介
																</h3>
														</div>
														<div class="panel-body">
																${selectedGame.gameIntroduction}
														</div>
												</div>
										</div>
								</div>
								<div class="row col-md-12">
										<div class="panel panel-warning ">
												<div class="panel-heading">
														<h3 class="panel-title">
																游戏画面截图
														</h3>
												</div>
												<div class="panel-body">
														<div class="carousel content-main">
																<ul class="list">
																		<li>
																				<img src="/resource/${selectedGame.gameScreen.split('\\|')[0]}" />
																		</li>
																		<li>
																				<img src="/resource/${selectedGame.gameScreen.split('\\|')[1]}" />
																		</li>
																		<li>
																				<img src="/resource/${selectedGame.gameScreen.split('\\|')[2]}" />
																		</li>
																</ul>
														</div>
												</div>
										</div>
										<script src="js/index.js">
</script>
										<script>

var setting = {
	width : 500,
	height : 270,
	postWidth : 658,
	postHeight : 270,
	scale : 0.8,
	verticalAlign : "center",
	speed : 500
};
$(".carousel").attr("data-setting", '{ "width":900,"height":411,"postWidth":658}');
Carousel.init($(".carousel"));
</script>
								</div>
						</form>
				</div>
				<div class="row">
						<div class="container">
								<hr />
								<div class="col-md-4 col-md-offset-5">
										&copy;2016-2017 portal.com 版权所有
								</div>
						</div>
				</div>
		</body>
</html>
