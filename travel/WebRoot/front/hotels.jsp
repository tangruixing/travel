<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html><head>
<meta charset="utf-8">
<title>福州酒店</title>
<script type="text/javascript" src="lib/jquery-1.9.1.js"></script>
<!-- 图片展示框架 -->
<script type="text/javascript" src="lib/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="lib/jquery.pikachoose.min.js"></script>
<script type="text/javascript" src="lib/jquery.touchwipe.min.js"></script>
<!-- 日期输入框架 -->
<script type="text/javascript" src="lib/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="lib/jquery.ui.datepicker-zh-CN.js"></script>
<link type="text/css" href="lib/bottom.css" rel="stylesheet" />
<link rel="stylesheet" href="lib/style.css">
<link href="lib/table.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="lib/jquery-ui-1.10.3.custom.min.css">
<style type="text/css">
nav ul li:nth-child(2){
	background-color:#006666;
}
a:hover{
	text-decoration:underline;
}
a{
	text-decoration:none;
}
#second{
	margin-top:0px;
}
#search{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	padding:20px 0;
	clear:both;
}
#search div{
	float:right;
}
#third{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	clear:both;
}
#third div{
	margin-top: 20px;
	border-collapse: collapse;
	padding-bottom: 20px;
	border-bottom: thin outset #000000;
}
#third div section{
	float: left;

}
#third div section:nth-child(1){
	width: 100px;
	height: 100px;
	border-radius: 10px;
	overflow:hidden;
	margin-right:10px;
}
#third div section:nth-child(2){
	width:600px;
	height:50px;
	color:#33cccc;
	font-size:30px;
	font-family:"宋体";
	padding-top:10px;
	margin-right:10px;
}
#third div section:nth-child(2) span{
	color:#000;
	font-size:16px;
	font-family:"黑体";
	margin-left:5px;
}
#third div section:nth-child(3){
	width:100px;
	height:60px;
}
#third div section:nth-child(3) span{
	font-size:36px;
	color:#ff6600;
}
#third div section:nth-child(4){
	width:600px;
	height:50px;
	word-break:break-all;
}
#third div section:nth-child(5){
	width:100px;
	height:40;
}
#third div table{
	clear:both;
	width:100%;
}
#third div table td:nth-child(6) span{
	color:#ff6600;
}
#third div a{
	color:#000;
}
.button{
	background: #006666;
	display: inline-block;
	text-decoration: none;
	border-radius: 5px;
	padding:5px 10px;
	color:#FFF;
}
.button a{
	color:#FFF !important;
	text-decoration:none;
}
footer{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	text-align:center;
	margin-top:20px;
}
footer a{
	color:#000;
}
#showhotel{
	position: fixed;
	width: 80%;
	height: 500px;
	background-color: #FFF;
	left: 10%;
	top: 20px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	display:none;
}
#showhotel section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
#bookroom{
	position: fixed;
	width: 700PX;
	height: 250px;
	background-color: #FFF;
	left: 15%;
	top: 50px;
	-webkit-box-shadow: 0px 0px 8px 3px #000000;
	box-shadow: 0px 0px 8px 3px #000000;
	display:none;
	font-size: 20px;
	font-family: "幼圆", "宋体";
	margin-top: 20px;
}
#bookroom section{
	float:right;
	position:relative;
	left:15px;
	top:-15px;
	z-index:1000;
}
#bookroom table{
	margin-top:50px;
	width:650px;
	margin-left:auto;
	margin-right:auto;
	text-align:right;
}
input{
	border-radius: 5px;
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
<script language="javascript">

function showHotelPic(){
	$("#showhotel").css("display","block");
	var a = [
				{"image":"images/jiudian-1.jpg","caption":"","link":"http://pikachoose.com","title":"Image 1"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 2"},
				{"image":"images/jiudian-1.jpg","caption":"Any donation is appreciated. PikaChoose is free to use!","link":"http://pikachoose.com","title":"Image 3"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 4"},
				{"image":"images/jiudian-1.jpg","caption":"Any donation is appreciated. PikaChoose is free to use!","link":"http://pikachoose.com","title":"Image 3"},
				{"image":"images/jiudian-2.jpg","caption":"Be sure to check out <a href=\"http://www.pikachoose.com\">PikaChoose.com</a> for updates.","link":"http://pikachoose.com","title":"Image 4"}
				];
		
			$(".pikachoose").PikaChoose({data:a});	
}
function closebyID(id){
	$("#"+id).css("display","none");
}
</script>

</head>

<body>

<a href="javascript:showHotelPic()">显示</a>
<div id="showhotel">
	<section><a href="javascript:closebyID('showhotel')"><img src="images/close.png"></a></section>
	<div class="pikachoose"></div>
</div>
<s:action name="front_Friendlink_toList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
</s:action>
</body>
</html>
