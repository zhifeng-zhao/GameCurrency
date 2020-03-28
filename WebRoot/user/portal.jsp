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
				<title>游币门户网站</title>
				<link rel="stylesheet" href="css/bootstrap.min.css">
				<link href="css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
				<link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
				<script src="js/jquery.js">
</script>
				<script src="js/bootstrap.min.js">
</script>
				<script src="js/particles.js">
</script>
				<script src="js/app.js">
</script>
				<script src="js/jquery.form.min.js">
</script>
				<style type="text/css">
* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

.content {
	width: 260px;
	margin: 100px auto;
}

.filterinput {
	background-color: rgba(249, 244, 244, 0);
	border-radius: 15px;
	width: 90%;
	height: 30px;
	border: thin solid #FFF;
	text-indent: 0.5em;
	font-weight: bold;
	color: #FFF;
}

#demo-list a {
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
}
</style>
				<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

ul {
	list-style: none;
}

.out {
	width: 350px;
	height: 245px;
	margin: 25px auto;
	position: relative;
}

.img li {
	position: absolute;
	top: 0px;
	left: 0px;
	display: none
}

.out .num {
	position: absolute;
	bottom: 0px;
	left: 0px;
	font-size: 0px;
	text-align: center;
	width: 100%;
}

.num li {
	width: 20px;
	height: 20px;
	background: #666666;
	color: #FFFFFF;
	text-align: center;
	line-height: 20px;
	display: inline-block;
	font-size: 16px;
	border-radius: 50%;
	margin-right: 10px;
	cursor: pointer;
}

.out .btn {
	position: absolute;
	top: 52%;
	margin-top: -30px;
	width: 45px;
	height: 60px;
	background: rgba(0, 0, 0, 0.5);
	color: #FFFFFF;
	text-align: center;
	line-height: 60px;
	font-size: 40px;
	display: none;
	cursor: pointer;
}

.out .num li.active-1 {
	background: #AA0000;
	margin-left: 150px;
}

.out:hover .btn {
	display: block
}

.out .left {
	left: 0px;
}

.out .right {
	right: -150px;
}

#leftNav {
	margin-left: 87px;
}
</style>
				<script src="js/jquery-accordion-menu.js" type="text/javascript">
</script>
				<script type="text/javascript">
