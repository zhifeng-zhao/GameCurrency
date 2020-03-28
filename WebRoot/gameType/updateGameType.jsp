<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <% String path = request.getContextPath(); String basePath =
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>修改游戏类型</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/jquery.form.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
$(function(){
	$("#back").on('click', function(e) {
		e.preventDefault();
		// window.location.href = "/GameCurrency/gameType/gametype.jsp";
		history.go(-1);
	});
	$("#updateForm").ajaxForm(function(data) {
		if (data == "null_type_name") alert("类型名称不能为空");
		else if (data == "type_name_exist") alert("该类型名称已存在");
		else if (data == "success") {
			alert("修改成功");
			$.ajax({
		  			url:"gameType/vagueSelectGameTypes.do",
		  			async:false,
		  			type:"get",
		  			data:{"queryName":"<%=session.getAttribute("queryName")%>",
		  				  "queryStatus":"<%=session.getAttribute("queryStatus")%>",
		  				  "pageNo":<%=session.getAttribute("pageNo")%>,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  					  window.location.href = "/GameCurrency/gameType/gametype.jsp";
		  			}
		  		});
		}
	});
	// 表单提交验证
	$("#updateForm").bind("submit", function() {
		if ($("[name='typeName']").val() == "") {
			alert("类型名称不能为空");
			return false;
		}
	});
});
</script>
</head>
<body>
	<div id="container">
		<div class="page-header text-center">
			<h2>修改游戏类型</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-offset-4">
				<form id="updateForm" class="form-horizontal" action="gameType/update.do" method="post">
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr class="text-center">
								<td>类型名称</td>
								<td>
									<div class="col-sm-10">
										<input style="display:none" name="typeId" value="<%=session.getAttribute("typeId") %>">
										<input style="display:none" name="originTypeName" value="<%=session.getAttribute("typeName") %>">
										<input type="text" class="form-control" name="typeName" value="<%=session.getAttribute("typeName") %>">
									</div></td>
							</tr>
							<tr class="text-center">
								<td>状态</td>
								<td>
									<div class="col-sm-4">
										<div class="radio">
											<c:if test="<%=(Integer)session.getAttribute(\"typeStatus\") == 1 %>">
													<label> <input type="radio" name="typeStatus"
														value="1" checked="checked"> 商用 </label>
													<label> <input type="radio" name="typeStatus"
														value="2"> 下线</label>
											</c:if>
											<c:if test="<%=(Integer)session.getAttribute(\"typeStatus\") == 2 %>">
													<label> <input type="radio" name="typeStatus"
														value="1"> 商用 </label>
													<label> <input type="radio" name="typeStatus"
														value="2" checked="checked"> 下线</label>
											</c:if>
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-7">
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<input id="confirm" type="submit" class="btn btn-primary" value="确认修改" />
								</div>
							</div>
						</div>
						<div class="col-xs-6 col-sm-4">
							<div class="form-group">
								<div class=" col-sm-11">
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
</html>
