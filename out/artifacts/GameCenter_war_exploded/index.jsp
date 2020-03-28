<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <% String path = request.getContextPath(); String basePath =
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>
<html>
		<head>
				<base href="<%=basePath%>">
				<meta charset="utf-8">
				<title>游币后台管理系统</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<meta name="description" content="">
				<meta name="author" content="">
				<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
				<link href="css/dashboard.css" rel="stylesheet">
				<script src="js/ie-emulation-modes-warning.js">
</script>
				<link href="css/bootstrap.min.css" rel="stylesheet">
</script>
		</head>
		<frameset rows="5%,*">
				<frame src="top.jsp" noresize="no"></frame>
				<frameset cols="10%,*">
						<frame src="left.jsp" noresize="no"></frame>
						<frame src="user/user.jsp" name="right"></frame>
				</frameset>
		</frameset>
</html>
