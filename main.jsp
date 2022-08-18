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
<body style="background-color: white;">
	<!--主体内容-->
	<section class="publicMian">
		<div class="right">
			<img class="wColck" src="img/clock.jpg" alt="" />
			<div class="wFont">
				<h2> <%=user.getUsername() %> </h2>
				<p>欢迎来到疫情防控后台管理系统!</p>
				<span id="hours"></span>
			</div>
		</div>
	</section>
</body>
</html>