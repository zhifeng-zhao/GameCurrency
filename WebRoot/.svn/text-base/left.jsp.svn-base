<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <script type="text/javascript" src="js/jquery.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
    	$(function() {
    		$("#user").on('click', function() {
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
    		});
    		$("#gameType").on('click', function() {
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
		  			}
		  		});
    		});
    		$("#game").on('click', function() {
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
		  			}
		  		});
    		});
    		$("#exchange").on('click', function() {
    			$.ajax({
		  			url:"exchange/selectExchanges.do",
		  			async:false,
		  			type:"get",
		  			data:{"provName":"",
		  				  "pageNo":1,
		  				  "pageSize":5},
		  			dataType:"text",
		  			success:function(result){
		  			}
		  		});
    		});
    		$("#card").on('click', function() {
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
		  			}
		  		});
    		});
    	});
    </script>
  </head>
  <body>
   	<div class="lefter">
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true"><div class="panel panel-default">
    			<div class="panel-heading"  >
      				<h4 class="panel-title">
      					<a href="index.jsp" target="_top"><span class="glyphicon glyphicon-th-large" ></span> 菜单列表</a>
      				</h4>
    			</div>
    			
 		 	</div>
  			<div class="panel panel-default">
    			<div class="panel-heading"  >
      				<h4 class="panel-title">
      					<a href="user/user.jsp" id="user" target="right"><span class="glyphicon glyphicon-user" ></span> 用户管理</a>
      				</h4>
    			</div>
    			
 		 	</div>
  <div class="panel panel-default">
    <div class="panel-heading"  >
      <h4 class="panel-title">
      	<a href="gameType/gametype.jsp" id="gameType" target="right"><span class="glyphicon glyphicon-th"></span> 游戏类型</a>
      </h4>
    </div>
   
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
      	<a href="game/game.jsp" id="game" target="right"><span class="glyphicon  glyphicon-list"></span> 游戏列表</a>
      </h4>
    </div>
  </div>
   <div class="panel panel-default">
    <div class="panel-heading"  >
      <h4 class="panel-title">
      	<a href="exchange/exchange.jsp" id="exchange" target="right"><span class="glyphicon glyphicon-transfer"></span>换算比例</a>
      </h4>
    </div>
   
  </div>
  
  
   <div class="panel panel-default">
    <div class="panel-heading"  >
      <h4 class="panel-title">
      	<a href="card/card.jsp" id="card" target="right"><span class="glyphicon glyphicon-barcode"></span>密保卡管理</a>
      </h4>
    </div>
   
  </div>
  
  
  
  <div style="display:none" class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="false" aria-controls="collapseThree">
          <span class=""></span> 预留
        </a>
      </h4>
    </div>
    <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
      <ul class="nav nav-sidebar"> 
            <li ><a href="" target="right">权限管理</a></li>
            <li ><a href="" target="right">登录日志</a></li>
            <li ><a href="" target="right">操作日志</a></li>
          </ul>
      </div>
    </div>
  </div>
</div>
	</div>
	<script>
   $(function(){
      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // 获取已激活的标签页的名称
      var activeTab = $(e.target).text(); 
      // 获取前一个激活的标签页的名称
      var previousTab = $(e.relatedTarget).text(); 
      $(".active-tab span").jsp(activeTab);
      $(".previous-tab span").jsp(previousTab);
   });});</script>
  </body>
</html>
       
