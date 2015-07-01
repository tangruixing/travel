<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<script type="text/javascript" src="lib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="lib/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="lib/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="lib/jquery.form.min.js"></script>
<link rel="stylesheet" href="lib/jquery-ui-1.10.3.custom.min.css">
<script type="text/javascript">
var check=true; 
var unsubmit=true;
var mobile=true;
   $(document).ready(function(e) {
	 
	   
	//调用datepicker插件在鼠标单击时显示日期选择框
     $("#idDate").datepicker({
		 changeYear:true,
		 yearRange:'-100:'
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
	

	
	var options = { 	        
	        beforeSubmit:  showRequest,  //提交之前的回调函数
	        success:       showResponse,  //提交之后的回调函数
   	        url: '<%=contextPath%>/front/front_User_regist.do',       //覆盖了form的action属性
	        type:     'post',        
	        dataType: 'json',     //(依据服务器返回类型进行设置) 
	        clearForm: true ,      //在成功提交后清除所有的表单域内容
	        resetForm: true ,       //在成功提交后重置所有的表单域内容
	        timeout:   3000 ,
	    };
	     //为表单关联Ajax提交方法
	    $('#myform').ajaxForm(options); 		
		
	     
	    $('#mobile').focusout(function(e) {
	    	if(this.value.length!=11)
	    		return false;
	    	$.ajax({
	    		url: '<%=contextPath%>/front/front_User_registCheck.do', 
	    		data:{"mobile": this.value},//
		        type:     'post',        
		        dataType: 'json',     //(依据服务器返回类型进行设置) 
		        success:function(json){
		        	$('#mobile').next().text(json.msg);
		        	if(json.msg=="该号码已被使用")
		        		mobile=false;
		        	else
		        		mobile=true;
		        },
		        error:function(){
		        	alert("发生错误");
		        }
	    	});
	    });

});
 //表单提交之前触发的事件
   function showRequest(formData, jqForm, options) { 
	   if(!mobile){
		   $('#mobile').focus();
		   return false;
	   }
	   if(check){
			$('#psw2').focus();	//确认密码校验
			return false;
		}	
	   if(!unsubmit)		//防止重复提交
		   return false;
	   unsubmit=false;
   } 
    //表单提交之后触发的事件
   function showResponse(responseText, statusText, xhr, $form)  {    
       //查看表单返回的数据
       if(responseText.success){
    	   alert(responseText.msg);
    	   location.href ="<%=contextPath%>/index.jsp";
       }
       
   } 
</script>
<style type="text/css">
header{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
}
header img{
	width:100%;
}
.content{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:20px;
}
div h1,h2{
	display:inline;
	font-family:"宋体";
}
h2{
	color: #006666;
}
div h1 a{
	color:#000;
	text-decoration:none;
}
div header img{
	width:30px;
	position:relative;
	top:4px;
	margin-left:5px;
	margin-right:5px;
}
section{
	font-size: 20px;
	font-family: "幼圆", "宋体";
	margin-top: 20px;
	border-collapse: collapse;
	border-width: thin;
	border-radius: 10px;
	-webkit-box-shadow: 0px 0px 2px 2px #006666;
	box-shadow: 0px 0px 2px 2px #006666;
	padding: 20px 20px;
	border-color: #006666;
}
section input{
	font-size: 16px;
	border-radius: 5px;
}
section td{
	padding-top:10px;
}
section td:nth-child(odd){
	text-align:right;
}
.button, .button:visited {
	background: #006666;
	display: inline-block;
	padding: 5px 20px 6px;
	color: #fff;
	text-decoration: none;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
	text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
	border-bottom: 1px solid rgba(0,0,0,0.25);
	position: relative;
	cursor: pointer
}
section span{
	color:#F00;
}
.pw-strength {clear: both;position: relative;top: 8px;width: 180px;}
.pw-bar{background: url(lib/images/pwd-1.png) no-repeat;height: 14px;overflow: hidden;width: 179px;}
.pw-bar-on{background:  url(lib/images/pwd-2.png) no-repeat; width:0px; height:14px;position: absolute;top: 10px;left: 2px;transition: width .5s ease-in;-moz-transition: width .5s ease-in;-webkit-transition: width .5s ease-in;-o-transition: width .5s ease-in;}
.pw-weak .pw-defule{ width:0px;}
.pw-weak .pw-bar-on {width: 60px;}
.pw-medium .pw-bar-on {width: 120px;}
.pw-strong .pw-bar-on {width: 179px;}
.pw-txt {padding-top: 2px;width: 180px;overflow: hidden;}
.pw-txt span {color: #707070;float: left;font-size: 12px;text-align: center;width: 58px;}
a:hover{
	text-decoration:underline;
}
</style>
</head>

<body>
<header>
	<img src="images/index_01.jpg">
</header>
<div class="content">
<header>
	<h1><a href="<%=contextPath%>/index.jsp">首页</a></h1><img src="images/right.png"><h2>用户注册</h2>
</header>
<section>
	<form action="<%=contextPath%>/front_User_regist.do" method="post" id="myform">
	<table>
    	<tr>
        	<td><span>*</span>手机：</td>
            <td colspan="2"><input type="text" name="mobile" required pattern="\w{11}" autocomplete="off" id="mobile">&nbsp;<span style="font-size:16px"></span></td>
        </tr>
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
        <tr>
        	<td>邮件：</td>
            <td colspan="2"><input type="email" name="email"></td>
        </tr>
        <tr>
        	<td>用户名：</td>
            <td colspan="2"><input type="text" name="realName"></td>
        </tr>
        <tr>
        	<td>性别：</td>
            <td colspan="2"><input type="radio" name="sex" value="1">男<input type="radio" name="sex" value="2">女</td>
        </tr>
        <tr>
        	<td>生日：</td>
            <td colspan="2"><input type="text" name="birth" id="idDate"></td>
        </tr>
        <tr><td colspan="3"><center><input type="submit" value="注册" class="button"></center></td></tr>
    </table>
    </form>
</section>
</div>
</body>
</html>
