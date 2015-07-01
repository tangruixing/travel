<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>福州景区</title>
<link rel="stylesheet" href="lib/style.css">
<link type="text/css" href="lib/bottom.css" rel="stylesheet" />
<script type="text/javascript" src="lib/jquery-1.9.1.js"></script>
<!-- 图片展示框架 -->
<script type="text/javascript" src="lib/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="lib/jquery.pikachoose.min.js"></script>
<script type="text/javascript" src="lib/jquery.touchwipe.min.js"></script>
<script language="javascript">
$(document).ready(
	function (){
		$.ajax({
    		url: '<%=contextPath%>/front/front_Scenery_findImg.do', 
    		data:{"id": ${id}},//
	        type:     'post',        
	        dataType: 'json',     //(依据服务器返回类型进行设置) 
	        success:function(img){
	        	console.info(img[0]);
	        	if(img[0])
	        		$(".pikachoose").PikaChoose({data:img});
	        },
	        error:function(){
	        	alert("发生错误");
	        }
    	});
			 
	});
	
function showbyID(id){
	$("#"+id).css("display","block");
}
function closebyID(id){
	$("#"+id).css("display","none");
}
</script>
<style type="text/css">
a:hover{
	text-decoration:underline;
}
a{
	text-decoration:none;
	color:#000;
}
#third{
	margin-top:20px;
	clear:both;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
}
#third h1{
	display:inline;	
	color:#33cc33;
	font-size:24px;
	font-size:36px;
}
#third aside{
	display:inline;
	margin-left:30px;
	font-size:20px;
}
#third aside span{
	color:#F00;
}
#third section{
	margin-top:10px;
}
#map{
	width:500px;
	height:300px;
	display:none;
	position:fixed;
	top:100px;
	left:260px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	background-color: #FFF;
}
#map section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
#fourth{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:10px;
}
#fourth h2{
	color:#33cccc;
}
#fourth div{
	clear:both;
}
#fourth div section h3{
	display:inline;
	margin-left:10px;
	position:relative;
	top:-7px;
}
#fourth div section:nth-child(1){
	margin-bottom:5px;
	background-color:#ebeaea;
	height:30px;
}
#fourth div section:nth-child(2){
	width:250px;
	float:left;
	margin-left:30px;
	margin-bottom:15px;
}
#fourth div article{
	width:710px;
	float:right;
}
#back{
	margin-top:70px;
	clear:both;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	font-size:18px;
}
#back span{
	font-size:26px;
}
#back img{
	position:relative;
	top:5px;
	margin:0 5px;
}
#map{
	width:500px;
	height:300px;
	display:none;
	position:fixed;
	top:100px;
	left:260px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	background-color: #FFF;
}
#map section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
</style>
</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>
<div id="back">
	<span><a href="javascript:history.back()">福州景区</a></span><img src="images/right.png">${realName}
    <hr>
</div>
<div id="third">
	<h1><img src="<%=contextPath %>/front/images/jingdianbiao.png" width="30">${realName}</h1>
	<s:set value="#{1:'A',2:'AA',3:'AAA',4:'AAAA',5:'AAAAA'}" var="Sgrade"></s:set>
    <s:if test="grade!=0">
        	<aside>级别：<span>${Sgrade[grade]}</span></aside> 
    </s:if>                 
    <section><img src="<%=contextPath %>/front/images/didianbiao.png"><a href="javascript:showbyID('map')">${address }</a></section>
    <section>开放时间：${startTime }-${endTime }&nbsp;联系电话：${telphone }</section>
    <div class="pikachoose"></div>
    <section>
    	${summary}
    </section>
</div>

<s:action name="front_Scenery_toJingDianList" executeResult="true" namespace="/front">
	<s:param name="id">${id}</s:param>
</s:action>

<div id="map">
	<section><a href="javascript:closebyID('map')"><img src="images/close.png"></a></section>
</div>
<div id="map">
	<section><a href="javascript:closebyID('map')"><img src="images/close.png"></a></section>
</div>
</body>
</html>
