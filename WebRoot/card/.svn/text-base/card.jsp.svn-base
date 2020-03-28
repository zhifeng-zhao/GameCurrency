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
<script src="js/jquery.js"></script>
<script src="js/jquery.form.min.js"></script>
<script type="text/javascript" src="js/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">

<!-- 3.0 -->

<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#all").on('click', function() {
			$("input[name='opt']").prop("checked", this.checked);
		});
		$("input[name='opt']").on('click', function() {
			var $opts = $("input[name='opt']");
			$("#all").prop("checked", $opts.length == $opts.filter(":checked".length)?true:false);
		});
		$("#search").on('click', function() {
			var isDate= /^\d{4}(\-)\d{2}\1\d{2}$/;
			var cardNumber = $("#cardNumber").val();
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			var provId = $("#provSelector option:selected").val();
			if (startTime == "") {
				startTime = "0000-00-00";
			}
			if (endTime == "") {
				endTime = "9999-00-00";
			}
			if (!isDate.test(startTime) || !isDate.test(endTime)) {
				alert("日期格式错误");
				return;
			}
			getCards(cardNumber, provId, startTime, endTime, 1);
			window.location.reload();
		});
		$("#prePage").on('click', function() {
			var pageNo = <%=session.getAttribute("pageNo")%> - 1;
			if (pageNo == 0) {
				alert("已经是第一页！");
				return;
			}
			getCards("<%=session.getAttribute("cardNumber")%>",<%=session.getAttribute("cardProvId")%>,"<%=session.getAttribute("cardStartTime")%>","<%=session.getAttribute("cardEndTime")%>",pageNo);
			window.location.reload();
		});
		$("#nextPage").on('click', function() {
			var pageNo = <%=session.getAttribute("pageNo")%> + 1;
			if (pageNo > <%=session.getAttribute("totalPage")%>) {
				alert("已经是最后一页！");
				return;
			}
			getCards("<%=session.getAttribute("cardNumber")%>",<%=session.getAttribute("cardProvId")%>,"<%=session.getAttribute("cardStartTime")%>","<%=session.getAttribute("cardEndTime")%>",pageNo);
			window.location.reload();
		});
		$(".pageBtn").on('click', function() {
			var pageNo = $(this).html();
			getCards("<%=session.getAttribute("cardNumber")%>",<%=session.getAttribute("cardProvId")%>,"<%=session.getAttribute("cardStartTime")%>","<%=session.getAttribute("cardEndTime")%>",pageNo);
			window.location.reload();
		});
		function getCards(cardNumber, cardProvId, cardStartTime, cardEndTime, pageNo) {
			$.ajax({
		  			url:"card/selectCards.do",
		  			async:false,
		  			type:"get",
		  			data:{"cardNumber":cardNumber,
		  				  "cardProvId":cardProvId,
		  				  "cardStartTime":cardStartTime,
		  				  "cardEndTime":cardEndTime,
		  				  "pageNo":pageNo,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  			}
		  		});
		}
	});
</script>
</head>
<body>
	<div>
		<div id="container">
			<div class="page-header ">
				<h2>密保卡管理</h2>
			</div>
			<form action="">
				<div class="row">
					<div class="col-xs-4 col-sm-12 ">
						<div class="row">
							<div class="col-xs-8 col-sm-2">
								<span class="btn btn-default">卡号 <input id="cardNumber" type="text" value="${cardNumber}"/> </span>
							</div>
							<div class="col-xs-4 col-sm-4 ">
								<div class="row">
									<div class="col-xs-6 col-sm-4 ">
										<span class="btn btn-default">
											有效期开始时间 
											<!--<input class="time" type="text" id="startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', maxDate:'#F{$dp.$D(\'endTime\')}'})"/> 
											-->
											<input type="text" id="startTime" value="${cardStartTime == '0000-00-00' ? '':cardStartTime}" placeholder="XXXX-XX-XX"/> 
											<img src="js/My97DatePicker/skin/datePicker.gif" width="16"
												height="22" /> 
										</span>
									</div>
								</div>
							</div>

							<div class="col-xs-4 col-sm-4 ">
								<div class="row">
									<div class="col-xs-8 col-sm-4">
										<span class="btn btn-default">
											有效期结束时间 
											<!--<input class="time" id="endTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'startTime\')}'})"/> 
											-->
											<input id="endTime" type="text" value="${cardEndTime == '9999-00-00' ? '':cardEndTime}" placeholder="XXXX-XX-XX"/> 
											<img src="js/My97DatePicker/skin/datePicker.gif" width="16"
											height="22"/>
										</span>
									</div>
								</div>
							</div>

							<div class="col-xs-4 col-sm-2 ">
								<div class="row">
									<div class="col-xs-8 col-sm-3">
										<span class="btn btn-default"> 省份
											<select id="provSelector">
												<c:forEach var="ls" items="${provList}">
													<c:if test="${cardProvId==ls.provId}">
														<option value="${ls.provId}" selected="selected">${ls.provName}</option>
													</c:if>
													<c:if test="${cardProvId!=ls.provId}">
														<option value="${ls.provId}">${ls.provName}</option>
													</c:if>
												</c:forEach>
											</select> 
										</span>
									</div>
								</div>
							</div>
							<div class="col-xs-4 col-sm-1 ">
								<div class="row">
									<div class="col-xs-6 col-sm-4 ">
										<input type="button" class="btn btn-primary" id="search"
											value="查询" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>
			<div class="row">&nbsp;</div>
			<div class="row">
				<div class="col-xs-6 col-sm-4">
					<a href="card/addCard.jsp" class="btn btn-primary">批量生成密保卡</a>
					
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
								<td>卡号</td>
								<td>密码</td>
								<td>金额</td>
								<td>省份</td>
								<td>有效期开始时间</td>
								<td>有效期结束时间</td>
								<td>使用状态</td>
								<td>创建时间</td>
							</tr>
							<c:forEach var="ls" items="${cardList}">
								<tr>
									<td><input type='checkbox' 
										name='opt' value='' /></td>
									<td>${ls.cardId}</td>
									<td>${ls.cardNumber}</td>
									<td>${ls.cardPwd}</td>
									<td>${ls.cardAmount}</td>
									<td>${existProvCard.get(ls.cardProvId)}</td>
									<td><fmt:formatDate value="${ls.cardStartTime}" pattern="yyyy年MM月dd日"/></td>
									<td><fmt:formatDate value="${ls.cardEndTime}" pattern="yyyy年MM月dd日"/></td>
									<td>
										<c:if test="${ls.cardStatus == 1}">未生效</c:if>
										<c:if test="${ls.cardStatus == 2}">可用</c:if>
										<c:if test="${ls.cardStatus == 3}">已使用</c:if>
										<c:if test="${ls.cardStatus == 4}">已过期</c:if>
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
