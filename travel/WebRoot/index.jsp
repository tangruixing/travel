<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>你好，福州</title>
<!--jquery库文件放在最前面-->
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery-1.9.1.js"></script>
<!--Slider插件-->	
<script type="text/javascript" src="<%=contextPath%>/front/lib/slider.js"></script>
<link href="<%=contextPath%>/front/lib/slider.min.css" rel="stylesheet" type="text/css" /> 
<!--引用相册脚本-->
<script type="text/javascript" src="<%=contextPath%>/front/lib/index_slider.js"></script>
<script src="<%=contextPath%>/front/lib/jquery.luara.0.0.1.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.form.min.js"></script>
<script type="text/javascript">
var unsubmit=true;
$(document).ready(function(e){
	$(".jiudian img").mouseover(function () {   //鼠标经过显示酒店名称
		$(this).next().css("display","block");
	});
	
	$(".jiudian section").mouseout(function(){  //鼠标离开隐藏
		$(this).css("display","none");
	});
	
	$("#second nav div").mouseover(function(){		//显示登录界面
		$("#sign").css("display","block");
	});
	
	$("#second nav div").mouseout(function(){		//隐藏登录界面
		$("#sign").css("display","none");
	});
	
    $(".example2").luara({width:"400",height:"230",interval:4500,selected:"seleted",deriction:"left"});
    
    var options = { 	        
	        success:       showResponse,  //提交之后的回调函数
   	        url: '<%=contextPath%>/front/front_User_login.do',       //覆盖了form的action属性
	        type:     'post',        
	        dataType: 'json',     //(依据服务器返回类型进行设置) 
	        clearForm: true ,      //在成功提交后清除所有的表单域内容
	        resetForm: true ,       //在成功提交后重置所有的表单域内容
	        timeout:   3000 ,
	    };
	     //为表单关联Ajax提交方法
	    $('#myform').ajaxForm(options); 
	     
	   /*  $("#addMsg").leanModal(); */

});

