<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>福州景区</title>
<link rel="stylesheet" href="<%=contextPath %>/front/lib/style.css">
<link rel="stylesheet" href="<%=contextPath %>/front/lib/pages.css">
<script type="text/javascript" src="<%=contextPath %>/front/lib/jquery-1.9.1.js"></script>
<style type="text/css">
a{
	text-decoration:none;
	color:#000;
}
#third{
	margin-top:90px;
	clear:both;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
}
.content{
	width:740px;
	overflow:hidden;
	height:150px;
	margin-top:30px;
}
.content header{
	border-radius: 10px;
	overflow:hidden;
	width:200px;
	float:left;
	height:150px;
}
.content article{
	width:510px;
	float:right;
	margin-top:-20px;
	color:#666;
}
.content article h1 a{
	color:#33cc33;
}
.content article section{
	color:#000;
	margin-top:-5px;
	margin-bottom:10px;
}
.content article aside{
	float:right;
	margin-top:30px;
	color:#000;
	font-size:18px;
}
.content article aside span{
	color:#F00;
}
.content article section:nth-child(3){
	height:30px;
}
.content article span{
	float:right;
}
.asides{
	float:right;
	width:200px;	
	height:50px;
}
.asides h2{
	color:#33cc33;
	margin-top:-10px;
}
.asides ul{
	margin-left:-25px;
}
.asides li{
	margin-bottom:5px;
}
footer{
	text-align:center;
	clear:both;
	margin-top:30px;
	width: 700px;
	margin-bottom:20px;
}
</style>
</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>
<div id="third">
	<!-- 热门景区 -->
	<s:action name="front_Scenery_toHot" executeResult="true" namespace="/front">
		<s:param name="page">1</s:param>
		<s:param name="rows">6</s:param>
	</s:action>
	<!-- 景区列表 -->
	<s:action name="front_Scenery_toList" executeResult="true" namespace="/front">
		<s:param name="page">1</s:param>
		<s:param name="rows">5</s:param>
	</s:action>
  	
  	<!-- 友情链接 -->
  	<s:action name="front_Friendlink_toList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
</s:action> 
</div>
</body>
</html>