// 游客登陆加载页面数据
var url = location.href;
var times = url.split("?");
if (times[1] != 1) {
	url += "?1";
	$.ajax( {
		url : "user/getPortal.do",
		async : false,
		type : "get",
		data : {},
		dataType : "text",
		success : function(result) {
		}
	});
	self.location.replace(url);
}
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
	$("#search").on('click', function() {
		var typeId = $("#typeSelector option:selected").val();
		var gameName = $("#gameName").val();
		$.ajax( {
			url : "game/userQueryGame.do",
			type : "post",
			data : {
				"typeId" : typeId,
				"gameName" : gameName
			},
			dataType : "text",
			success : function(result) {
				window.location.href = "user/typeDetail.jsp";
			}
		});
	});
	$("#userDetail").on('click', function() {
		$.ajax( {
			url : "user/getCardAmount.do",
			async:false,
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
			async:false,
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
			async:false,
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
								<a class="navbar-brand" href="user/portal.jsp">游币手机下载门户网站</a>
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
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
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
										<li>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</li>
										<li>
												<select id="typeSelector" class="form-control">
														<c:forEach var="ls" items="${gameTypeList}">
																<option value="${ls.typeId}">
																		${ls.typeName}
																</option>
														</c:forEach>
												</select>
										</li>
										<li>
												<input id="gameName" type="text" class="form-control" />
										</li>
										<li>
												<a id="search" class="btn btn-primary ">查询</a>
										</li>
								</ul>
						</div>
				</div>
				<div id="nail1" class="container">
						<div class="row">
								<div class="col-md-6 ">
										<div class="out">
												<!--上面-->
												<ul class="img">
														<c:forEach var="ls" items="${gameList}">
																<li>
																		<a href="game/userGetDetail.do?gameId=${ls.gameId}"> <img src="/img/${ls.gameScreen.split('\\|')[0]}" width="500" height="300" alt="" /> </a>
																</li>
														</c:forEach>
												</ul>
												<!--下面-->
												<ul class="num">
												</ul>
												<div class="left btn">
														&lt;
												</div>
												<div class="right btn">
														&gt;
												</div>
										</div>
								</div>
								<div class="col-md-5 col-md-offset-1">
										<div class="row">
												&nbsp;
										</div>
										<table class="table">
												<thead>
														<tr>
																<th>
																		新闻公告
																</th>
														</tr>
												</thead>
												<tbody>
														<tr>
																<td>
																		未开放板块
																</td>
														</tr>
												</tbody>
										</table>
								</div>
						</div>
						<div class="row">
								&nbsp;
						</div>
						<div class="row">
								&nbsp;
						</div>
						<div class="row">
								<div class="col-md-12 ">
										<div id="leftNav" class="col-md-2">
												<div id="jquery-accordion-menu" class="jquery-accordion-menu red">
														<div class="jquery-accordion-menu-header" id="form"></div>
														<ul id="demo-list">
																<c:forEach var="ls" items="${gameTypeList}">
																		<li>
																				<a href="gameType/userGetGames.do?gameTypeId=${ls.typeId}"><img src="/img/${ls.typePicture}" width="50" height="50" />${ls.typeName}</a>
																		</li>
																</c:forEach>
														</ul>
												</div>
										</div>
										<div id="nail2" class="col-md-8 col-md-offset-1">
												<div class="row">
														<div class="col-md-6">
																<h2>
																		热销商品
																</h2>
														</div>
												</div>
												<c:if test="${gameList.size() >= 6}">
													<c:forEach var="i" begin="0" end="5" varStatus="xh">
															<div class="col-md-4 col-sm-6 ">
																	<div class="thumbnail">
																			<img src="/img/${gameList.get(xh.index).gameCover}" width="150" height="150" alt="">
																			<div class="caption">
																					<h3>
																							${gameList.get(xh.index).gameName}
																					</h3>
																					<p>
																							<a href="game/userGetDetail.do?gameId=${gameList.get(xh.index).gameId}" class="btn btn-primary">游戏详情</a>
																					</p>
																			</div>
																	</div>
															</div>
													</c:forEach>
												</c:if>
												<c:if test="${gameList.size() < 6}">
												<c:forEach var="ls" items="${gameList}">
													<div class="col-md-4 col-sm-6 ">
																	<div class="thumbnail">
																			<img src="/img/${ls.gameCover}" width="150" height="150" alt="">
																			<div class="caption">
																					<h3>
																							${ls.gameName}
																					</h3>
																					<p>
																							<a href="game/userGetDetail.do?gameId=${ls.gameId}" class="btn btn-primary">游戏详情</a>
																					</p>
																			</div>
																	</div>
															</div>
												</c:forEach>
												</c:if>
										</div>
										<!-- <div class="col-md-4 col-sm-6 ">该游戏类型下没有提供可下载游戏</div> -->
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
				<script type="text/javascript">
$(function() {

	$("#123").click(function() {
		$("#myModal").modal('hide');
	});
});

(function($) {
	$.expr[":"].Contains = function(a, i, m) {
		return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
	};
	function filterList(header, list) {
		//@header 头部元素
		//@list 无需列表
		//创建一个搜素表单
		var form = $("<form>").attr( {
			"class" : "filterform",
			action : "#"
		}), input = $("<input>").attr( {
			"class" : "filterinput",
			type : "text"
		});
		$(form).append(input).appendTo(header);
		$(input).change(function() {
			var filter = $(this).val();
			if (filter) {
				$matches = $(list).find("a:Contains(" + filter + ")").parent();
				$("li", list).not($matches).slideUp();
				$matches.slideDown();
			} else {
				$(list).find("li").slideDown();
			}
			return false;
		}).keyup(function() {
			$(this).change();
		});
	}
	$(function() {
		filterList($("#form"), $("#demo-list"));
	});
})(jQuery);
jQuery(document).ready(function() {
	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

});

$(function() {
	//顶部导航切换
	$("#demo-list li").click(function() {
		$("#demo-list li.active").removeClass("active");
		$(this).addClass("active");
	});
});
$(".classname img").addClass("carousel-inner img-responsive img-rounded");
</script>
		</body>
</html>
