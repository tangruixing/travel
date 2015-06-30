<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>旅游路线</title>
<link rel="stylesheet" href="<%=contextPath%>/front/lib/style.css">
<style type="text/css">
a{
	text-decoration:none;
	color:#000;
}
#third{
	margin-top:10px;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	font-size:18px;
}
#third aside{
	width:200px;
	height:150px;
	border-radius: 10px;
	overflow:hidden;
	float:right;
	margin-right:200px;
}
#third h1{
	color:#33cccc;
}
#third section{
	margin-top:15px;
}
#third div{
	width:100%;
	clear:both;
	height:200px;
	padding-top:5px;
}
#route_map{
	width:100%;
	clear:both;
	height:200px;
	padding-top:5px;
}
#third span{
	color:#F00;
}
#fourth{
	margin-top:90px;
	clear:both;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	font-size:18px;
}
#fourth span{
	font-size:26px;
}
#fourth img{
	position:relative;
	top:5px;
	margin:0 5px;
}

 body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #show-map{height:515px;width:1198px;}
        #r-result{width:100%; font-size:14px;line-height:20px;}
        p{margin-left:5px; font-size:14px;}
</style>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=CA3NlRi4BRVc5elDe4l0tXnu"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
<script type="text/javascript"	src="<%=contextPath%>/back/style/js/line.js"	charset="utf-8"></script>
</head>

<body>
<header>
	<img src="<%=contextPath %>/front/images/index_01.jpg">
</header>
<jsp:include page="${contextPath}/nav.jsp"></jsp:include>
<div id="fourth">
	<span><a href="<%=contextPath %>/front/front_Route_toIndex.do?routeType=${routeType}">${routeType==0?'旅游线路':'自由行' }</a></span><img src="images/right.png">${realName}
</div>
<div id="third">
	<hr>
	<aside><img src="images/jing2.jpg" width="200" height="150"></aside>
	<h1>${realName}</h1>
	<s:if test="routeType==0">
		  人均消费：<span>￥</span>${money}
		  <a href="<%=contextPath%>/front_Order_PayRoute.do">报名</a>
	</s:if>
  	<s:elseif test="routeType==1">
  		<a href="<%=contextPath %>/front_Order_CollectRoute.do">收藏</a>
  	</s:elseif>
    
    
    
    <section>出发时间： <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>结束时间： <fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></section>
 
    
   <%--  <article>${description}</article> --%>
</div>

<div id="route_map">
    	<hr>
        地图	
        
         <div id="myMap">
 
    
	    	<div id="show-map"></div>
		</div>
</div>


 
    <article>${description}</article>
</body>

<script type="text/javascript">
	$(function(){
		  var url=sy.contextPath + '/front/front_Route_loadRouteplanWithRid.do';
	     	
	        var line=new myLine();
		var value={
				rid:${id}
			}
			line.lineDivMap(url,value,"route_map");
	})
</script>
</html>
