<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>最新资讯</title>
<link rel="stylesheet" href="<%=contextPath %>/front/lib/style.css">
<link rel="stylesheet" href="<%=contextPath %>/front/lib/pages.css">
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
	margin-top:100px;
	clear:both;
}
#third aside{
	float:right;
	width:270px;	
}
#third aside h2{
	color:#33cccc;
	margin-top:-10px;
}
#third aside ul{
	margin-left:-20px;
}
#third aside li{
	margin-bottom:5px;
}
#third div{
	border-right: thin solid #33cccc;
	width:715px;
}
#third section{
	width: 700px;
	border-collapse: collapse;
	border-bottom: thin solid #33cccc;
	padding-bottom:10px;
}
#third section:hover{
	background-color:#ecebeb;
}
#third section article{
	overflow:hidden;
	margin-bottom:5px;
}
#third section span{
	float:right;
}
footer{
	text-align:center;
	clear:both;
	margin-top:20px;
	width: 700px;
}
footer a{
	color:#000;
	text-decoration:none;
}
</style>
</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>
<div id="third">
	
    <!-- 热门新闻 -->
	<s:action name="front_News_toHot" executeResult="true" namespace="/front">
		<s:param name="page">1</s:param>
		<s:param name="rows">6</s:param>
	</s:action>
	<!-- 新闻列表 -->
	<s:action name="front_News_toList" executeResult="true" namespace="/front">
		<s:param name="page">1</s:param>
		<s:param name="rows">5</s:param>
	</s:action>
	 
</div>

<!-- 友情链接 -->
  	<s:action name="front_Friendlink_toList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
	</s:action>
</body>
</html>
