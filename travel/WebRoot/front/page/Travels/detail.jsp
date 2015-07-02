<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="cn.travel.model.User"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>游记</title>
<link rel="stylesheet" href="lib/style.css">
<style type="text/css">
a:hover{
	text-decoration:underline;
}
a{
	text-decoration:none;
	color:#000;
}
#third{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:80px;
	clear:both;
}
#third header h1,h2{
	display:inline;
	font-family:"宋体";
}
#third header h2{
	color:#33cccc;
}
#third header img{
	width:30px;
	position:relative;
	top:4px;
	margin-left:5px;
	margin-right:5px;
}
#publicTime{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:20px;
	text-align:right;
	color:#666666;
}
</style>
</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>
<div id="third">
    <header>
        <h1><a href="<%=contextPath%>/front/front_Travels_toIndex.do">游记</a></h1><img src="<%=contextPath%>/front/images/right.png"><h2>${title }</h2><hr>
    </header>
    <div>
    ${content }
    </div>
</div>
<div id="publicTime">作者：${userName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
发布时间：<fmt:formatDate value="${publicTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
<!-- 友情链接 -->
  	<s:action name="front_Friendlink_toList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
	</s:action>
</body>
</html>
