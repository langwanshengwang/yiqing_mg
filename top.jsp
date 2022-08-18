<%@page import="com.qianfeng.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>疫情防控后台管理系统</title>
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/style.css" />


<%
User user = (User)session.getAttribute("user")==null?new User()
:(User)session.getAttribute("user");

 %>

</head>
<body>
	<!--头部-->
	<header class="publicHeader">
		<h1>疫情防控后台管理系统</h1>
		<div class="publicHeaderR">
			<p>
				<span>下午好！</span><span style="color: #fff21b"> <%=user.getUsername() %> </span> , 欢迎你！
			</p>
			<span id="hours"></span> <a href="login.jsp">退出</a>
		</div>
	</header>
	<!--时间-->
	<section class="publicTime" style="height: 500px">
		<span id="time">2015年1月1日 11:11 星期一</span> <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
	</section>
	<script type="text/javascript" src="js/time.js"></script>
</body>
</html>