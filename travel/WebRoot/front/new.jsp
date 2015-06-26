<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="cn.travel.model.User"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>新闻</title>
<link rel="stylesheet" href="lib/style.css">
<style type="text/css">
a:hover{
	text-decoration:underline;
}
a{
	text-decoration:none;
	color:#000;
}
#second{
	margin-top:-5px;
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
</style>
</head>

<body>
<header>
	<img src="images/index_01.jpg">
</header>
<div id="second">
	<nav>
    	<ul>
        	<li><a href="<%=contextPath%>/front_Index_index.do">首页</a></li>
            <li>酒店</li>
            <li><a href="#">旅游路线</a></li>
            <li><a href="#">自由行</a></li>
            <li><a href="<%=contextPath%>/front_Message_index.do">留言</a></li>
            
        </ul>
        <div>
        	尊敬的会员&nbsp;<a href="javascript:logout()">注销</a>
        </div>
	</nav>
</div>
<div id="third">
    <header>
        <h1><a href="<%=contextPath%>/index.jsp">旅游新闻</a></h1><img src="images/right.png"><h2>正文</h2><hr>
    </header>
    <div></div>
</div>
</body>
</html>
