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

<title>Bootstrap后台管理系统</title>


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
		$("#delete").on('click', function() {
			if ($('input:checkbox:checked').length == 0) {
				alert("请选择游戏类型！");
				return;
			}
			if (confirm("确认删除操作？")) {
				$.each($('input:checkbox'), function() {
					if(this.checked) {
						$.ajax({
				  			url:"gameType/delete.do",
				  			async:false,
				  			type:"get",
				  			data:{"typeId":$(this).parent().next().html()},
				  			dataType:"text",
				  			success:function(result){
								getGameTypes("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryStatus")%>",<%=session.getAttribute("pageNo")%>);
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
		function getGameTypes(queryName, queryStatus, pageNo) {
			$.ajax({
		  			url:"gameType/vagueSelectGameTypes.do",
		  			async:false,
		  			type:"get",
		  			data:{"queryName":queryName,
		  				  "queryStatus":queryStatus,
		  				  "pageNo":pageNo,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  			}
		  		});
		}
		$(".updateBtn").on('click', function() {
			var typeId = $(this).prev().prev().prev().prev().prev().prev().html();
			var typeName = $(this).prev().prev().prev().prev().html();
			var typeStatus = $.trim($(this).prev().prev().prev().html()) == "商用" ? 1:2;
			$(this).children("a").attr("href", "gameType/toUpdate.do?typeName=" + typeName + "&typeStatus=" + typeStatus + "&typeId=" + typeId);
		});
		$("#vagueSelect").on('click', function() {
			getGameTypes($("#queryName").val(),$("#selector option:selected").val(),1);
			window.location.reload();
		});
		$("#prePage").on('click', function() {
			var pageNo = <%=session.getAttribute("pageNo")%> - 1;
			if (pageNo == 0) {
				alert("已经是第一页！");
				return;
			}
			getGameTypes("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryStatus")%>",pageNo);
			window.location.reload();
		});
		$("#nextPage").on('click', function() {
			var pageNo = <%=session.getAttribute("pageNo")%> + 1;
			if (pageNo > <%=session.getAttribute("totalPage")%>) {
				alert("已经是最后一页！");
				return;
			}
			getGameTypes("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryStatus")%>",pageNo);
			window.location.reload();
		});
		$(".pageBtn").on('click', function() {
			var pageNo = $(this).html();
			getGameTypes("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryStatus")%>",pageNo);
			window.location.reload();
		});
		// ajaxForm返回请求结果
		$("#addForm").ajaxForm(function(data) {
			if (data == "null_type_name") {
				alert("类型名称不能为空");
			}else if (data == "null_type_name") {
				alert("类型图片不能为空");
			}else if (data == "type_name_exist") {
				alert("该类型名已存在")
			}else if (data == "success") {
				alert("添加成功");
				$.ajax({
		  			url:"gameType/vagueSelectGameTypes.do",
		  			async:false,
		  			type:"get",
		  			data:{"queryName":"",
		  				  "queryStatus":"",
		  				  "pageNo":1,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  					  window.location.href = "/GameCurrency/gameType/gametype.jsp";
		  			}
		  		});
			}
		});
		// 新增表单提交验证
		$("#addForm").bind("submit", function() {
			if ($("[name='typeName']").val() == "") {
				alert("类型名称不能为空");
				return false;
			}else if ($("[name='typePicture']").val() == "") {
				alert("类型图片不能为空");
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div id="container" class="col-sm-12">
		<div class="page-header">
			<h2>游戏类型</h2>
		</div>
		<form action="">
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">类型名称</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input id="queryName" type="text"  class="form-control" value="<%=session.getAttribute("queryName")%>"/>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">状态</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<select id="selector"  class="form-control">
								<c:if test="<%=session.getAttribute(\"queryStatus\").equals(\"1\") || session.getAttribute(\"queryStatus\").equals(\"\")%>">
									<option value="1" selected="selected">商用</option>
									<option value="2">下线</option>
								</c:if>
								<c:if test="<%=session.getAttribute(\"queryStatus\").equals(\"2\")%>">
									<option value="1">商用</option>
									<option value="2" selected="selected">下线</option>
								</c:if>
							</select>
						</div>
					</div>

				</div>
				<div class="col-xs-6 col-sm-4">
					<input id="vagueSelect" type="button" class="btn btn-primary"  value="查询" />
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
								<h4 class="modal-title" id="myModalLabel">新增游戏类型</h4>
							</div>
							<div class="modal-body">
								<form id="addForm" class="form-horizontal" action="gameType/add.do" 
								enctype="multipart/form-data" method="post"  >
									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">类型名称</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardNumber"
												name="typeName" placeholder="请输入类型名称">
											<input type="hidden" name="userId" value="${user.userId}"/>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">状态</label>
										<div class="col-sm-10">
											<label> <input type="radio" name="typeStatus" value="1" checked="checked"> 商用 </label>
											<label> <input type="radio" name="typeStatus" value="2"> 下线</label>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">类型图片</label>
										<div class="col-sm-10">
												<input type="file" name="typePicture"/>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-default">添加游戏类型</button>
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
				<div class="table-responsive " style="vertical-align: middle;text-align: center;">
					<table id="searchTable" class="table table-bordered table-condensed ">
						<tr>
							<td><input  type="checkbox" id="all" value="全选" /> 全选</td>
							<td>ID</td>
							<td>类型图片</td>
							<td>类型名称</td>
							<td>状态</td>
							<td>创建时间</td>
							<td>修改时间</td>
							<td>操作</td>
						</tr>
						<c:forEach var="ls" items="${typeList}">
							<tr>
								<td><input type='checkbox'  name='opt' /></td>
								<td>${ls.typeId}</td>
								<td>
									<div class="col-xs-6  col-md-offset-4">
										<img class="img-responsive" width="33" height="30"
											src="/img/${ls.typePicture}" />
									</div>
								</td>
								<td>${ls.typeName}</td>
								<td>
									${ls.typeStatus == 1 ? "商用":"下线"}
								</td>
								<td><fmt:formatDate value="${ls.createTime}" pattern="yyyy年MM月dd日HH点mm分ss秒"/></td>
								<td><fmt:formatDate value="${ls.updateTime}" pattern="yyyy年MM月dd日HH点mm分ss秒"/></td>
								<td class="updateBtn"><a class="btn btn-info" href="#"> <span class="glyphicon glyphicon-pencil"></span>修改</a></td>
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
td{
	vertical-align: middle !important;
}
</style>
</html>
