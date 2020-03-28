<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <% String path = request.getContextPath(); String basePath =
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="description" content="注册界面" />
<title>注册界面</title>
<link rel="stylesheet" href="css/jq22.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
	.red{
		color:red;
	}
	.green{
		color:green;
	}
</style>
<script src="js/jquery.js"></script>
<script src="js/jquery.form.min.js"></script>
<script type="text/javascript">
	$(function() {
		// ajaxForm返回请求结果
		$("#addForm").ajaxForm(function(data) {
			if (data == "user_exist") {
				alert("用户名已存在");
			}else if (data == "success") {
				alert("注册成功");
				window.location.href = "/GameCenter/user/login.jsp";
			}
		});
		var nameRegex = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{2,16}$/;
		var phoneRegex = /^(13[0-9]|14[589]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89]\d{8}$)/;
		var isDate= /^\d{4}(\-)\d{2}\1\d{2}$/;
		// 新增表单提交验证
		$("#addForm").bind("submit", function() {
			var userName = $("#userName").val();
			var userPwd = $("#userPwd").val();
			var confirmPwd = $("#userPwd2").val();
			var phone = $("#phone").val();
			var sex= $("[name='sex']").val() == "0" ? "男" : "女";
			var birthday = $("#birthday").val();
			if (!nameRegex.test(userName)) {
				alert("姓名格式有误");
				return false;
			}else if(userPwd.length < 6 || userPwd.length > 16) {
				alert("密码长度有误");
				return false;
			}else if(!phoneRegex.test(phone)) {
				alert("手机号格式有误");
				return false;
			}else if(!isDate.test(birthday)) {
				alert("生日格式有误");
				return false;
			}else if(userPwd != confirmPwd) {
				alert("两次密码不一致");
				return false;
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
            <form id="addForm" action="user/register.do" method="post" class="container offset1 loginform" >
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
                            <h4>游币用户注册</h4>
                        </div>
                    </div>
                    <div class="control-group">
                        &nbsp;
                    </div>
                    
                    <div class="control-group">
                        <div class="controls">
                            <label for="userName" id="userNameMsg" class="glyphicon glyphicon-user"></label>
                            <input id="userName" type="text" name="userName"  placeholder="姓名(超过两个字符)" autofocus="autofocus" tabindex="1"  class="form-control input-medium">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password"  id="userPwdMsg" class="glyphicon glyphicon-th"></label>
                            <input id="userPwd" type="password" name="userPwd" placeholder="密码(6-16个字符)" tabindex="2" class="form-control input-medium">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password" id="userPwdMsg2"  class="glyphicon glyphicon-th"></label>
                            <input id="userPwd2" type="password"  placeholder="确认密码" tabindex="3" class="form-control input-medium">
                        </div>
                    </div>
                     
                    <div class="control-group">
                        <div class="controls">
                            <label for="Number"  class="glyphicon glyphicon-user"></label>
                            <input id="phone" type="text" name="phone" placeholder="手机号码 " tabindex="4" class="form-control input-medium">
                        </div>
                    </div>
		    <div class="control-group">
                        <div class="controls">
                            <input type="radio" name="sex" value="0"  tabindex="5" checked="checked"/>男
                            <input type="radio" name="sex" value="1"  tabindex="6"/>女
                        </div>
                    </div>
		    <div class="control-group">
                        <div class="controls">
                            <label for="birthday" id="birthdayMsg" class="glyphicon glyphicon-user"></label>
                            <input id="birthday" type="text" name="birthday"  placeholder="生日，格式：xxxx-xx-xx"  tabindex="7"  class="form-control input-medium">
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <a href="user/login.jsp" tabindex="9" class="btn btn-link text-muted " style="color:red">返回登录</a>
                    <button type="submit" tabindex="8" class="btn btn-primary">点击注册</button>
                </div>
            </form>
        </div>
    </div>
    </div>
    
	<script type="text/javascript" src="js/canvas-particle.js"></script>
    <script type="text/javascript" >
    $(function() {

        $('#login #userPwd,#login #userPwd2').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
        var config = {
				vx: 4,
				vy:  4,
				height: 2,
				width: 2,
				count: 300,
				color: "121, 162, 185",
				stroke: "100,200,180",
				dist: 8000,
				e_dist: 60000,
				max_conn: 10
			};
			CanvasParticle(config);
         
    });
    </script>

<!-- end -->
</body>
</html>
