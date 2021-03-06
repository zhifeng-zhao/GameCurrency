﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.njwb.pojo.Game"%> <% String path = request.getContextPath(); String basePath =
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
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

<title>游戏详情</title>


<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/jquery.form.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#back").on('click', function(e) {
			e.preventDefault();
			history.go(-1);
		});
	});
</script>
</head>
<body>
	<div id="container">
		<div class="page-header text-center">
			<h2>游戏详情</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-offset-4">
				<form class="form-horizontal text-center" >
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr>
								<td>游戏id</td>
								<td>
									<div class="col-sm-10">
										${game.gameId}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏名称</td>
								<td>
									<div class="col-sm-10">
										${game.gameName}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏类型</td>
								<td>
									<div class="col-sm-10">
										${type}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏状态</td>
								<td>
									<div class="col-sm-10">
										${game.gameStatus == 1 ? "商用":"下线"}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏开发商</td>
								<td>
									<div class="col-sm-10">
										${game.gameDevelopers}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏备案号</td>
								<td>
									<div class="col-sm-10">
										${game.gameFiling}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏简介</td>
								<td>
									<div class="col-sm-10">
										${game.gameIntroduction}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏详情</td>
								<td>
									<div class="col-sm-10">
										${game.gameDetail}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏币价格</td>
								<td>
									<div class="col-sm-10">
										${game.gameTriffe}
									</div></td>
							</tr>
							
							<tr >
								<td>话费价格</td>
								<td>
									<div class="col-sm-10">
										${game.gameCurrency}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏封面</td>
								<td>
									<div class="col-sm-10  col-md-offset-4">
										<img class="img-responsive" width="80"
											src="/img/${game.gameCover}" />
									</div></td>
							</tr>
							
							<tr >
								<td>游戏画面截图</td>
								<td>
									 <div class="col-sm-5  col-md-4">
     									<div class="thumbnail">
        									 <img class="img-responsive"   width="100"
											src="/img/${screen1}" />
      									</div>
 									 </div>
 									 <div class="col-sm-4  col-md-4">
     									<div class="thumbnail">
										<img class="img-responsive"   width="100"   src="/img/${screen2}"  width="50" />
      									</div>
 									 </div>
 									 <div class="col-sm-4  col-md-4">
     									<div class="thumbnail">
        									 <img class="img-responsive"    width="100"  
											src="/img/${screen3}" />
      										
      									</div>
 									 </div>
								</td>
							</tr>
							
							<tr >
								<td>创建时间</td>
								<td>
									<div class="col-sm-10">
										<fmt:formatDate value="${game.createTime}" pattern="yyyy年MM月dd日HH点mm分ss秒"/>
									</div></td>
							</tr>
							
							<tr >
								<td>修改时间</td>
								<td>
									<div class="col-sm-10">
										<c:if test="${game.updateTime == null}">未曾修改</c:if>
										<c:if test="${game.updateTime != null}">
											<fmt:formatDate value="${game.updateTime}" pattern="yyyy年MM月dd日HH点mm分ss秒"/>
										</c:if>
									</div></td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-4">
							<div class="form-group">
								<div class="col-sm-offset-10 col-sm-11">
									<button id="back" class="btn btn-warning" >返回上一页</button>
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>

<style>
td {
	vertical-align: middle !important;
}
</style>
</html>
