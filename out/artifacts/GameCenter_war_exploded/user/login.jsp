<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html;" />
		<meta name="description" content="登录界面" />
		<title>登录界面</title>
		<link rel="stylesheet" href="css/jq22.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap.css">
		<script src="js/jquery.js"></script>
		<script src="js/jquery.form.min.js"></script>
		<style type="text/css">
#msg2 {
	color: red;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#name").on('change', function() {
			$.ajax({
				url:"user/getUserByName.do",
				type:"get",
				data:"name="+ $(this).val(),
				dataType:"text",
				success:function(result){
					if (result == "success") {
						$("#status").html("用户存在");
						$("#status").css("color","green");
	  				}else if (result == "user_not_exist") {
						$("#status").html("用户不存在");
						$("#status").css("color","red");
					}
				}
			});
		});
		$("#userLogin").on('click', function() {
			if ($("#status").html() == "用户存在") {
				$.ajax({
					url:"user/login.do",
					type:"get",
					data:{
						"name":$("#name").val(),
						"pwd":$("#userPwd").val()
					},
					dataType:"text",
					success:function(result){
						if (result == "success") {
							alert("登陆成功");
							$.ajax({
								url:"user/getPortal.do",
								type:"get",
								data:{},
								dataType:"text",
								success:function(result){
									if (result == "success") {
										window.location.href = "/GameCurrency/user/portal.jsp";
					  				}
								}
							});
		  				}else if (result == "pwd_error") {
							alert("密码错误");
						}else if (result == "user_status_banned") {
							alert("用户被禁用");
						}
					}
				});
			}else {
				alert("用户不存在");
			}
		});
	});
</script>
</head>
<body>
		<!-- begin -->
		<div id="login">
				<div class="wrapper">
						<div class="login">
								<form method="post" class="container offset1 loginform">
										<div id="owl-login">
												<div class="hand"></div>
												<div class="hand hand-r"></div>
												<div class="arms">
														<div class="arm"></div>
														<div class="arm arm-r"></div>
												</div>
										</div>
										<div class="pad">
												<div class="control-group">
														<div class="controls text-center">
																<h4>
																		游币客户登录
																</h4>
														</div>
												</div>
												<div class="control-group">
														&nbsp;
												</div>
												<div class="control-group">
														<div class="controls">
																<label for="name" id="nameMsg" class="glyphicon glyphicon-user"></label>
																<input id="name" type="text" name="name" placeholder="用户名" tabindex="1" autofocus="autofocus" class="form-control input-medium">
																<span id="status"></span>
														</div>
												</div>
												<div class="control-group">
														<div class="controls">
																<label for="userPwd" id="userPwdMsg" class="glyphicon glyphicon-th"></label>
																<input id="userPwd" type="password" name="userPwd" placeholder="密码(6-16个字符)" tabindex="2" class="form-control input-medium">
														</div>
												</div>
										</div>
										<div class="form-actions">
												<a href="user/register.jsp" tabindex="4" class="btn btn-link text-muted" style="color: red">新用户注册</a>
												<button id="userLogin" type="button" tabindex="3" class="btn btn-primary">
														登录
												</button>
										</div>
								</form>
						</div>
				</div>
		</div>
		<script type="text/javascript" src="js/canvas-particle.js">
</script>
		<script src="js/jquery.min.js">
</script>
		<script type="text/javascript">
window.onload = function() {
	var config = {
		vx : 4,
		vy : 4,
		height : 2,
		width : 2,
		count : 300,
		color : "121, 162, 185",
		stroke : "100,200,180",
		dist : 6000,
		e_dist : 20000,
		max_conn : 10
	};
	CanvasParticle(config);
};
</script>
		<script>
$(function() {

	$('#login #userPwd').focus(function() {
		$('#owl-login').addClass('password');
	}).blur(function() {
		$('#owl-login').removeClass('password');
	});
});
</script>
		<!-- end -->
</body>
</html>
