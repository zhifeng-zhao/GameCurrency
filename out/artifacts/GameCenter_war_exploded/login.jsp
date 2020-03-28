<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
		<head>
				<base href="<%=basePath%>">
				<meta charset="utf-8">
				<title>游币管理员后台登录页面</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<meta name="description" content="">
				<meta name="author" content="">
				<!-- Le styles -->
				<link rel="stylesheet" href="css/style.css">
				<link rel="stylesheet" href="css/bootstrap.css">
				<!-- MAIN EFFECT -->
				<link rel="shortcut icon" href="assets/ico/minus.png">
				<script type="text/javascript" src="js/jquery.js"></script>
				<style type="text/css">
#zhong {
	margin-top: 200px;
}

#yzmsj {
	display: none;
}

#1 {
	color: green;
}
</style>
				<script type="text/javascript">
				$(function(){
					var userName = $("[name='userName']");
					userName.attr("invalid","true");
					var userPassword = $("[name='userPassword']");
					var nameCheck = $("#1");
					var verCodeBtn = $("#btn");
					var verPhone = $("#verPhone");
					var verCode = $("[name='verCode']");
					var verCodeStr;
					var phone;
					userName.blur(function(){
						$.ajax({
				  			url:"manager/queryByName.do",
				  			type:"get",
				  			data:"name="+ userName.val(),
				  			dataType:"text",
				  			success:function(result){
				  				if (result == "success") {
				  					userName.attr("invalid","false");
				  					nameCheck.html("存在该用户");
				  					nameCheck.css("color","green");
				  				}else if (result == "error") {
				  					userName.attr("invalid","true");
				  					nameCheck.html("不存在该用户名");
				  					nameCheck.css("color","red");
				  				}
				  			}
				  		});
					});
					
					verCodeBtn.click(function() {
						$.ajax({
				  			url:"manager/queryPhoneByName.do",
				  			type:"get",
				  			data:"name="+ userName.val(),
				  			dataType:"text",
				  			success:function(result){
				  				if (result == "error") {
				  					verPhone.html("用户名不存在，请重新输入");
				  					verPhone.css("color","red");
				  				}else {
				  					phone = result;
									verCodeBtn.attr("disabled", true);
				  					verPhone.html("手机号:" + result + ",验证码:");
				  					verPhone.css("color","blue");
				  					var count = 60;
									var countdown = setInterval(CountDown, 1000);
									function CountDown() {
										verCodeBtn.val(count+"s");
										if (count == 0) {
											$("#code").html("验证码已过期，请重新获取");
											verCodeBtn.val("获取验证码").removeAttr("disabled");
											clearInterval(countdown);
										}
										count--;
									}
									$.ajax({
							  			url:"vertify/getCode.do",
							  			type:"post",
							  			data:"phone="+ result,
							  			dataType:"text",
							  			success:function(code){
							  				verCodeStr = code;
							  				$("#code").html(code);
							  			}
							  		});
				  				}
				  			}
				  		});
						
					});
					
					$("#start").click(function() {
						if (userName.val() == null || userName.attr("invalid") == "true") {
							alert("不存在该用户！");
						}else if (userPassword.val() == null) {
							alert("请输入密码！");
						}else if (verCode.val() == null) {
							alert("请输入验证码");
						}else if (verCode.val() != verCodeStr) {
							alert("验证码有误！");
						}else {
							$.ajax({
								url:"manager/login.do",
					  			type:"post",
					  			data:{"name":userName.val(),
									  "phone":phone,
									  "pwd":userPassword.val(),
									  "code":verCode.val()},
					  			dataType:"text",
					  			success:function(result){
					  				if (result == "user_not_exist") alert("用户不存在！");
					  				else if (result == "pwd_error") alert("密码错误！");
					  				else if (result == "code_not_exist") alert("验证码不存在！");
					  				else if (result == "code_out_of_time") alert("此验证码已超时，请重新请求！");
					  				else if (result == "success") {
					  					$.ajax({
								  			url:"user/vagueSelectUsers.do",
								  			async:false,
								  			type:"get",
								  			data:{"queryName":"",
								  				  "queryPhone":"",
								  				  "pageNo":1,
								  				  "pageSize":5},
								  			dataType:"text",
								  			success:function(result){
								  			}
								  		});
					  					$("#goto").attr("href", "/GameCurrency/manager/toIndex.do?name=" + userName.val());
					  					$("#goto span").click();
					  				}
					  			}
							});
						}
					});
				});
</script>
		</head>
		<body>
				<div id="preloader"></div>
				<div class="container">
						<div id="zhong">
								<div class="" id="login-wrapper">
										<div class="row">
												<div class="col-md-4 col-md-offset-4">
														<div id="logo-login">
																<h1>
																		游币后台登录页面
																</h1>
														</div>
												</div>
										</div>
										<div class="row">
												<div class="col-md-4 col-md-offset-4">
														<div class="account-box">
																<form method="post">
																		<div class="row">
																				<div class="col-sm-9">
																						<label for="inputUsername">
																								用户名
																						</label>
																						<div class="row">
																								<div class="col-xs-8 col-sm-12">
																										<input name="userName" type="text" class="form-control">
																										<span id="1"></span>
																								</div>
																								<div class="col-xs-3 col-sm-5">
																								</div>
																						</div>
																				</div>
																		</div>
																		<div class="row">
																				<div class="col-sm-9">
																						<label for="pwd">
																								密码
																						</label>
																						<input name="userPassword" type="password" class="form-control">
																				</div>
																		</div>
																		<div class="row">
																				<div class="col-sm-9">
																						<label for="inputverificationcode">
																								验证码
																						</label>
																						<div class="row">
																								<div class="col-xs-8 col-sm-8">
																										<input name="verCode" type="text" class="form-control">
																								</div>
																								<div class="col-xs-2 col-sm-2">
																										<input class="btn btn-warning" type="button" id="btn" value="获取验证码" />
																								</div>
																								<div class="col-xs-8 col-sm-12">
																										<div id="verPhone"></div>
																										<div id="code"></div>
																								</div>
																						</div>
																				</div>
																		</div>
																		<div></div>
																		<div class="row">
																				&nbsp;
																		</div>
																		<input id="start" class="btn btn btn-primary " type="button" value="登 录"/>
																				
																</form>
																<a id="goto" class="forgotLnk" href="/GameCenter/manager/toIndex.do"><span></span></a>
																<div class="row-block">
																		<div class="row"></div>
																</div>
														</div>
												</div>
										</div>
								</div>
						</div>
				</div>
		</body>
</html>
