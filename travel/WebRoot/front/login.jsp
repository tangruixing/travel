<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/front/lib/inc.jspf" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=contextPath%>/front/lib/jquery.form.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
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
	});
function showResponse(responseText, statusText, xhr, $form) {
	if(responseText.success){
		 location.href ="<%=contextPath%>/index.jsp";
	}else{
		alert("用户名或密码错误！");
	}
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
#back span{
	font-size:26px;
}
#back img{
	position:relative;
	top:5px;
	margin:0 5px;
}
.button{
	background: #006666;
	display: inline-block;
	text-decoration: none;
	border-radius: 5px;
	padding:5px 10px;
	color:#FFF;
}
input{
	font-size: 16px;
	border-radius: 5px;
}
#second{
	margin-left:20px;
	margin-top:20px;
}
</style>
</head>

<body>
<div id="back">
	<span><a href="#">首页</a></span><img src="images/right.png">登录
    <hr>
</div>
<div id="second">
<form action="<%=contextPath%>/front_User_login.do" id="myform">
                <table>
                	<tr><td>手机号：</td><td><input type="text" name="mobile" autocomplete="off"></td></tr>
                    <tr><td>密码：</td><td><input type="password" name="pwd"></td></tr>
                    <tr><td colspan="2" height="40px"><center><input type="submit" value="登录" class="button"></center></td>
                 </table>
</form>
</div>
</body>
</html>
