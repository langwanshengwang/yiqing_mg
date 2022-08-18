<%@ page import="com.qianfeng.enums.UserEnum" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>系统登录 - 疫情防控后台管理系统</title>
<link rel="stylesheet" href="css/style.css" />
<script src="https://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>

<script type="text/javascript">
	
<%String msg = request.getParameter("msg") == null ? "" : request
					.getParameter("msg");%>

<%if (msg.equals(UserEnum.VALIDATE_CODE_IS_FAIL.getValue())) {%>					
   alert('<%=UserEnum.VALIDATE_CODE_IS_FAIL.getDesc()%>');
<%}%>
					
<%if (msg.equals(UserEnum.USERNAME_OR_PASSWORD_FAIL.getValue())) {%>					
   alert('<%=UserEnum.USERNAME_OR_PASSWORD_FAIL.getDesc()%>');
<%}%>
	
	
<%if (msg.equals(UserEnum.USERNAME_IS_EMPTY.getValue())) {%>					
   alert('<%=UserEnum.USERNAME_IS_EMPTY.getDesc()%>');
<%}%>

<%if (msg.equals(UserEnum.PASSWORD_IS_EMPTY.getValue())) {%>					
   alert('<%=UserEnum.PASSWORD_IS_EMPTY.getDesc()%>');
<%}%>

<%if (msg.equals(UserEnum.EMAIL_IS_EMPTY.getValue())) {%>					
   alert('<%=UserEnum.EMAIL_IS_EMPTY.getDesc()%>');
<%}%>

<%if (msg.equals(UserEnum.LOGIN_SUCCESS.getValue())) {%>					
   alert('<%=UserEnum.LOGIN_SUCCESS.getDesc()%>');
<%}%>

</script>


</head>
<body class="login_bg">
	<section class="loginBox">
		<header class="loginHeader">
			<h1>疫情防控后台管理系统</h1>
		</header>
		<section class="loginCont">
			<form class="loginForm" action="UserLoginServlet">
				<div class="inputbox" style="margin-top: -40px">
					<label for="user">用户名：</label> <input id="user" type="text"
						name="email" value="1740582484@qq.com" placeholder="请输入邮箱" required />
				</div>
				<div class="inputbox">
					<label for="mima">密码：</label> <input id="mima" type="password"
						name="pwd" value="123456789" placeholder="请输入密码" required />
				</div>
				<div class="inputbox">
					<label class="lf" for="passwords">验证码：</label> <input type="text"
						name="validatecode" class="inputh inputs lf" placeholder="请输入验证码"
						required id="passwords" /> <span class="wordp lf"><img
						id="validateCode" src="number.jsp" width="96" height="27" alt="" />
					</span> <span class="blues lf"><a id="changeCode"
						href="javascript:void(0);" title="">看不清</a> </span>
				</div>
				<div class="subBtn" style="margin-top: 60px">
					<input type="submit" value="登录" /> <input type="reset" value="重置" />
				</div>

			</form>
		</section>
	</section>

</body>
</html>