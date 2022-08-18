<%@page import="com.qianfeng.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>疫情防控后台管理系统</title>
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/style.css" />
</head>
<body style="background-color: white;">
	<!--主体内容-->
	<section class="publicMian">
		<div class="left" style="height: 1000px">
			<h2 class="leftH2">
				<span class="span1"></span>功能列表 <span></span>
			</h2>
			<nav>
				<ul class="list">
					<li><a href="COVID-19Map.html" target="main">疫情地图</a></li>
					<li><a href="MapDataGridServlet" target="main">疫情数据管理</a>
					</li>
					<li><a href="UserListByPageServlet?pageindex=1" target="main">用户管理</a></li>
					<li><a href="password.jsp" target="main">密码修改</a></li>
					<li><a href="login.jsp" target="_parent">退出系统</a></li>
				</ul>
			</nav>
		</div>
	</section>
	</div>
</body>
</html>