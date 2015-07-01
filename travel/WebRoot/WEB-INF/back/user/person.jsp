<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pub/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<link rel="stylesheet" href="<%=contextPath%>/front/lib/style.css">
<link rel="stylesheet" href="<%=contextPath %>/front/lib/pages.css">
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
	color: #fff;
}
.button a{
	color: #fff;
}
#third section{
	display:none;
}
.pw-strength {clear: both;position: relative;top: 8px;width: 180px;}
.pw-bar{background: url(<%=contextPath%>/front/lib/images/pwd-1.png) no-repeat;height: 14px;overflow: hidden;width: 179px;}
.pw-bar-on{background:  url(<%=contextPath%>/front/lib/images/pwd-2.png) no-repeat; width:0px; height:14px;position: absolute;top: 0px;left: 2px;transition: width .5s ease-in;-moz-transition: width .5s ease-in;-webkit-transition: width .5s ease-in;-o-transition: width .5s ease-in;}
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
input{
	font-size: 16px;
	border-radius: 5px;
}
.footer{
	clear:both;	
	padding-top:30px;
	
}
.travels{
	width: 730px;
	border-collapse: collapse;
	border-bottom: thin solid #33cccc;
	padding-bottom:10px;
	padding-left:10px;
}
.travels:hover{
	background-color:#ecebeb;
}
.travels article{
	overflow:hidden;
	margin-bottom:5px;
}
.travels span{
	float:right;
}
</style>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.ui.datepicker-zh-CN.js"></script>
<link rel="stylesheet" href="<%=contextPath%>/front/lib/jquery-ui-1.10.3.custom.min.css">
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.form.min.js"></script>
<script type="text/javascript">
var check=true;
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
	
	//调用datepicker插件在鼠标单击时显示日期选择框
    $("#idDate").datepicker({
		 changeYear:true,
		 yearRange:'-100:'
		 });
	
    var options = { 	        
	        success: function(responseText){
	        	if(responseText.success){
	         	   alert("修改成功！");	         	 
	            }else
	            	alert(responseText.msg);
	        	history.go(0);
	        },  //提交之后的回调函数
   	        url: '<%=contextPath%>/user_changeInfo.do',       //覆盖了form的action属性
	        type:     'post',        
	        dataType: 'json',     //(依据服务器返回类型进行设置) 
	        clearForm: true ,      //在成功提交后清除所有的表单域内容
	        resetForm: true ,       //在成功提交后重置所有的表单域内容
	        timeout:   3000 ,
	    };
	     //为表单关联Ajax提交方法
	    $('#changeInfoform').ajaxForm(options); 
	     
	     
	    var options2= { 	        
		        beforeSubmit:  function(){
		        	if(check){
		    			$('#psw2').focus();	//确认密码校验
		    			return false;
		    		}
		        },  //提交之前的回调函数
		        success:   function(responseText){
		        	if(responseText.success){
			         	   alert("修改成功！");	         	 
			            }else
			            	alert(responseText.msg);
			        },  //提交之后的回调函数
	   	        url: '<%=contextPath%>/user_changePsw.do',       //覆盖了form的action属性
		        type:     'post',        
		        dataType: 'json',     //(依据服务器返回类型进行设置) 
		        clearForm: true ,      //在成功提交后清除所有的表单域内容
		        resetForm: true ,       //在成功提交后重置所有的表单域内容
		        timeout:   3000 ,
		    };
		     //为表单关联Ajax提交方法
		    $('#changePsw').ajaxForm(options2); 
	});
function show(id){
	$("#third section").css("display","none");
	$("#"+id).css("display","block");
}
</script>
</head>

