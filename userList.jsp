<%@page import="com.qianfeng.enums.UserEnum"%>
<%@page import="com.qianfeng.vo.PageVO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.qianfeng.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page errorPage="jsp_error.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>疫情防控后台管理系统</title>
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/style.css" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<%
	String username = ((User) session.getAttribute("user"))
	.getUsername();
	// getAttribute 是获取服务器对请求报文插入的数据  
	// List<User> userList = (List<User>) request.getAttribute("userlist");
	PageVO pageVO = (PageVO) request.getAttribute("pageVO");
	List<User> userList = (List<User>)pageVO.getData();
	BigDecimal pageIndex = pageVO.getPageIndex();
	BigDecimal pageNumber = pageVO.getPageCount();
	BigDecimal total = pageVO.getTotalCount();
	BigDecimal lastPage = pageVO.getEndPage();
%>
<script src="https://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<!-- <script src="http://libs.baidu.com/jquery/1.7.2/min/jquery.js"></script>
 -->
<script type="text/javascript">

 function chagePageNumber(pageNumber,pageIndex){
  location.href = "UserListByPageServlet?pageindex="+pageIndex+"&pagenumber="+pageNumber+"";
 }


/* 这行代码 必须要等待HTML全部加载完之后再来执行 */
  
  $(function(){
  $("#chagePageNumber option[value=<%=pageNumber.intValue()%>]").attr("selected","selected");
  });
  
  function delSetData(arg) {
  // 这步操作 相当于 是使用HTML的自定义属性  给其 赋予一个ID
    $("#yes").attr("userid",arg);
  }
  
  
  function delUser() {
    var userid = $("#yes").attr("userid");
    /* 
     ajax 主要参数有
     url
     data (向服务器提交的数据)
     method (提交方法)
     dataType (AJAX成功回调函数的处理方式)
     success (成功回调函数)
     errer (失败回调函数)
     */
     var userData = {"userid":userid};
     
    $.ajax({
      url: "UserDeleteByIDServlet",
      data: userData,
      method : "post",
      dataType: "json",
      success : function (data){
      /* 
       data 指的是 响应报文,而dataType 这个参数 就是 响应报文的处理方式
       */
       if(data.OK === "OK"){
         $("a[userid02="+userid+"]").parent().parent().remove();
        $('.zhezhao').css('display', 'none');
        $('#removeUse').fadeOut();
       } else{
         alert("删除失败请重试");
       }
      },
      error: function(){
       alert("网络异常请重试");
      }
    });
    }
</script>


<script type="text/javascript">
	
	<%String msg= request.getParameter("msg") == null ?"":request
	.getParameter("msg");%>
	<%if(msg.equals(UserEnum.UPDATE_SUCCESS.getValue())){%>
	alert('<%=UserEnum.UPDATE_SUCCESS.getDesc()%>');
	<%}%>
<%-- <%String msg = request.getParameter("msg") == null ? "" : request
					.getParameter("msg");%>
					
<%if (msg.equals(UserEnum.USER_ADD_SUCCESS.getValue())) {%>					
   alert('<%=UserEnum.USER_ADD_SUCCESS.getDesc()%>');
<%}%>


<%if (msg.equals(UserEnum.USER_UPDATE_SUCCESS.getValue())) {%>					
   alert('<%=UserEnum.USER_UPDATE_SUCCESS.getDesc()%>');
<%}%> --%>
	
	function searchUser() {
	  document.forms[0].submit();
	}
	
