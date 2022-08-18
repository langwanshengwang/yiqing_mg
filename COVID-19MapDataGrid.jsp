<%@page import="com.qianfeng.vo.PageVO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.qianfeng.entity.City"%>
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
	// getAttribute 是获取服务器对请求报文插入的数据  
	// List<city> cityList = (List<city>) request.getAttribute("citylist");
	PageVO pageVO = (PageVO) request.getAttribute("pageVO");
	List<City> cityList = (List<City>)pageVO.getData();
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
  location.href = "MapDataGridServlet?pageindex="+pageIndex+"&pagenumber="+pageNumber+"";
 }


/* 这行代码 必须要等待HTML全部加载完之后再来执行 */
  
  $(function(){
  $("#chagePageNumber option[value=<%=pageNumber.intValue()%>]").attr("selected","selected");
  });
  
  function delSetData(arg) {
  // 这步操作 相当于 是使用HTML的自定义属性  给其 赋予一个ID
    $("#yes").attr("cityid",arg);
  }
  
  
  function delcity() {
    var cityid = $("#yes").attr("cityid");
    /* 
     ajax 主要参数有
     url
     data (向服务器提交的数据)
     method (提交方法)
     dataType (AJAX成功回调函数的处理方式)
     success (成功回调函数)
     errer (失败回调函数)
     */
     var cityData = {"cityid":cityid};
     
    }
</script>


<script type="text/javascript">
	
<%-- <%String msg = request.getParameter("msg") == null ? "" : request
					.getParameter("msg");%>
					
<%if (msg.equals(cityEnum.city_ADD_SUCCESS.getValue())) {%>					
   alert('<%=cityEnum.city_ADD_SUCCESS.getDesc()%>');
<%}%>


<%if (msg.equals(cityEnum.city_UPDATE_SUCCESS.getValue())) {%>					
   alert('<%=cityEnum.city_UPDATE_SUCCESS.getDesc()%>');
<%}%> --%>
	
	function searchCity() {
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
				<strong>你现在所在的位置是:</strong> <span>城市疫情管理页面</span>
			</div>
			<form action="CitySeachServlet" method="post">
				<div class="search">
					<span>城市名：</span> <input name="cityname" type="text"
						placeholder="请输入城市名"  value="石家庄" />确诊人数（大于等于）：<input name="count" type="text" value="50"
						placeholder="请输入确诊人数" /> <input onclick="searchCity()"
						type="button" value="查询" />
				</div>
			</form>
			<!--城市-->
			<table class="providerTable" cellpadding="0" cellspacing="0">
				<tr class="firstTr">
					<th width="40%" height="50px">城市名</th>
					<th width="40%">感染人数</th>
					<th width="20%">操作</th>
				</tr>
				<%
					for (City city : cityList) {
				%>
				<tr>
					<td><%=city.getCity()%></td>
					<td><%=city.getInfectCount()%></td>
					<td><a href="COVID-19Update.jsp?pageindex=<%=pageVO.getPageIndex()%>&id=<%=city.getId()%>&city=<%=city.getCity()%>&infectCount=<%= city.getInfectCount() %>"><img src="img/xiugai.png" alt="修改"
							title="修改" /> </a></td>
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
					</select> <%
 	for (int i = 1; i <= lastPage.intValue(); i++) {
 		if (pageVO.getPageIndex().intValue() == i) {
 %> <a style="color: red;"
						href="MapDataGridServlet?pageindex=<%=i%>&pagenumber=<%=pageNumber.intValue()%>"
						style="margin-right: 5px"><%=i%></a> <%
 	} else {
 %> <a
						href="MapDataGridServlet?pageindex=<%=i%>&pagenumber=<%=pageNumber.intValue()%>"
						style="margin-right: 5px"><%=i%></a> <%
 	}
 	}
 %>
					</td>
				</tr>
			</table>
		</div>
	</section>





</body>
</html>