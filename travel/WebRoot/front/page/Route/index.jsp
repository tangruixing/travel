<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>旅游线路</title>
<link rel="stylesheet" href="<%=contextPath %>/front/lib/style.css">
<link rel="stylesheet" href="<%=contextPath %>/front/lib/pages.css">
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery-1.9.1.js"></script>
<style type="text/css">
a{
	text-decoration:none;
	color:#000;
}
#second{
	margin-top:0px;
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
	margin-top:10px;
	padding:20px 5px;
	padding-left:0px;
	border-bottom: thin outset #000000;
}
.content:hover{
	background-color:#ecebeb;
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
	height:42px;
	overflow:hidden;
	width:550px;
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
.button{
	background: #006666;
	display: inline-block;
	text-decoration: none;
	border-radius: 5px;
	border-collapse: collapse;
	padding:4px 8px;
	word-break:break-all;
	color: #fff;
	font-size:14px;
}
.button a{
	color: #fff;
}
input{
	font-size:18px;
	border-radius: 5px;
}
</style>
</head>

<body>


<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>

<s:if test="#request.routeType==0">
	<script type="text/javascript">
		$("nav ul li:eq(2)").css("background-color","#006666");
	</script>
</s:if><s:else>
	<script type="text/javascript">
		$("nav ul li:eq(3)").css("background-color","#006666");
	</script>
</s:else>



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
