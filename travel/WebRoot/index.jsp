<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="cn.travel.model.User"%>
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
   	        url: '<%=contextPath%>/front_User_login.do',       //覆盖了form的action属性
	        type:     'post',        
	        dataType: 'json',     //(依据服务器返回类型进行设置) 
	        clearForm: true ,      //在成功提交后清除所有的表单域内容
	        resetForm: true ,       //在成功提交后重置所有的表单域内容
	        timeout:   3000 ,
	    };
	     //为表单关联Ajax提交方法
	    $('#myform').ajaxForm(options); 
	     
	    $("#addMsg").leanModal();
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
	response.sendRedirect("login_toLogin.do");
	/* request.getRequestDispatcher("login_toLogin.do").forward(request, response); */
%> --%>

});
function logout(){
	$.ajax({
		url: '<%=contextPath%>/front_User_logout.do', 
        type:     'post',        
        dataType: 'json',     //(依据服务器返回类型进行设置) 
        success:function(json){
        	location.href ="<%=contextPath%>/index.jsp";
        },
        error:function(){
        	alert("发生错误");
        }
	});
}

function showResponse(responseText, statusText, xhr, $form) {
	if(responseText.success){
		unsubmit=true;
		var arr=new Array();
		arr=responseText.msg.split(',');
		$("#second nav div").empty();
		$("#second nav div").append("<a href=\"<%=contextPath%>/front_User_person.do?id="+arr[0]+"\">尊敬的会员</a>&nbsp;<a href=\"javascript:logout()\">注销</a>");
		if(arr[1]=="1"){
			console.info("被调用");
			$("#second nav ul").append("<li><a href=\"login_doLogin.do\">后台管理</a></li>");
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
	height: 260px;
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
<header>
	<img src="front/images/index_01.jpg">
</header>
<div id="second">
	<nav>
    	<ul>
        	<li>首页</li>
            <li><a href="#">酒店</a></li>
            <li><a href="#">旅游路线</a></li>
            <li><a href="#">自由行</a></li>
            <li><a href="<%=contextPath%>/front_Message_index.do">留言</a></li>
            <s:if test="#session.loginUser.role==1">
            	<li><a href="login_doLogin.do">后台管理</a></li>
            </s:if>
        </ul>
        <div>
        <s:if test="#session.user==null">
        	<span>登录</span>│<a href="front/register.jsp">注册</a>
            <section id="sign">
            	<form action="<%=contextPath%>/front_User_login.do" id="myform">
                <table>
                	<tr><td>手机号：</td><td><input type="text" name="mobile" autocomplete="off"></td></tr>
                    <tr><td>密码：</td><td><input type="password" name="pwd"></td></tr>
                    <tr><td colspan="2" height="40px"><center><input type="submit" value="登录" class="button"></center></td>
                 </table>
            </section>
        </s:if><s:else>
            <a href="<%=contextPath%>/front_User_person.do?id=<s:property value="#session.user.getId()"/>">尊敬的会员</a>&nbsp;<a href="javascript:logout()">注销</a>
        </s:else>
        </div>
    </nav>
    <div id="slider01"></div>
</div>
<div id="third">
	<header>
    	福州酒店
    </header>
    
    <section class="jiudian">
    	<img src="front/images/jiudian-1.jpg">
        <section>
        	<a href="#">福州舒馨时代酒店<br>
            ¥<span>360</span>起</a>
        </section>
    </section>
    <section  class="jiudian">
    	<img src="front/images/jiudian-2.jpg">
        <section>
        	<a href="#">福州香格里拉大酒店<br>
            ¥<span>360</span>起</a>
        </section>
    </section>
    <section class="jiudian">
    	<img src="front/images/jiudian-1.jpg">
        <section>
        	<a href="#">福州舒馨时代酒店<br>
            ¥<span>360</span>起</a>
        </section>
    </section>
    <section class="jiudian">
    	<img src="front/images/jiudian-2.jpg">
        <section>
        	<a href="#">福州舒馨时代酒店<br>
            ¥<span>360</span>起</a>
        </section>
    </section>
    <section class="jiudian">
    	<img src="front/images/jiudian-1.jpg">
        <section>
        	<a href="#">福州舒馨时代酒店<br>
            ¥<span>360</span>起</a>
        </section>
    </section>
    <section class="jiudian">
    	<img src="front/images/jiudian-2.jpg">
        <section>
        	<a href="#">福州舒馨时代酒店<br>
            ¥<span>360</span>起</a>
        </section>
    </section>
    
    <footer>
    	<a href="#">更多酒店<img src="front/images/you-1.png"></a>
    </footer>
</div>
<div id="fourth">
	<header>
    	必玩景区
    </header>
    <section><a href="#">
    	<img src="front/images/jing1.jpg" width="242" height="162">
        <table>
        	<tr><td><img src="front/images/jingdianbiao.png">&nbsp;三坊七巷</td></tr>
            <tr><td><span>三坊七巷”地处福州市中心，是南后街两旁从北到南依</span></td></tr>
         </table></a>
    </section>
    <section>
    	<img src="front/images/jing2.jpg" width="242" height="162">
        <table>
        	<tr><td><img src="front/images/jingdianbiao.png">&nbsp;云顶</td></tr>
            <tr><td><span>三坊七巷”地处福州市中心，是南后街两旁从北到南依</span></td></tr>
         </table>
    </section>
    <section>
    	<img src="front/images/jing1.jpg" width="242" height="162">
        <table>
        	<tr><td><img src="front/images/jingdianbiao.png">&nbsp;三坊七巷</td></tr>
            <tr><td><span>三坊七巷”地处福州市中心，是南后街两旁从北到南依</span></td></tr>
         </table>
    </section>
    <section><a href="#">
    	<img src="front/images/jing1.jpg" width="242" height="162">
        <table>
        	<tr><td><img src="front/images/jingdianbiao.png">&nbsp;三坊七巷</td></tr>
            <tr><td><span>三坊七巷”地处福州市中心，是南后街两旁从北到南依</span></td></tr>
         </table></a>
    </section>
    <section><a href="#">
    	<img src="front/images/jing1.jpg" width="242" height="162">
        <table>
        	<tr><td><img src="front/images/jingdianbiao.png">&nbsp;三坊七巷</td></tr>
            <tr><td><span>三坊七巷”地处福州市中心，是南后街两旁从北到南依</span></td></tr>
         </table></a>
    </section>
    <section>
    	<img src="front/images/jing1.jpg" width="242" height="162">
        <table>
        	<tr><td><img src="front/images/jingdianbiao.png">&nbsp;三坊七巷</td></tr>
            <tr><td><span>三坊七巷”地处福州市中心，是南后街两旁从北到南依</span></td></tr>
         </table>
    </section>
    <section>
    	<img src="front/images/jing1.jpg" width="242" height="162">
        <table>
        	<tr><td><img src="front/images/jingdianbiao.png">&nbsp;三坊七巷</td></tr>
            <tr><td><span>三坊七巷”地处福州市中心，是南后街两旁从北到南依</span></td></tr>
         </table>
    </section>
    <section><a href="#">
    	<img src="front/images/jing1.jpg" width="242" height="162">
        <table>
        	<tr><td><img src="front/images/jingdianbiao.png">&nbsp;三坊七巷</td></tr>
            <tr><td><span>三坊七巷”地处福州市中心，是南后街两旁从北到南依</span></td></tr>
         </table></a>
    </section>
    <footer>
    	<a href="#">更多景点<img src="front/images/you-2.png"></a>
    </footer>
</div>
<div id="fifth">
	<header>
    	旅游新闻
    </header>
    <section class="example2">    	      
        <ul>
            <li><img src="front/images/jing3.jpg" width="400" height="230"></li>
            <li><img src="front/images/jing2.jpg" width="400" height="230"></li>
            <li><img src="front/images/jing1.jpg" width="400" height="230"></li>
        </ul>
        <ol>
            <li></li>
            <li></li>
            <li></li>
        </ol>
    </section>
    <aside>
    <table>
    	<tr><td><a href="#">福州突降暴雨引发山洪 31名游客被困龙潭景</a></td></tr>
        <tr><td><a href="#">奥体片区将建大型山地公园</a></td></tr>
        <tr><td><a href="#">福州突降暴雨引发山洪 31名游客被困龙潭景</a></td></tr>
        <tr><td><a href="#">奥体片区将建大型山地公园</a></td></tr>
        <tr><td><a href="#">福州突降暴雨引发山洪 31名游客被困龙潭景</a></td></tr>
        <tr><td><a href="#">奥体片区将建大型山地公园</a></td></tr>
        <tr><td><a href="#">福州突降暴雨引发山洪 31名游客被困龙潭景</a></td></tr>
        <tr><td><a href="#">奥体片区将建大型山地公园</a></td></tr>
    </table>
    </aside>
    <footer>
    	<a href="#">更多新闻</a><img src="front/images/you-3.png">
    </footer>
</div>
<div id="sixth">
	<header>
    	合作旅游局
    </header>
    <div>
    	<section>
        	<a href="#"><img src="front/images/wai-1.jpg"><br>澳大利亚旅游局</a>
        </section>
        <section>
        	<img src="front/images/wai-2.jpg"><br>柏林旅游局
        </section>
        <section>
        	<img src="front/images/wai-3.jpg"><br>香港旅游发展局
        </section>
        <section>
        	<img src="front/images/wai-1.jpg"><br>澳大利亚旅游局
        </section>
        <section>
        	<img src="front/images/wai-2.jpg"><br>柏林旅游局
        </section>
        <section>
        	<img src="front/images/wai-3.jpg"><br>香港旅游发展局
        </section>
        <section>
        	<img src="front/images/wai-1.jpg"><br>澳大利亚旅游局
        </section>
        <section>
        	<img src="front/images/wai-2.jpg"><br>柏林旅游局
        </section>
        <section>
        	<img src="front/images/wai-3.jpg"><br>香港旅游发展局
        </section>
        <section>
        	<img src="front/images/wai-1.jpg"><br>澳大利亚旅游局
        </section>
        <section>
        	<img src="front/images/wai-2.jpg"><br>柏林旅游局
        </section>
        <section>
        	<img src="front/images/wai-3.jpg"><br>香港旅游发展局
        </section>
        <section>
        	<img src="front/images/wai-1.jpg"><br>澳大利亚旅游局
        </section>
        <section>
        	<img src="front/images/wai-2.jpg"><br>柏林旅游局
        </section>
        <section>
        	<img src="front/images/wai-3.jpg"><br>香港旅游发展局
        </section>
        <section>
        	<img src="front/images/wai-1.jpg"><br>澳大利亚旅游局
        </section>
        <section>
        	<img src="front/images/wai-2.jpg"><br>柏林旅游局
        </section>
        <section>
        	<img src="front/images/wai-3.jpg"><br>香港旅游发展局
        </section>
    </div>
    <footer>
    	Copyright© 1999-2015, ctrip.com. All rights reserved. | ICP证：沪B2-20050130
    </footer>
</div>
</body>
</html>
