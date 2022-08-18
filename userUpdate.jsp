<%-- <%@page import="com.qianfeng.entity.Role"%> --%>
<%@page import="com.qianfeng.enums.UserEnum"%>
<%@page import="com.qianfeng.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>疫情防控后台管理系统</title>
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/style.css" />
<script src="https://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<%
	request.setCharacterEncoding("utf-8");
	String pageindex = request.getParameter("pageindex");
	int userid = Integer.parseInt(
		request.getParameter("userid")==null
		?"0"
		:request.getParameter("userid")
	);
	String username = new String(request.getParameter("username").getBytes("iso-8859-1"),"UTF-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String iamgepath = request.getParameter("iamgepath");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User)request.getAttribute("user");
%>

<script type="text/javascript">
<%--  $(function(){
   <%
    for(Role role :user.getRoles()){
   %>
    $("input[value=<%= role.getRolename()%>]").attr("checked","checked");
   <%}%>
  
  });
--%>
</script>

<script type="text/javascript">
	function updateUser() {
	 document.forms[0].submit();
	  
	}
</script>


<script type="text/javascript">
	
<%String msg = request.getParameter("msg") == null ? "" : request
					.getParameter("msg");%>
<%	if(msg.equals(UserEnum. UPDATE_FAIL.getValue())) {%>
	alert ( "<%= UserEnum. UPDATE_FAIL.getDesc( )%>");<% }%>
	<%				
	if(msg.equals(UserEnum.USERNAME_IS_EMPTY.getValue())) {%>
	alert( "<%= UserEnum. USERNAME_IS_EMPTY.getDesc()%>");<% }%>
	<%
	if(msg.equals(UserEnum.PASSWORD_IS_EMPTY.getValue())) {%>
	alert( "<%= UserEnum.PASSWORD_IS_EMPTY.getDesc()%>");<%}%>
	<%
	if(msg.equals(UserEnum.EMAIL_IS_EMPTY.getValue())) {%>
	alert( "<%= UserEnum.EMAIL_IS_EMPTY.getDesc()%>");<%}%>
	<%	if(msg.equals(UserEnum. UPDATE_SUCCESS.getValue())) {%>
	alert ( "<%= UserEnum. UPDATE_SUCCESS.getDesc( )%>");<% }%>
</script>


</head>
<body style="background-color: white;">
	<!--主体内容-->
	<section class="publicMian ">
		<div class="right">
			<div class="location">
				<strong>你现在所在的位置是:</strong> <span>用户管理页面 >> 用户修改页面</span>
			</div>
			<div class="providerAdd">
				<form
					action="UserUpdateServlet?pageindex=<%=pageindex %>&userid=<%=request.getParameter("userid")%>&username=<%=username%>&password=<%=password%>&email=<%=email%>&iamgepath=<%=iamgepath%>"
					enctype="multipart/form-data" method="post">
					<!--div的class 为error是验证错误，ok是验证成功-->
					<div style="display: none;">
						<label for="userName">用户ID：</label> <input type="text"
							name="userid" value="<%=userid%>" /> <span>*</span>
					</div>

					<div>
						<label for="userName">用户名称：</label> <input type="text"
							name="username" id="userName" value="<%=username%>" /> <span>*</span>
					</div>

					<div>
						<label for="userName">用户邮箱：</label> <input disabled="disabled"
							type="text" value="<%=email%>" /> <span>*</span>
					</div>

					<div style="display: none;">
						<label for="userName">用户邮箱：</label> <input type="text"
							name="email" value="<%=email%>" /> <span>*</span>
					</div>

					<div>
						<label>密码:</label> <input type="text" name="password"
							value="<%=password%>" /> <span>*</span>
					</div>

					<div style="display: none;">
						<label>密码:</label> <input type="text" name="afterpassword"
							value="<%=password%>" /> <span>*</span>
					</div>

					<div>
						<label>用户头像：</label> <img width="150px" height="150px"
							alt="该用户没有上传头像" src="<%=basePath%>upload/<%=iamgepath%>"> <input
							style="display: none;" name="imagepath" value="<%=iamgepath%>">
						<input style="border: none;" type="file" name="file">
					</div>
					<div>
						<label>用户类别：</label> <input type="radio" name="userrole" value="admin"/>管理员  <input checked="checked"
							type="radio" name="userrole" value="user" />普通用户
					</div>
					<div class="providerAddBtn">
						<!--<a href="#">保存</a>-->
						<!--<a href="userList.jsp">返回</a>-->
						<input type="button" value="修改" onclick="updateUser()" /> <input
							type="button" value="返回" onclick="history.back(-1)" />
					</div>
				</form>
			</div>

		</div>
	</section>
</body>
</html>