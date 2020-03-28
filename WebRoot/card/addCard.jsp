<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <% String path = request.getContextPath(); String basePath =
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>游币比例管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<script src="js/My97DatePicker/WdatePicker.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery.form.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<link href="css/doubleDate.css" rel="stylesheet" type="text/css" />

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}


.iptgroup{width:620px;height:60px;margin:20px auto 0 auto;}
.iptgroup li{float:left;height:30px;line-height:30px;padding:5px;}
.iptgroup li .ipticon{background:url(blue/date_icon.gif) 98% 50% no-repeat;border:1px #CFCFCF solid;padding:3px;}
</style>

<script type="text/javascript">
	$(function() {
		$("[name='cardProvId']").val($("#provSelector option:selected").val());
		// 整数正则
		var isInt = /^\d+$/;
		// 金钱正则
		var isNum = /^\d+(\.\d+)?$/;
		// 日期正则
		var isDate= /^\d{4}(\-)\d{2}\1\d{2}$/;
		$("#back").on('click', function(e) {
			e.preventDefault();
			history.go(-1);
		});
		// ajaxForm返回请求结果
		$("#addForm").ajaxForm(function(data) {
			if (data == "success") {
				alert("添加成功");
				$.ajax({
		  			url:"card/selectCards.do",
		  			async:false,
		  			type:"get",
		  			data:{"cardNumber":"",
		  				  "cardProvId":0,
		  				  "cardStartTime":"0000-00-00",
		  				  "cardEndTime":"9999-00-00",
		  				  "pageNo":1,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  					  window.location.href = "/GameCurrency/card/card.jsp";
		  			}
		  		});
			}
		});
		// 新增表单提交验证
		$("#addForm").bind("submit", function() {
			var num = $("[name='num']").val();
			var provId = $("#provSelector option:selected").val();
			var cardAmount = $("[name='cardAmount']").val();
			var startTime = $("[name='startTime']").val();
			var endTime = $("[name='endTime']").val();
			if (num == "") {
				alert("请输入数量");
				return false;
			}else if (provId == null) {
				alert("请选择省份");
				return false;
			}else if (cardAmount == "") {
				alert("请输入金额");
				return false;
			}else if (startTime == "") {
				alert("请输入开始时间");
				return false;
			}else if (endTime == "") {
				alert("请输入结束时间");
				return false;
			}else if (!isInt.test(num)) {
				alert("数量必须为整数");
				return false;
			}else if (!isNum.test(cardAmount)) {
				alert("金额格式有误");
				return false;
			}else if (!isDate.test(startTime) || !isDate.test(endTime)) {
				alert("日期格式错误");
				return false;
			}
		});
		// 监听option选中状态
		$("#provSelector").change(function() {
			$("[name='cardProvId']").val($("#provSelector option:selected").val());
		});
	});
</script>
</head>
<body>
	<div>
		<div id="container">
			<div class="page-header ">
				<h2>密保卡生成</h2>
			</div>
			<div class="row">
				<div class="col-xs-6 col-sm-4">
								<div class="modal-body">
									<form id="addForm" class="form-horizontal" action="card/add.do">
										<table class="table table-bordered table-hover table-condensed  ">
											<tbody>
												<tr>
													<td>数量(张)</td>
													<td><input name="num" type="text"  placeholder="必须输入整数"  /></td>
												</tr>
												<tr>
													<td>选择需要生成卡的省份</td>
													<td> 
														<select id="provSelector" class="selectpicker bla bla bli" multiple data-live-search="true">
															<optgroup>
																<c:forEach var="ls" items="${provList}">
																	<option value="${ls.provId}">${ls.provName}</option>
																</c:forEach>
															</optgroup>
														</select>
														<input type="hidden" name="cardProvId" value=""/>
													</td>
												</tr>
												<tr>
													<td>金额(游币数量)</td>
													<td><input name="cardAmount" type="text"  placeholder="必须输入整数"/></td>
												</tr>
												<tr class="iptgroup">
												  	<td>有效期开始时间<input name="startTime" type="text" placeholder="XXXX-XX-XX"/></td>
												  	<td>有效期结束时间<input name="endTime" type="text" placeholder="XXXX-XX-XX"/></td>
												</tr>
											</tbody>
										</table>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit" class="btn btn-primary">生成密保卡</button>
												<button id="back" class="btn btn-warning" >返回上一页</button>
											</div>
										</div>
									</form>
								</div>
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
