<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <% String path = request.getContextPath(); String basePath =
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

<title>游戏列表</title>


<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/jquery.form.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/particles.js"></script>
<script src="js/app.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("[name='getDetail']").on('click', function() {
			$(this).attr("href", "game/getDetail.do?gameId=" + $(this).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().html() + "&dest=details");
		});
		$("[name='update']").on('click', function() {
			$(this).attr("href", "game/getDetail.do?gameId=" + $(this).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().html() + "&dest=update");
		});
		$("[name='gameType']").val($("#typeSelector option:selected").val());
		$("#delete").on('click', function() {
			if ($('input:checkbox:checked').length == 0) {
				alert("请选择游戏！");
				return;
			}
			if (confirm("确认删除操作？")) {
				$.each($('input:checkbox'), function() {
					if(this.checked) {
						$.ajax({
				  			url:"game/delete.do",
				  			type:"get",
				  			data:{"gameId":$(this).parent().next().html()},
				  			dataType:"text",
				  			success:function(result){
								getGames("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryType")%>",<%=session.getAttribute("pageNo")%>);
								window.location.reload();
				  			}
				  		});
					}
				});
			}
		});
		$("#all").on('click', function() {
			$("input[name='opt']").prop("checked", this.checked);
		});
		$("input[name='opt']").on('click', function() {
			var $opts = $("input[name='opt']");
			$("#all").prop("checked", $opts.length == $opts.filter(":checked".length)?true:false);
		});
		function getGames(queryName, queryType, pageNo) {
			$.ajax({
		  			url:"game/vagueSelectGames.do",
		  			async:false,
		  			type:"get",
		  			data:{"queryName":queryName,
		  				  "queryType":queryType,
		  				  "pageNo":pageNo,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  			}
		  		});
		}
		$("#vagueSelect").on('click', function() {
			getGames($("#queryName").val(),$("#selector option:selected").val(),1);
			window.location.reload();
		});
		$("#prePage").on('click', function() {
			var pageNo = <%=session.getAttribute("pageNo")%> - 1;
			if (pageNo == 0) {
				alert("已经是第一页！");
				return;
			}
			getGames("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryType")%>",pageNo);
			window.location.reload();
		});
		$("#nextPage").on('click', function() {
			var pageNo = <%=session.getAttribute("pageNo")%> + 1;
			if (pageNo > <%=session.getAttribute("totalPage")%>) {
				alert("已经是最后一页！");
				return;
			}
			getGames("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryType")%>",pageNo);
			window.location.reload();
		});
		$(".pageBtn").on('click', function() {
			var pageNo = $(this).html();
			getGames("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryType")%>",pageNo);
			window.location.reload();
		});
		// 金钱正则
		var isNum = /^\d+(\.\d+)?$/;
		// ajaxForm返回请求结果
		$("#addForm").ajaxForm(function(data) {
			if (data == "game_name_exist") {
				alert("该游戏名已存在");
			}else if (data == "type_status_error") {
				alert("游戏类型错误");
			}else if (data == "success") {
				alert("添加成功");
				$.ajax({
		  			url:"game/vagueSelectGames.do",
		  			async:false,
		  			type:"get",
		  			data:{"queryName":"",
		  				  "queryType":"",
		  				  "pageNo":1,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  					window.location.href = "/GameCurrency/game/game.jsp";
		  			}
		  		});
			}
		});
		// 新增表单提交验证
		$("#addForm").bind("submit", function() {
			if ($("[name='gameName']").val() == "") {
				alert("游戏名称不能为空");
				return false;
			}else if ($("[name='gameDevelopers']").val() == "") {
				alert("开发商不能为空");
				return false;
			}else if ($("[name='gameIntroduction']").val() == "") {
				alert("游戏简介不能为空");
				return false;
			}else if ($("[name='gameDetail']").val() == "") {
				alert("游戏详情不能为空");
				return false;
			}else if ($("[name='gameFiling']").val() == "") {
				alert("备案号不能为空");
				return false;
			}else if ($("[name='gameCover']").val() == "") {
				alert("封面图片不能为空");
				return false;
			}else if ($("[name='gameScreen1']").val() == "") {
				alert("内容图片1不能为空");
				return false;
			}else if ($("[name='gameScreen2']").val() == "") {
				alert("内容图片2不能为空");
				return false;
			}else if ($("[name='gameScreen3']").val() == "") {
				alert("内容图片3不能为空");
				return false;
			}else if ($("[name='gameTriffe']").val() == "") {
				alert("话费价格不能为空");
				return false;
			}else if ($("[name='gameCurrency']").val() == "") {
				alert("游币价格不能为空");
				return false;
			}else if (!isNum.test($("[name='gameTriffe']").val())) {
				alert("话费价格格式有误");
				return false;
			}else if (!isNum.test($("[name='gameCurrency']").val())) {
				alert("游币价格格式有误");
				return false;
			}
		});
		// 监听option选中状态
		$("#typeSelector").change(function() {
			$("[name='gameType']").val($("#typeSelector option:selected").val());
		});
	});
