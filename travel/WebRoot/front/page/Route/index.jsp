<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>旅游线路</title>
<link rel="stylesheet" href="<%=contextPath %>/front/lib/style.css">
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
	height:120px;
	margin-top:30px;
}
.content header{
	border-radius: 10px;
	overflow:hidden;
	width:160px;
	float:left;
	height:120px;
}
.content article{
	width:550px;
	float:right;
	margin-top:-20px;
	color:#666;
}
.content article h1 a{
	color:#33cccc;
}
.content article section{
	color:#000;
	margin-top:-5px;
	margin-bottom:10px;
}
.content article span{
	float:right;
}
#third aside{
	float:right;
	width:200px;	
}
#third aside h2{
	color:#33cccc;
	margin-top:-10px;
}
#third aside ul{
	margin-left:-25px;
}
#third aside li{
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
<jsp:include page="${contextPath}/nav.jsp"></jsp:include>


<div id="third">
	<!-- 热门路线 -->
	<s:action name="front_Route_toHot" executeResult="true" namespace="/front">
		<s:param name="routeType">${routeType}</s:param>
		<s:param name="page">1</s:param>
		<s:param name="rows">6</s:param>
	</s:action>
	<!-- 线路列表 -->
	<s:action name="front_Route_toList" executeResult="true" namespace="/front">
		<s:param name="routeType">${routeType}</s:param>
		<s:param name="page">1</s:param>
		<s:param name="rows">2</s:param>
	</s:action>
</div>
</body>
</html>
