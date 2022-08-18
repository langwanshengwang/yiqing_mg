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
	int id = Integer.parseInt(request.getParameter("id"));
	String city = new String(request.getParameter("city").getBytes(
			"iso-8859-1"), "UTF-8");
	String infectCount = request.getParameter("infectCount");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<script type="text/javascript">
<%--   $(function(){
   <%for(Role role :user.getRoles()){%>
    $("input[value=<%=role.getRolename()%>]").attr("checked","checked");
   <%}%>
  
  }); --%>

</script>

<script type="text/javascript">
	function updateCity() {
	 document.forms[0].submit();
	}
</script>


<script type="text/javascript">
	
<%String msg = request.getParameter("msg") == null ? "" : request
					.getParameter("msg");%>
					
</script>


</head>
<body style="background-color: white;">
	<!--主体内容-->
	<section class="publicMian ">
		<div class="right">
			<div class="location">
				<strong>你现在所在的位置是:</strong> <span>城市感染人数管理页面 >> 城市感染人数修改页面</span>
			</div>
			<div class="providerAdd">
				<form
					action="CityUpdateServlet?pageindex=<%=request.getParameter("pageindex")%>"
					 method="post">
					<!--div的class 为error是验证错误，ok是验证成功-->
					<div style="display: none;">
						<label for="id">ID：</label> <input type="text" name="id"
							value="<%=id%>" /> <span>*</span>
					</div>

					<div>
						<label for="city">城市：</label> <input disabled="disabled"
							type="text" name="city" id="city" value="<%=city%>" /> <span>*</span>
					</div>

					<div>
						<label for="infectCount">感染人数：</label> <input type="text"
							name="infectCount" id="infectCount" value="<%=infectCount%>" />
						<span>*</span>
					</div>
					<div class="providerAddBtn">
						<!--<a href="#">保存</a>-->
						<!--<a href="userList.jsp">返回</a>-->
						<input type="button" value="修改" onclick="updateCity()" /> <input
							type="button" value="返回" onclick="history.back(-1)" />
					</div>
				</form>
			</div>

		</div>
	</section>
</body>
</html>