<body>
<jsp:include page="${contextPath}/front/nav.jsp"></jsp:include>
<div id="third">
    <aside>
      <ul  class="categories">
      		<li>个人中心</li>
        	<li><a href="javascript:show('s01')">个人信息</a></li>
            <li><a href="javascript:show('s03')">修改密码</a></li>
            <li>我的酒店订单</li>
       	<ul class="ul2">
                	<li><a href="javascript:show('s04')">已入住</a></li>
                    <li><a href="javascript:show('s05')">未入住</a></li>
                </ul>
        <li><a href="javascript:show('s06')">预定的线路</a></li>
        <li><a href="javascript:show('s07')">收藏的线路</a></li>
        <li>我的游记</li>
            	<ul class="ul2">
                	<li><a href="javascript:show('s08')">查看游记</a></li>
                    <li><a href="<%=contextPath%>/travels_goNewTravel.do">编写游记</a></li>
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
                    <td>${loginUser.mobile }</td>
                </tr>
                <tr>
                	<td>用户名：</td>
                    <td>${loginUser.realName }</td>
                </tr>
                <tr>
                	<td>性别：</td>
                    <td>${loginUser.sex==1?'男':'女' }</td>
                </tr>
                <tr>
                	<td>邮箱：</td>
                    <td>${loginUser.email }</td>
                </tr>
                <tr>
                	<td>出生日期：</td>
                    <td><fmt:formatDate value="${loginUser.birth}" pattern="yyyy-MM-dd"/></td>
                </tr>
             </table>
             <hr>
             <span class="button"><a href="javascript:show('s02')">编辑</a></span>
        </section>
        <section id="s02">
        	<h2>个人信息修改</h2>
            <hr>
            <form id="changeInfoform">
            <table>
            	<tr>
                	<td>手机号：</td>
                    <td><input type="text" value="${loginUser.mobile }" readonly="readonly"></td>
                </tr>
                <tr>
                	<td>用户名：</td>
                    <td><input type="text"  value="${loginUser.realName }"  name="realName"></td>
                </tr>
                <tr>
                	<td>性别：</td>
                    <td><s:if test="#session.loginUser.sex==1"><input type="radio" name="sex" value="1" checked>男<input type="radio" name="sex" value="2">女</s:if>
                    <s:else><input type="radio" name="sex" value="1">男<input type="radio" name="sex" value="2" checked>女</s:else></td>
                </tr>
                <tr>
                	<td>邮箱：</td>
                    <td><input type="email" value="${loginUser.email }" name="email"></td>
                </tr>
                <tr>
                	<td>出生日期：</td>
                    <td><input type="text" id="idDate" name="birth" value="<fmt:formatDate value="${loginUser.birth}" pattern="yyyy-MM-dd"/>" readonly="readonly"></td>
                </tr>
          </table>
             <hr><input type="hidden" name="id" value="${loginUser.id }">
             <span><input type="submit" value="提交" class="button"></span>
             
          </form>
        </section>
        <section id="s03">
        	<h2>修改密码</h2>
            <hr>
            <form id="changePsw">
            <table>
            	<tr>
                    <td><span>*</span>原密码：</td>
                    <td colspan="2"><input type="password" name="oldPwd" required ></td>
                </tr>
            	<tr>
                    <td><span>*</span>新密码：</td>
                    <td><input type="password" name="newPwd" required placeholder="请输入6-10位的字符" pattern=".{6,10}" id="psw1"></td>
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
                    <td colspan="2"><input type="password" name="confirmPwd" required placeholder="请输入6-10位的字符" id="psw2">&nbsp;<span style="font-size:16px"></span></td>
                </tr>
                <tr><td colspan="2"><input type="submit" value="修改" class="button"></td></tr>
            </table>
            </form>
        </section>
        
        <section id="s04">
        	<s:action name="roombook_toList" executeResult="true">
				<s:param name="page">1</s:param>
				<s:param name="type">1</s:param>
				<s:param name="rows">5</s:param>
			</s:action>
        </section>
        
        <%-- <section id="s05">
        	<s:action name="travels_toList" executeResult="true">
				<s:param name="page">1</s:param>
				<s:param name="rows">5</s:param>
			</s:action>
        </section>
         
        <section id="s06">
        	<s:action name="travels_toList" executeResult="true">
				<s:param name="page">1</s:param>
				<s:param name="rows">5</s:param>
			</s:action>
        </section>
          
        <section id="s07">
        	<s:action name="travels_toList" executeResult="true">
				<s:param name="page">1</s:param>
				<s:param name="rows">5</s:param>
			</s:action>
        </section> --%>
        
        <section id="s08">
        	<s:action name="travels_toList" executeResult="true">
				<s:param name="page">1</s:param>
				<s:param name="rows">5</s:param>
			</s:action>
        </section>
    </div>
</div>
<footer class="footer">
<!-- 友情链接 -->
  	<s:action name="front_Friendlink_toList" executeResult="true" namespace="/front">
	<s:param name="page">1</s:param>
	<s:param name="rows">18</s:param>
	</s:action>
</footer>
</body>
</html>
