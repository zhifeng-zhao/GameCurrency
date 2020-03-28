<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
				<script src="js/bootstrap.min.js">
</script>
				<script src="js/jquery.form.min.js">
</script>
				<script type="text/javascript">
$(function() {
	$("#back").on('click', function(e) {
		e.preventDefault();
		history.go(-1);
	});
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
			type : "get",
			data : {},
			dataType : "text",
			success : function(result) {
			}
		});
	});
	$("#expense").on('click', function() {
		$.ajax( {
			url : "user/getExpense.do",
			async : false,
			type : "get",
			data : {},
			dataType : "text",
			success : function(result) {
			}
		});
	});
});
</script>
		</head>
		<body>
				<div class="container">
						<nav class="navbar navbar-default">
						<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
										<span class="sr-only">切换导航</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href=user/portal.jsp>游币手机下载门户网站</a>
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
						<div class="row">
								<div class="col-md-6">
										<div class="table-responsive">
												<table class="table table-striped table-hover">
														<caption>
																账户详情
														</caption>
														<tbody>
																<tr>
																		<td>
																				<strong>用户名:</strong>${user.userName}
																		</td>
																</tr>
																<tr>
																		<td>
																				<strong>密码:</strong>${user.userPwd}
																		</td>
																</tr>
																<tr>
																		<td>
																				<strong>性别:</strong>${user.userSex}
																		</td>
																</tr>
																<tr>
																		<td>
																				<strong>生日:</strong>
																				<fmt:formatDate value="${user.userBirthday}" pattern="yyyy年MM月dd日" />
																		</td>
																</tr>
																<tr>
																		<td>
																				<strong>手机号码:</strong>${user.userPhone}
																		</td>
																</tr>
																<tr>
																		<td>
																				<strong>话费余额:</strong>${user.userTariffe}
																		</td>
																</tr>
																<tr>
																		<td>
																				<strong>游币余额:</strong>${user.userCurrency}
																		</td>
																</tr>
																<tr>
																		<td>
																				<strong>密保额度:</strong>${amount}
																		</td>
																</tr>
														</tbody>
												</table>
												<a id="back" class="btn btn-warning">返回上页</a>
										</div>
								</div>
						</div>
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