</script>
<script type="text/javascript" src="js/js.js"></script>
</head>
<body style="background-color: white;">
	<!--主体内容-->
	<section class="publicMian">



		<div class="right" style="width: 98%">
			<div class="location">
				<strong>你现在所在的位置是:</strong> <span>用户管理页面</span>
			</div>
			<form action="UserSeachServlet" method="post">
				<div class="search">
					<span>用户名：</span> <input name="username" type="text" value="王超"
						placeholder="请输入用户名" /> <span>邮箱：</span> <input type="text"
						name="email" placeholder="请输入邮箱" value="174" /> <input
						onclick="searchUser()" type="button" value="查询" /> <a
						href="userAdd.jsp">添加用户</a>
				</div>
			</form>
			<!--用户-->
			<table class="providerTable" cellpadding="0" cellspacing="0">
				<tr class="firstTr">
					<th width="15%" height="50px">用户名</th>
					<th width="15%">邮箱</th>
					<th width="15%">创建时间</th>
					<th width="15%">修改时间</th>
					<th width="20%">用户头像</th>
					<th width="20%">操作</th>
				</tr>


				<!-- 		<tr>
					<td>hanlu</td>
					<td>韩露</td>
					<td>女</td>
					<td>20</td>
					<td>15918230478</td>
					<td><a href="userView.jsp"><img src="img/read.png"
							alt="查看" title="查看" /> </a> <a href="userUpdate.jsp"><img
							src="img/xiugai.png" alt="修改" title="修改" /> </a> <a href="#"
						class="removeUser"><img src="img/schu.png" alt="删除" title="删除" />
					</a></td>
				</tr> -->

				<%
					for (User user : userList) {
				%>
				<tr>
					<td><%=user.getUsername()%></td>
					<td><%=user.getEmail()%></td>
					<td><%=user.getCreatetime()%></td>
					<td><%=user.getUpdatetime()%></td>
					<td><img width="120px" height="90px" alt="该用户没有上传头像"
						style="margin-top: 15px"
 						src="<%=basePath %>upload/<%=user.getIamgepath()%>" 
<!-- 						https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.zhimg.com%2Fv2-91a494cd59e33784d14595c0345cce05_1440w.jpg%3Fsource%3D172ae18b&refer=http%3A%2F%2Fpic1.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659086729&t=049b9927dc900f509b98a96add6e8ffc" -->
					</td>
					<td><a href="UserFindByID?userid=<%=user.getId()%>"><img
							src="img/read.png" alt="查看" title="查看" /> </a> 
							<a href="userUpdate.jsp?pageindex=<%=request.getParameter("pageindex") %>&userid=<%=user.getId()%>&username=<%=user.getUsername()%>&email=<%=user.getEmail()%>
							&password=<%=user.getPassword()%>&iamgepath=<%=user.getIamgepath()%>">
							<img src="img/xiugai.png" alt="修改" title="修改" 
							/> </a> 
							<a href="#"
						class="removeUser" onclick="delSetData(<%=user.getId()%>)"
						userid02=<%=user.getId()%>><img src="img/schu.png" alt="删除"
							title="删除" /> </a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="7"><select id="chagePageNumber"
						onchange="chagePageNumber(this.value,<%=pageVO.getPageIndex().intValue()%>)">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
					</select>
						<%
					for (int i = 1; i <= lastPage.intValue(); i++) {
						if (pageVO.getPageIndex().intValue() == i) {
				%>
				<a style="color: red;"
					href="UserListByPageServlet?pageindex=<%=i%>&pagenumber=<%=pageNumber.intValue()%>"
					style="margin-right: 5px"><%=i%>
					</a>
				<%
					} else {
				%>
				<a
					href="UserListByPageServlet?pageindex=<%=i%>&pagenumber=<%=pageNumber.intValue()%>"
					style="margin-right: 5px"
><%=i%></a>
				<%
					}
					}
				%>
					</td>
				</tr>
			</table>
		</div>
	</section>



	<!--点击删除按钮后弹出的页面-->
	<div class="zhezhao"></div>
	<div class="remove" id="removeUse">
		<div class="removerChid">
			<h2>提示</h2>
			<div class="removeMain">
				<p>你确定要删除该用户吗？</p>
				<a href="#" userid="" id="yes" onclick="delUser()">确定</a> <a
					href="#" id="no">取消</a>
			</div>
		</div>
	</div>


</body>
</html>