function showResponse(responseText, statusText, xhr, $form) {
	if(responseText.success){
		unsubmit=true;
		var arr=new Array();
		arr=responseText.msg.split(',');
		$("#second nav div").empty();
		if(arr[1]=="2"){
			$("#second nav div").append("<a href=\"<%=contextPath%>/front_User_person.do?id="+arr[0]+"\">尊敬的会员</a>&nbsp;<a href=\"<%=contextPath%>/front_User_logout.do\">注销</a>");
		}else{
			$("#second nav div").append("<a href=\"<%=contextPath%>/login_toLogin.do\">尊敬的会员</a>&nbsp;<a href=\"<%=contextPath%>/front_User_logout.do\">注销</a>");
		}
	}else{
		if(unsubmit){
			$("#second nav div section").append("<center><span style=\"color:#F00\">手机号或密码错误！</span></center>");
			unsubmit=false;
		}
	}
}
</script>	
<link rel="stylesheet" href="front/lib/style.css">
<!--左滑样式-->
<link rel="stylesheet" href="front/lib/luara.left.css"/>
<style type="text/css">
nav ul li:nth-child(1){
	background-color:#006666;
}
nav div{
	position:relative;
}
nav section{
	background-color: #FFF;
	position: absolute;
	z-index: 99;
	padding: 10px;
	top: 40px;
	left: -150px;
	color: #000;
	font-size: 18px;
	width: 250px;
	display: none;
	border-collapse: collapse;
	border-width: thin;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	-webkit-box-shadow: 0px 2px 2px #000000;
	box-shadow: 0px 1px 1px #000000;
}
nav section input{
	border-radius: 3px;
}
.button, .button:visited {
	background: #cc66cc;
	display: inline-block;
	padding: 5px 20px 6px;
	color: #FFF;
	border-radius: 6px;
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
	font-family:"幼圆", "宋体";
	font-size:16px;
}
#second{
	margin-top:0px;
}
#third{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:60px;
}
#slider01{
	clear:both;
	width:100%;
}
#third header{
	background-image: url(front/images/index_08.jpg);
	width: 100%;
	height: 50px;
	background-size: 100% 100%;
	color:#3399cc;
	font-size:36px;
	font-family:"黑体";
	margin-bottom:20px;
}
.jiudian{
	float:left;
	width:16.6%;
	position:relative;
	overflow:hidden;
}
.jiudian img{
	position:relative;
	height:216.7px;
	left:-60px;
}
.jiudian section{
	background-image:url(front/images/di.png);
	background-size: 100% 100%;
	height:115px;
	width:166px;
	position:absolute;
	top:-0px;
	text-align:center;
	padding-top:100px;
	display:none;
}
.jiudian section span{
	color:#ff6600;
	font-size:24px;
}
.jiudian section a{
	color:#FFF;
}
#third footer{
	text-align:right;
	width:100%;
	padding-top:10px;
	clear:both;
	font-size:20px;
	line-height:20px;
}
#third footer a{
	color:#3399cc;
	font-family:"幼圆", "宋体";
	text-decoration:none;
}
#fourth{
	margin-top:40px;
	height:300px;
	width:1000px;
	margin-left:auto;
	margin-right:auto;
}
#fourth header{
	background-image: url(front/images/index_10.jpg);
	width: 100%;
	height: 50px;
	background-size: 100% 100%;
	color:#33cc33;
	font-size:36px;
	font-family:"黑体";
	margin-bottom:10px;
}
#fourth section{
	width: 242px;
	height: 265px;
	float: left;
	margin-top: 10px;
	margin-right:8px;
	overflow: hidden;
	border-collapse: collapse;
	border-width: thin;
	border-style: dotted;
}
#fourth section:nth-child(5),#fourth section:nth-child(9){
	margin-right:0px;
}
#fourth section td{
	padding-left: 10px;
	padding-top:5px;
	border-top-width: thin;
	border-top-collapse: collapse;
	border-top-style: dotted;
	color: #33cc33;
	font-family: "黑体";
	font-size: 24px;
}
#fourth section table{
	margin-top:-7px;
}
#fourth section span{
	color:#000;
	font-size:18px;
	font-family:"幼圆", "宋体";
}
#fourth section a{
	text-decoration:none;
}
#fourth footer{
	text-align:right;
	width:100%;
	padding-top:10px;
	clear:left;
	font-size:20px;
	line-height:20px;
}
#fourth footer a{
	color:#33cc33;
	font-family:"幼圆", "宋体";
	text-decoration:none;
}
#fifth{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	clear:both;
	margin-top:400px;
}
#fifth header{
	background-image: url(front/images/index_12.jpg);
	width: 100%;
	height: 50px;
	background-size: 100% 100%;
	color:#ff9900;
	font-size:36px;
	font-family:"黑体";
	margin-bottom:10px;
}
.example2{
	width:400px;
	height:230px;
	margin-top:10px;
	float:left;
	position:relative;
	
}
.example2 ol{position:relative;width: 80px;height: 20px;top:-40px;left:260px;}
.example2 ol li{float:left;width: 10px;height: 10px;margin: 5px;background: #fff;}
.example2 ol li.seleted{background:#ff9900;}
.example2 li{list-style: none;}

.example2 article{
	position:absolute;
	left:0px;
	top:100px;
	background-color:#000;
}

#fifth aside{
	float:left;
	margin-left:20px;
	margin-top:10px;
}
#fifth aside a{
	color:#000;
	text-decoration:none;
	font-size:22px;
	font-family:"黑体";
}
#fifth footer{
	text-align:right;
	width:100%;
	padding-top:10px;
	clear:both;
	font-size:20px;
	line-height:20px;
}
#fifth footer a{
	color:#ff9900;
	font-family:"幼圆", "宋体";
	text-decoration:none;
}
#sixth{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	clear:both;
	margin-top:50px;
}
#sixth header{
	background-image: url(front/images/index_14.jpg);
	width: 100%;
	height: 50px;
	background-size: 100% 100%;
	color:#ff0000;
	font-size:36px;
	font-family:"黑体";
	margin-bottom:10px;
}
#sixth div{
	margin-top:20px;
}
#sixth section{
	width:110px;
	height:80px;
	text-align:center;
	font-size:12px;
	float:left;
	margin-left:1px;
	margin-top:10px;
}
#sixth section a{
	color:#000;
	text-decoration:none;
}
#sixth footer{
	text-align:center;
	width:100%;
	padding-top:50px;
	clear:left;
}
footer img{
	position:relative;
	top:4px;
}
#lean_overlay {
    position: fixed;
    z-index:100;
    top: 50px;
    left: 50px;
    height:100px;
    width:100px;
    background: #FFF;
    display: none;
}
a:hover{
	text-decoration:underline;
}
</style>
</head>

<body>
<jsp:include page="${contextPath}/nav.jsp"></jsp:include>

<s:action name="front_Hotel_toIndexList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">6</s:param>
</s:action>

<s:action name="front_Scenery_toIndexList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">8</s:param>
</s:action>

<s:action name="front_News_toIndexList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">8</s:param>
</s:action>

<s:action name="front_Friendlink_toIndexList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
</s:action>
    <footer>
    	Copyright© 1999-2015, ctrip.com. All rights reserved. | ICP证：沪B2-20050130
    </footer>
</div>
</body>
</html>
