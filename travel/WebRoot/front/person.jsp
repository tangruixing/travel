<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
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
	margin-top:0px;
}
#third{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:80px;
	clear:both;
}
#third aside{
	width:200px;
	float:left;
	margin-top:-20px;
}
.categories {
	box-shadow:1px 1px 1px rgba(0, 0, 0, .1);
	-moz-box-shadow:1px 1px 1px rgba(0, 0, 0, .1);
	-webkit-box-shadow:1px 1px 1px rgba(0, 0, 0, .1);
	border:1px solid #fff;
	border-radius:8px;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	background-image: -moz-linear-gradient(top, #fcfcfc, #f4f4f4); /* FF3.6 */
	background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #f4f4f4),color-stop(1, #fcfcfc)); /* Saf4+, Chrome */
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#f4f4f4'); /* IE6,IE7 */
	-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#fcfcfc', endColorstr='#f4f4f4')"; /* IE8 */
	margin-bottom:3px;
	list-style:none;
}
.categories li {
	border-bottom:1px solid #ebeae8;
	border-top:1px solid #fff;
	font-size:16px;
	padding-top:8px;
	padding-bottom:8px;
	padding-left:60px;
	margin-left:-40px;
	}
.categories li:first-child {
	border-top:none;
	background-color:#299898;
	color:#FFF;
	font-size:20px;
	padding-left:55px;
	}
.categories li:last-child {
	border-bottom:none;
	}
.ul2{
	list-style:none;
	display:none;
	background-color:#FFF;
	margin-left:-40px;
}
.ul2 li{
	background-color:#FFF;
	font-size:14px;
	padding-left:70px;
	border:none;
	font-family:"宋体";
}
.ul2 li:hover{
	background-color:#2db0b0 !important;
}
.ul2 li:first-child{
	padding-left:70px;
	background-color:#FFF;
	font-size:14px;
	color:#000;
}
.thridiv{
	width: 760px;
	float: right;
	margin-top: -4px;
	-webkit-box-shadow: inset 0px 0px 4px 0px #333333;
	box-shadow: inset 0px 0px 4px 0px #333333;
	padding-left:10px;
	padding-right:10px;
	padding-bottom:30px;
}
.button{
	background: #006666;
	display: inline-block;
	text-decoration: none;
	border-radius: 5px;
	border-collapse: collapse;
	padding:5px 10px;
	word-break:break-all;
	float:right;
	margin-right:10px;
}
.button a{
	color: #fff;
}
#third section{
	display:none;
}
.pw-strength {clear: both;position: relative;top: 8px;width: 180px;}
.pw-bar{background: url(lib/images/pwd-1.png) no-repeat;height: 14px;overflow: hidden;width: 179px;}
.pw-bar-on{background:  url(lib/images/pwd-2.png) no-repeat; width:0px; height:14px;position: absolute;top: 0px;left: 2px;transition: width .5s ease-in;-moz-transition: width .5s ease-in;-webkit-transition: width .5s ease-in;-o-transition: width .5s ease-in;}
.pw-weak .pw-defule{ width:0px;}
.pw-weak .pw-bar-on {width: 60px;}
.pw-medium .pw-bar-on {width: 120px;}
.pw-strong .pw-bar-on {width: 179px;}
.pw-txt {padding-top: 2px;width: 180px;overflow: hidden;}
.pw-txt span {color: #707070;float: left;font-size: 12px;text-align: center;width: 58px;}
#s03 span{
	color:#F00 !important;
	font-size:10px;
}
#s03 table td{
	padding-bottom:10px;
}
</style>
<script type="text/javascript" src="lib/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".categories li").click(function(e){
		$(".ul2").css("display","none");
		$(this).next().css("display","block");
		});
	
	$('#psw1').keyup(function () { 
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
	
		if (false == enoughRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-defule'); 
			 //密码小于六位的时候，密码强度图片都为灰色 
		} 
		else if (strongRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-strong'); 
			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
		} 
		else if (mediumRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-medium'); 
			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
		} 
		else { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass('pw-weak'); 
			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
		} 
		return true; 
	}); 
	
	$('#psw2').focusout(function(e) {
        if($(this).val()!=$('#psw1').val()){
			$(this).next().text("密码不一致！");
			check=true;
		}else{
			$(this).next().empty();
			check=false;
		}
    });
	});
function show(id){
	$("#third section").css("display","none");
	$("#"+id).css("display","block");
}
</script>
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
    <aside>
      <ul  class="categories">
      		<li>个人中心</li>
        	<li><a href="javascript:show('s01')">个人信息</a></li>
            <li><a href="javascript:show('s03')">修改密码</a></li>
            <li>我的酒店</li>
       	<ul class="ul2">
                	<li><a href="#">已完成</a></li>
                    <li><a href="#">未完成</a></li>
                </ul>
        <li>预定的线路</li>
       	<ul class="ul2">
                	<li><a href="#">已完成</a></li>
                    <li><a href="#">未完成</a></li>
                </ul>
            <li>个人线路</li>
            	<ul class="ul2">
                	<li><a href="#">已完成</a></li>
                    <li><a href="#">未完成</a></li>
                </ul>
            <li>我的游记</li>
            	<ul class="ul2">
                	<li><a href="#">查看</a></li>
                    <li><a href="#">编写</a></li>
                </ul>
        </ul>
    </aside>
    <div class="thridiv">
    	<section id="s01" style="display:block">
        	<h2>个人信息</h2>
            <hr>
            <table>
            	<tr>
                	<td>手机号：</td>
                    <td>18649702665</td>
                </tr>
                <tr>
                	<td>姓名：</td>
                    <td>陈俊雄</td>
                </tr>
                <tr>
                	<td>性别：</td>
                    <td>男</td>
                </tr>
                <tr>
                	<td>邮箱：</td>
                    <td>1059440752@qq.com</td>
                </tr>
                <tr>
                	<td>出生日期：</td>
                    <td>1993-02-07</td>
                </tr>
             </table>
             <hr>
             <span class="button"><a href="javascript:show('s02')">编辑</a></span>
        </section>
        <section id="s02">
        	<h2>个人信息修改</h2>
            <hr>
            <table>
            	<tr>
                	<td>手机号：</td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                	<td>姓名：</td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                	<td>性别：</td>
                    <td><input type="radio" name="sex" value="1">男<input type="radio" name="sex" value="女">女</td>
                </tr>
                <tr>
                	<td>邮箱：</td>
                    <td><input type="email"></td>
                </tr>
                <tr>
                	<td>出生日期：</td>
                    <td><input type="text"></td>
                </tr>
          </table>
             <hr>
             <span class="button"><a href="#">提交</a></span>
        </section>
        <section id="s03">
        	<h2>修改密码</h2>
            <hr>
            <table>
            	<tr>
                    <td><span>*</span>密码：</td>
                    <td><input type="password" name="pwd" required placeholder="请输入6-10位的字符" pattern=".{6,10}" id="psw1"></td>
                    <td id="level" class="pw-strength">           	
                    <div class="pw-bar"></div>
                    <div class="pw-bar-on"></div>
                    <div class="pw-txt">
                    <span>弱</span>
                    <span>中</span>
                    <span>强</span>
                    </div>
                </td>	
                </tr>
                <tr>
                    <td><span>*</span>确认密码：</td>
                    <td colspan="2"><input type="password" name="passWord2" required placeholder="请输入6-10位的字符" id="psw2">&nbsp;<span style="font-size:16px"></span></td>
                </tr>
                <tr><td colspan="2"><span class="button"><a href="#">修改</a></span></td></tr>
            </table>
        </section>
    </div>
</div>
</body>
</html>