</script>
</head>
<body>
	<div id="container">
		<div class="page-header">
			<h2>游戏列表</h2>
		</div>
		<form action="">
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">游戏名称</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input id="queryName" type="text" 
								class="form-control" value="<%=session.getAttribute("queryName")%>"/>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-4">
							<span class="btn btn-default">游戏类型</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<select id="selector"  class="form-control">
								<c:forEach var="ls" items="${allTypeMap}">
									<c:if test="${ls.key == queryType}">
										<option value="${ls.key}" selected="selected">${ls.value}</option>
									</c:if>
									<c:if test="${ls.key != queryType}">
										<option value="${ls.key}">${ls.value}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>

				</div>
				<div class="col-xs-6 col-sm-4">
					<input id="vagueSelect" type="button" class="btn btn-primary" id="search" value="查询" />
				</div>
			</div>
		</form>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<a class="btn btn-primary" data-toggle="modal"
					data-target="#myModal"> <span class="glyphicon glyphicon-plus"></span>
					新增</a>
				<a id="delete" class="btn btn-danger" > <span
					class="glyphicon glyphicon-trash"></span> 删除</a>
			</div>
		</div>
		
		<div class="modal fade" id="myModal" tabindex="-1" >
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">新增游戏</h4>
							</div>
							<div class="modal-body">
								<form id="addForm" class="form-horizontal" action="game/add.do" 
								enctype="multipart/form-data" method="post"  >
									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">游戏名称</label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												name="gameName" placeholder="请输入游戏名称">
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游戏状态</label>
										<div class="col-sm-10">
											<label> <input type="radio" name="gameStatus" value="1" checked="checked"> 商用 </label>
											<label> <input type="radio" name="gameStatus" value="2"> 下线</label>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游戏类型</label>
										<div class="col-sm-10">
												<select id="typeSelector"  class="form-control">
													<c:forEach var="ls" items="${allTypeMap}">
															<option name="typeOpts" value="${ls.key}">${ls.value}</option>
													</c:forEach>
												</select>
												<input type="hidden" name="gameType" value="${allTypeMap}"/>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">开发商</label>
										<div class="col-sm-10">
												<input type="text" class="form-control"
												name="gameDevelopers" placeholder="例(腾讯开发商)">
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游戏简介</label>
										<div class="col-sm-10">
												<textarea class="form-control"
												name="gameIntroduction"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游戏详情</label>
										<div class="col-sm-10">
												<textarea class="form-control"
												name="gameDetail"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">备案号</label>
										<div class="col-sm-10">
												<input type="text" class="form-control"
												name="gameFiling" placeholder="例(文网游备字(2020) M-CBG 0011号)">
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">封面图片</label>
										<div class="col-sm-10">
												<input type="file" name="gameCover"/>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">内容图片(三张)</label>
										<div class="col-sm-10">
												<input type="file" name="gameScreen1"/>
												<input type="file" name="gameScreen2"/>
												<input type="file" name="gameScreen3"/>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">话费价格</label>
										<div class="col-sm-10">
												<input type="text" class="form-control"
												name="gameTriffe">
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游币价格</label>
										<div class="col-sm-10">
												<input type="text" class="form-control"
												name="gameCurrency">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-default">添加游戏</button>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>

		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-11">
				<div class="table-responsive"
					style="vertical-align: middle;text-align: center;">
					<table id="searchTable"
						class="table table-bordered table-hover table-condensed  ">
						<tr>
							<td><input type="checkbox" id="all" value="全选"
								 /> 全选</td>
							<td>ID</td>
							<td>游戏名称</td>
							<td>游戏类别</td>
							<td>游戏封面</td>
							<td>状态</td>
							<td>游币价格</td>
							<td>话费价格</td>
							<td>创建时间</td>
							<td>更新时间</td>
							<td>操作</td>
						</tr>
						<c:forEach var="ls" items="${gameList}">
							<tr>
								<td><input type='checkbox' 
									name='opt' value='' />
								</td>
								<td>${ls.gameId}</td>
								<td>${ls.gameName}</td>
								<td>${typeMap.get(ls.gameType)}</td>
								<td>
									<div class="col-xs-6  col-md-offset-4">
										<img class="img-responsive" width="33" height="30"
											src="/resource/${ls.gameCover}" />
									</div></td>
								<td>
									${ls.gameStatus == 1 ? "商用":"下线"}
								</td>
								<td>${ls.gameTriffe}</td>
								<td>${ls.gameCurrency}</td>
								<td><fmt:formatDate value="${ls.createTime}" pattern="yyyy年MM月dd日HH点mm分ss秒"/></td>
								<td>
									<c:if test="${ls.updateTime == null}">未曾修改</c:if>
									<c:if test="${ls.updateTime != null}">
										<fmt:formatDate value="${ls.updateTime}" pattern="yyyy年MM月dd日HH点mm分ss秒"/>
									</c:if>
								</td>
								<td>
									<div class="col-xs-6 col-sm-2 col-md-offset-3">
										<a name="update" class="btn btn-info btn-sm"
											href="game/updateGame.jsp">
											<span class="glyphicon glyphicon-pencil"></span>修改</a>
									</div>
									<div class="col-xs-6 col-sm-4 col-md-offset-1">
										<a name="getDetail" class="btn btn-warning btn-sm"
											href="#">
											<span class="glyphicon glyphicon-pencil"></span>详情</a>
									</div></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div id="pages">
			<div>
				<button id="prePage">上一页</button>
				<c:forEach var="no" begin="1" end="${totalPage}">
					<c:if test="${no == pageNo}">
						<button class="pageBtn" disabled="disabled" style="background-color:blue;color:white;">${no}</button>
					</c:if>
					<c:if test="${no != pageNo}">
						<button class="pageBtn">${no}</button>
					</c:if>
				</c:forEach>
				<button id="nextPage">下一页</button>
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
