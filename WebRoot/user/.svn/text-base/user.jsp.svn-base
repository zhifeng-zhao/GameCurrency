<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%> <% String path = request.getContextPath(); String basePath =
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

<title>用户管理</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		var userName = $("#userName");
		var userPhone = $("#userPhone");
		$("#release").on('click', function() {
			relaseAndBan(1);
		});
		$("#ban").on('click', function() {
			relaseAndBan(2);
		});
		function relaseAndBan(status) {
			var statusStr = "";
			if (status == 1) statusStr = "恢复";
			else if (status == 2) statusStr = "禁用";
			if ($('input:checkbox:checked').length == 0) {
				alert("请选择用户！");
				return;
			}
			if (confirm("确认"+statusStr+"操作？")) {
				$.each($('input:checkbox'), function() {
					if(this.checked) {
						updateUserStatus($(this).parent().next().html(), status);
					}
				});
				getUsers(userName.val(),userPhone.val(),<%=session.getAttribute("pageNo")%>);
				window.location.reload();
			}
		}
		function updateUserStatus(uid, status) {
			$.ajax({
		  			url:"user/updateUserStatus.do",
		  			async:false,
		  			type:"post",
		  			data:{"userId":uid,
		  				  "userStatus":status},
		  			dataType:"text",
		  			success:function(result){
		  			}
		  		});
		}
		function getUsers(queryName, queryPhone, pageNo) {
			$.ajax({
		  			url:"user/vagueSelectUsers.do",
		  			async:false,
		  			type:"get",
		  			data:{"queryName":queryName,
		  				  "queryPhone":queryPhone,
		  				  "pageNo":pageNo,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  			}
		  		});
		}
		$("#all").on('click', function() {
			$("input[name='opt']").prop("checked", this.checked);
		});
		$("input[name='opt']").on('click', function() {
			var $opts = $("input[name='opt']");
			$("#all").prop("checked", $opts.length == $opts.filter(":checked".length)?true:false);
		});
		$("#vagueSelect").on('click', function() {
			getUsers(userName.val(),userPhone.val(),1);
			window.location.reload();
		});
		$("#prePage").on('click', function() {
			var pageNo = <%=session.getAttribute("pageNo")%> - 1;
			if (pageNo == 0) {
				alert("已经是第一页！");
				return;
			}
			getUsers("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryPhone")%>",pageNo);
			window.location.reload();
		});
		$("#nextPage").on('click', function() {
			var pageNo = <%=session.getAttribute("pageNo")%> + 1;
			if (pageNo > <%=session.getAttribute("totalPage")%>) {
				alert("已经是最后一页！");
				return;
			}
			getUsers("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryPhone")%>",pageNo);
			window.location.reload();
		});
		$(".pageBtn").on('click', function() {
			var pageNo = $(this).html();
			getUsers("<%=session.getAttribute("queryName")%>","<%=session.getAttribute("queryPhone")%>",pageNo);
			window.location.reload();
		});
	});
</script>
</head>
<body>
	<%
		if (request.getAttribute("queryName") == null) request.setAttribute("queryName", "");
		if (request.getAttribute("queryPhone") == null) request.setAttribute("queryPhone", "");
	%>
	<div id="container"  >
		<div class="page-header">
			<h2>用户列表</h2>
		</div>
		<form action="" >
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">用户名</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input id="userName" type="text" class="form-control" value="<%=session.getAttribute("queryName")%>"/>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-4">
							<span class="btn btn-default">手机号码</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input id="userPhone" type="text" class="form-control" value="<%=session.getAttribute("queryPhone")%>"/>
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
				<a id="release" class="btn btn-success"> <span class="glyphicon glyphicon-ok-sign"></span>
					恢复使用</a>
				
				<a id="ban" class="btn btn-danger" > <span
					class="glyphicon glyphicon-trash"></span> 禁止使用</a>
			</div>
		</div>
	<div id="main">
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
							<td>用户名</td>
							<td>手机账号</td>
							<td>状态</td>
							<td>创建时间</td>
						</tr>
						<c:forEach var="ls" items="${userList}">
							<tr>
								<td><input type='checkbox' name="opt"/></td>
								<td>${ls.userId}</td>
								<td>${ls.userName}</td>
								<td>${ls.userPhone}</td>
								<td>
									${ls.userStatus == 1 ? "可用":"禁用"}
								</td>
								<td>
									<fmt:formatDate value="${ls.createTime}" pattern="yyyy年MM月dd日HH点mm分ss秒"/>
								</td>
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
	</div>
</body>
<style>
td {
	vertical-align: middle !important;
}
</style>
</html>
